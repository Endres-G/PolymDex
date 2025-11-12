import 'package:get/get.dart';
import 'package:polymdex/core/db/isar_service.dart';
import 'package:polymdex/core/db/polymer_model.dart';
import 'package:polymdex/core/db/producer_model.dart';
import 'package:polymdex/core/db/product_model.dart';
import 'package:polymdex/core/db/user_session.dart';
import 'package:polymdex/controllers/global_controller.dart';

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

  void _printSelections() {
    print('[ProductService] -> Selections: ${selections.join(' | ')}');
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

  // ---------------------------
  // Persistência no Isar
  // ---------------------------
  Future<bool> saveProduct() async {
    try {
      final isar = await isarService.db;
      print('[ProductService] -> Salvando produto...');

      final polymerName = selectedPolymer.value.isNotEmpty
          ? selectedPolymer.value
          : 'SEM_POLYMER';
      final producerName = selectedProducer.value.isNotEmpty
          ? selectedProducer.value
          : 'SEM_PRODUCER';

      final polymer = PolymerModel()..name = polymerName;
      final producerModel = ProducerModel()..name = producerName;

      // --- Cria produto com base nas seleções ---
      final product = ProductModel()
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

      product.producer.value = producerModel;
      product.polymer.value = polymer;

      // --- Recupera usuário logado ---
      UserSession? dbUser;
      final session = globalController.userSession.value;
      if (session != null) {
        dbUser = await isar.userSessions.get(session.id);
        if (dbUser == null) {
          final newUser = UserSession()
            ..id = session.id
            ..nome = session.nome
            ..email = session.email;

          await isar.writeTxn(() async {
            await isar.userSessions.put(newUser);
          });
          dbUser = await isar.userSessions.get(newUser.id);
        }
      }

      // --- Transação de gravação ---
      await isar.writeTxn(() async {
        final polymerId = await isar.polymerModels.put(polymer);
        final producerId = await isar.producerModels.put(producerModel);
        final productId = await isar.productModels.put(product);

        print(
          '[ProductService] -> polymerId=$polymerId | producerId=$producerId | productId=$productId',
        );

        await product.polymer.save();
        await product.producer.save();

        if (dbUser != null) {
          dbUser.products.add(product);
          await dbUser.products.save();
          await isar.userSessions.put(dbUser);
          print(
            '[ProductService] -> Produto vinculado ao usuário ${dbUser.id}',
          );
        }
      });

      print('[ProductService] ✅ Produto salvo com sucesso!');
      print(
        '[ProductService] -> Dados salvos: MI=${product.mi}, Density=${product.density}, Additives=${product.additives?.join(', ')}',
      );

      Get.snackbar('Sucesso', 'Produto salvo com sucesso!');
      return true;
    } catch (e, st) {
      print('[ProductService] ❌ Erro ao salvar produto: $e');
      print(st);
      Get.snackbar('Erro', 'Falha ao salvar produto: $e');
      return false;
    }
  }
}
