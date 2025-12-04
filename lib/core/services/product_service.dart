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

    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    print('[ProductService] 🔍 Filtros recebidos: ${selections.join(" | ")}');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    // --- Carregar valores dos filtros ---
    final mi = parseDouble('MI');
    final density = parseDouble('Density');
    final polymerName = parseString('Polymer');
    final producerName = parseString('Producer');
    final grade = parseString('Grade');
    final comonomer = parseString('Comonomer');

    final session = globalController.userSession.value!;
    print('[ProductService] 👤 Sessão atual -> userId=${session.id}\n');

    // ------------------------------
    // DEBUG -> Produtos no banco
    // ------------------------------
    final all = await isar.productModels.where().findAll();
    print('[ProductService] 📦 Produtos no banco (${all.length}):');
    for (var p in all) {
      print(
        '  - id=${p.id} | grade=${p.grade} | userId=${p.userId} | '
        'polymer=${p.polymer.value?.name} | producer=${p.producer.value?.name}',
      );
    }
    print('------------------------------------------------------\n');

    // ------------------------------
    // Construção do filtro base
    // ------------------------------
    var query = isar.productModels.filter().userIdEqualTo(session.id);
    print('[ProductService] 🎯 Filtro inicial -> userId=${session.id}');

    if (mi != null) {
      print('[Filtro] MI = $mi');
      query = query.miEqualTo(mi);
    }

    if (density != null) {
      print('[Filtro] Density = $density');
      query = query.densityEqualTo(density);
    }

    // ------------------------------
    // Filtro de Polymer (por ID)
    // ------------------------------
    if (polymerName != null && polymerName.isNotEmpty) {
      print('[Filtro] Polymer = $polymerName');

      final targetPoly = await isar.polymerModels
          .filter()
          .nameContains(polymerName)
          .findFirst();

      if (targetPoly != null) {
        print(
          '[Filtro] Polymer encontrado -> id=${targetPoly.id}, name=${targetPoly.name}',
        );
        query = query.polymer((p) => p.idEqualTo(targetPoly.id));
      } else {
        print(
          '[Filtro] ❌ Polymer "$polymerName" não encontrado -> filtro ignorado',
        );
      }
    }

    // ------------------------------
    // Producer (por nome)
    // ------------------------------
    if (producerName != null && producerName.isNotEmpty) {
      print('[Filtro] Producer = $producerName');
      query = query.producer((p) => p.nameEqualTo(producerName));
    }

    if (grade != null && grade.isNotEmpty) {
      print('[Filtro] Grade = $grade');
      query = query.gradeEqualTo(grade);
    }

    if (comonomer != null && comonomer.isNotEmpty) {
      print('[Filtro] Comonomer = $comonomer');
      query = query.comonomerEqualTo(comonomer);
    }

    print('------------------------------------------------------');

    // ------------------------------
    // Executa a query final
    // ------------------------------
    final results = await query.findAll();
    print(
      '[ProductService] ✅ ${results.length} produtos encontrados para userId=${session.id}\n',
    );

    Get.find<HomeController>().filteredProducts.assignAll(results);

    // ------------------------------
    // PRINT detalhado de cada produto
    // ------------------------------
    for (var p in results) {
      print('📦 Produto encontrado:');
      print('   • productId: ${p.id}');
      print('   • grade: ${p.grade}');
      print('   • pertence ao userId: ${p.userId}');
      print(
        '   • polymer: ${p.polymer.value?.name} (id=${p.polymer.value?.id})',
      );
      print(
        '   • producer: ${p.producer.value?.name} (id=${p.producer.value?.id})',
      );
      print('   • MI: ${p.mi}');
      print('   • Density: ${p.density}');
      print('   • Comonomer: ${p.comonomer}');
      print('   • Additives: ${p.additives}');
      print('------------------------------------------------------');
    }

    // ------------------------------
    // Navegação
    // ------------------------------
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
          .nameContains(polymerName)
          .findFirst();

      final polymer = existingPolymer ?? PolymerModel()
        ..name = polymerName;

      // busca se já existe producer
      final existingProducer = await isar.producerModels
          .filter()
          .nameContains(producerName)
          .findFirst();

      final producer = existingProducer ?? ProducerModel()
        ..name = producerName;

      // ---------------------------
      // CRIA PRODUTO
      // ---------------------------
      final product = ProductModel()
        ..userId = session.id
        ..grade = grade.value.isNotEmpty ? grade.value : 'Grade-$polymerName'
        ..mi = parseDouble('MI') ?? 0.05
        ..density = parseDouble('Density') ?? 0.800
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

  Future<List<ProductModel>> getAllProducts() async {
    final isar = await isarService.db;

    final products = await isar.productModels.where().findAll();

    print("📦 [ProductService] Listando TODOS os produtos no banco:");
    for (var p in products) {
      print(
        " - id=${p.id} | grade=${p.grade} | userId=${p.userId} | polymer=${p.polymer} | producer=${p.producer}",
      );
    }

    return products;
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
