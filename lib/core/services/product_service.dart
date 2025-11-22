import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/db/isar_service.dart';
import 'package:polymdex/core/db/polymer_model.dart';
import 'package:polymdex/core/db/producer_model.dart';
import 'package:polymdex/core/db/product_model.dart';
import 'package:polymdex/core/db/user_session.dart';
import 'package:polymdex/controllers/global_controller.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';

class ProductService extends GetxService {
  final IsarService isarService = IsarService();
  final GlobalController globalController = Get.find<GlobalController>();

  final RxList<String> selections = <String>[].obs;
  final RxString selectedPolymer = ''.obs;
  final RxString selectedProducer = ''.obs;
  final RxString grade = ''.obs;

  final List<String> producers = [
    'Braskem',
    'ExxonMobil',
    'LyondellBasell',
    'Dow',
    'Sabic',
    'Chevron Phillips Chemical',
    'Formosa Plastics',
    'Westlake',
    'Nova Chemicals',
    'Equistar',
    'Borealis',
    'Baystar',
    'Hanwha',
    'Ineos',
    'LG Chemical',
    'Lotte Chemical',
    'Mitsui Chemical',
    'SK Chemicals',
    'Total Energies',
    'Ethydco',
    'Sinopec',
    'Daelim',
    'Orpic',
  ];

  // ---------------------------
  // Métodos de seleção
  // ---------------------------
  void selectPolymer(String polymer) {
    selectedPolymer.value = polymer;
    selections.removeWhere((s) => s.startsWith('Polymer:'));
    selections.add('Polymer:$polymer');
    _printSelections();
  }

  void selectProducer(String producer) {
    selectedProducer.value = producer;
    selections.removeWhere((s) => s.startsWith('Producer:'));
    selections.add('Producer:$producer');
    _printSelections();
  }

  void addSelection(String key, String value) {
    final entry = '$key:$value';
    final idx = selections.indexWhere((s) => s.startsWith('$key:'));
    if (idx >= 0) {
      selections[idx] = entry;
    } else {
      selections.add(entry);
    }
    _printSelections();
  }

  void removeSelectionByKey(String key) {
    selections.removeWhere((s) => s.startsWith('$key:'));
    _printSelections();
  }

  Future<Map<String, String>?> getProductDocument(int productId) async {
    try {
      final isar = await isarService.db;
      final session = globalController.userSession.value!;
      final product = await isar.productModels.get(productId);

      if (product?.userId != session.id) return null;

      if (product == null) {
        print('[ProductService] ❌ Produto não encontrado (id=$productId).');
        return null;
      }

      if (product.documentPath == null || product.documentName == null) {
        print('[ProductService] ⚠️ Produto sem documento (id=$productId).');
        return null;
      }

      return {'path': product.documentPath!, 'name': product.documentName!};
    } catch (e) {
      print('[ProductService] ❌ Erro ao obter documento: $e');
      return null;
    }
  }

  void _printSelections() {
    print('[ProductService] -> Selections: ${selections.join(' | ')}');
  }

  // ---------------------------
  // Consulta filtrada no Isar
  // ---------------------------
  Future<List<ProductModel>> getFilteredProducts() async {
    final isar = await isarService.db;
    print(
      '[ProductService] 🔍 Iniciando busca com filtros: ${selections.join(" | ")}',
    );

    final mi = parseDouble('MI');
    final density = parseDouble('Density');
    final polymer = parseString('Polymer');
    final producer = parseString('Producer');
    final grade = parseString('Grade');
    final comonomer = parseString('Comonomer');

    // --- CORREÇÃO AQUI ---

    // 1. Comece com .filter()
    final session = globalController.userSession.value!;
    var query = isar.productModels.filter().userIdEqualTo(session.id);

    // 2. Use .optional() para encadear os filtros
    final results = await query
        .optional(mi != null, (q) => q.miEqualTo(mi!))
        .optional(density != null, (q) => q.densityEqualTo(density!))
        .optional(
          polymer != null && polymer.isNotEmpty,
          (q) => q.polymer((p) => p.nameEqualTo(polymer!)),
        )
        .optional(
          producer != null && producer.isNotEmpty,
          (q) => q.producer((p) => p.nameEqualTo(producer!)),
        )
        .optional(
          grade != null && grade.isNotEmpty,
          (q) => q.gradeEqualTo(grade!),
        )
        .optional(
          comonomer != null && comonomer.isNotEmpty,
          (q) => q.comonomerEqualTo(comonomer!),
        )
        .findAll(); // 3. Chame .findAll() no final

    // --- FIM DA CORREÇÃO ---

    print('[ProductService] ✅ ${results.length} produtos encontrados.');
    NavigationService.pageToNamed(
      AppRoutes.search,
      arguments: {'showSearchBar': false},
    );
    return results;
  }

  Future<Map<String, String>?> saveDocumentInternally(PlatformFile file) async {
    if (file.path == null) return null;

    final originalFile = File(file.path!);

    final dir = await getApplicationDocumentsDirectory();
    final savedPath = '${dir.path}/${file.name}';

    await originalFile.copy(savedPath);

    print('[ProductService] 📄 Documento salvo internamente: $savedPath');

    return {'path': savedPath, 'name': file.name};
  }

  Future<List<ProductModel>> searchByGrade(String query) async {
    if (query.isEmpty) return [];

    try {
      final isar = await isarService.db;
      final session = globalController.userSession.value!;

      final results = await isar.productModels
          .filter()
          .userIdEqualTo(session.id)
          .gradeContains(query, caseSensitive: false)
          .findAll();

      print(
        '[ProductService] 🔍 ${results.length} produtos encontrados para "$query"',
      );
      return results;
    } catch (e, st) {
      print('[ProductService] ❌ Erro ao buscar produtos por grade: $e');
      print(st);
      return [];
    }
  }

  // ---------------------------
  // Métodos auxiliares
  // ---------------------------
  double? parseDouble(String key) {
    final entry = selections.firstWhereOrNull((s) => s.startsWith('$key:'));
    if (entry == null) return null;
    return double.tryParse(entry.split(':').last.trim());
  }

  String? parseString(String key) {
    final entry = selections.firstWhereOrNull((s) => s.startsWith('$key:'));
    return entry?.split(':').last.trim();
  }

  bool? parseBool(String key) {
    final entry = selections.firstWhereOrNull((s) => s.startsWith('$key:'));
    if (entry == null) return null;
    final value = entry.split(':').last.trim().toLowerCase();
    return value == 'sim' || value == 'true';
  }

  Future<bool> saveProduct({
    PlatformFile? documentFile,
    String? documentName,
  }) async {
    try {
      final isar = await isarService.db;
      print('[ProductService] -> Salvando produto...');

      // ---------------------------
      // GARANTE USUÁRIO
      // ---------------------------
      final session = globalController.userSession.value;
      if (session == null) {
        Get.snackbar('Erro', 'Nenhum usuário logado.');
        return false;
      }

      UserSession? userDb = await isar.userSessions.get(session.id);

      // cria UserSession local caso não exista
      if (userDb == null) {
        print('[ProductService] 👤 Criando UserSession local...');
        userDb = UserSession()
          ..id = session.id
          ..nome = session.nome
          ..email = session.email;

        await isar.writeTxn(() async {
          await isar.userSessions.put(userDb!);
        });
      }

      // ---------------------------
      // MODELOS BÁSICOS (EVITA DUPLICAÇÃO)
      // ---------------------------
      final polymerName = selectedPolymer.value.isNotEmpty
          ? selectedPolymer.value
          : 'SEM_POLYMER';

      final producerName = selectedProducer.value.isNotEmpty
          ? selectedProducer.value
          : 'SEM_PRODUCER';

      // busca se já existe polymer
      final existingPolymer = await isar.polymerModels
          .filter()
          .nameEqualTo(polymerName)
          .findFirst();

      final polymer = existingPolymer ?? PolymerModel()
        ..name = polymerName;

      // busca se já existe producer
      final existingProducer = await isar.producerModels
          .filter()
          .nameEqualTo(producerName)
          .findFirst();

      final producer = existingProducer ?? ProducerModel()
        ..name = producerName;

      // ---------------------------
      // CRIA PRODUTO
      // ---------------------------
      final product = ProductModel()
        ..userId = session.id
        ..grade = grade.value.isNotEmpty ? grade.value : 'Grade-$polymerName'
        ..mi = parseDouble('MI') ?? 0.0
        ..density = parseDouble('Density') ?? 0.0
        ..processingAid = parseBool('ProcessingAid')
        ..antiblock = parseBool('Antiblock')
        ..mwd = parseString('MWD')
        ..comonomer = parseString('Comonomer')
        ..comonomerContent = parseDouble('ComonomerContent')
        ..additives = selections
            .where((s) => s.startsWith('Additive:'))
            .map((s) => s.split(':').last.trim())
            .toList();

      product.polymer.value = polymer;
      product.producer.value = producer;

      // ---------------------------
      // DOCUMENTO
      // ---------------------------
      final homeController = Get.find<HomeController>();
      final selectedDoc =
          documentFile ?? homeController.selectedDocumentFile.value;

      if (selectedDoc != null) {
        print('[ProductService] 📄 Salvando documento...');
        final saved = await saveDocumentInternally(selectedDoc);
        if (saved != null) {
          product.documentPath = saved['path'];
          product.documentName = saved['name'];
        }
      }

      // ---------------------------
      // TRANSAÇÃO FINAL
      // ---------------------------
      await isar.writeTxn(() async {
        // salva polymer/producer somente se forem novos
        await isar.polymerModels.put(polymer);
        await isar.producerModels.put(producer);

        // salva produto
        final productId = await isar.productModels.put(product);
        product.id = productId;

        await product.polymer.save();
        await product.producer.save();

        // mantém link se quiser (opcional agora)
        userDb!.products.add(product);
        await userDb.products.save();
        await isar.userSessions.put(userDb);

        print(
          '[ProductService] IDs -> polymer=${polymer.id} | producer=${producer.id} | product=$productId',
        );
      });

      print('[ProductService] ✅ Produto salvo com sucesso!');
      Get.snackbar('Sucesso', 'Produto salvo com sucesso!');
      return true;
    } catch (e, st) {
      print('[ProductService] ❌ Erro: $e');
      print(st);
      Get.snackbar('Erro', 'Falha ao salvar produto: $e');
      return false;
    }
  }

  // ---------------------------
  // Retorna todos os GRADES únicos
  // ---------------------------
  Future<List<String>> getAllGrades() async {
    final isar = await isarService.db;

    print('[ProductService] 🔍 Buscando todos os grades...');

    // Busca todos os produtos e extrai apenas o campo grade
    final session = globalController.userSession.value!;
    final grades = await isar.productModels
        .filter()
        .userIdEqualTo(session.id)
        .gradeProperty()
        .findAll();

    // Remove duplicatas e valores nulos/vazios
    final uniqueGrades =
        grades
            .whereType<String>()
            .where((g) => g.trim().isNotEmpty)
            .toSet()
            .toList()
          ..sort(); // opcional: ordena A-Z

    print('[ProductService] ✅ ${uniqueGrades.length} grades encontrados.');
    return uniqueGrades;
  }
}
