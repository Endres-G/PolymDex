import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/core/db/product_model.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';
import 'package:polymdex/controllers/global_controller.dart';
import 'package:polymdex/core/services/product_service.dart';
import 'package:open_filex/open_filex.dart';

class HomeController extends GetxController {
  final ProductService productService = Get.put(ProductService());
  final GlobalController globalController = Get.find<GlobalController>();

  final RxBool isLoading = false.obs;
  final RxString userName = 'Usuario'.obs;
  final RxInt currentStep = 0.obs;
  final RxDouble mi = 0.05.obs;
  final RxDouble density = 0.800.obs;
  final RxDouble comonomerContent = 0.0.obs;
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController miController = TextEditingController();
  final TextEditingController densityController = TextEditingController();
  final RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  final RxList<String> allGrades = <String>[].obs;
  final selectedDocument = Rxn<File>();
  final selectedDocumentFile = Rx<PlatformFile?>(null);
  final selectedDocumentName = Rx<String?>(null);

  @override
  void onInit() async {
    super.onInit();
    await productService.getAllProducts();
    // carrega inicial
    _loadUserNameSafe();

    // fica ouvindo mudanças no userSession
    ever(globalController.userSession, (_) {
      _loadUserNameSafe();
    });

    gradeController.text = productService.grade.value;
    miController.text = mi.value.toStringAsFixed(2);
    densityController.text = density.value.toStringAsFixed(3);
  }

  void _disposeFormData() {
    // 🔹 Text fields
    gradeController.clear();
    miController.clear();
    densityController.clear();

    // 🔹 Valores numéricos padrão
    mi.value = 0.05;
    density.value = 0.800;
    comonomerContent.value = 0.0;

    // 🔹 Steps
    currentStep.value = 0;

    // 🔹 Resultados
    filteredProducts.clear();

    // 🔹 Documento
    selectedDocument.value = null;
    selectedDocumentFile.value = null;
    selectedDocumentName.value = null;

    // 🔹 ProductService (estado global)
    productService.selections.clear();
    productService.grade.value = '';
    productService.selectedProducer.value = '';
    productService.selectedPolymer.value = '';

    print('[HomeController] 🔄 Formulário resetado completamente');
  }

  @override
  void onClose() {
    gradeController.dispose();
    miController.dispose();
    densityController.dispose();
    super.onClose();
  }

  void setDocumentFile(PlatformFile file) {
    selectedDocumentFile.value = file;
  }

  Future<void> loadGrades() async {
    final grades = await productService.getAllGrades();
    allGrades.assignAll(grades);
  }

  Future<void> openProductDocument(int productId) async {
    try {
      final doc = await productService.getProductDocument(productId);

      if (doc == null) {
        Get.snackbar(
          'Documento',
          'Nenhum documento encontrado para este produto.',
        );
        return;
      }

      final path = doc['path']!;
      final file = File(path);

      // Verifica se o arquivo existe fisicamente
      if (!await file.exists()) {
        print("[HomeController] ❌ Arquivo não existe em: $path");

        Get.snackbar('Erro', 'O documento não foi encontrado no dispositivo.');
        return;
      }

      print("[HomeController] 📄 Abrindo arquivo: $path");

      final result = await OpenFilex.open(path);
      print("[HomeController] → Resultado: ${result.type}");

      if (result.type != ResultType.done) {
        Get.snackbar("Erro", "Não foi possível abrir o documento.");
      }
    } catch (e) {
      print("[HomeController] ❌ Erro ao abrir documento: $e");
      Get.snackbar("Erro", "Falha ao abrir o documento: $e");
    }
  }

  Future<void> loadFilteredProducts() async {
    isLoading.value = true;
    try {
      productService.selections.clear();
      filteredProducts.clear();
      productService.selectedProducer.value = '';
      productService.selectedPolymer.value = '';

      final results = await productService.getFilteredProducts();
      filteredProducts.assignAll(results);
    } catch (e) {
      print('[HomeController] ❌ Erro ao buscar produtos filtrados: $e');
      Get.snackbar('Erro', 'Falha ao buscar produtos: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void handleBack() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  }

  void nextStep() {
    if (currentStep.value == 1) {
      // step 1 -> step 2
      print('[CreateProductView] -> Avançou para etapa 2');
    } else if (currentStep.value == 2) {
      // antes de ir pra step 3, salva MI e densidade
      _saveMiAndDensity();
      print('[CreateProductView] -> Avançou para etapa 3');
    }

    currentStep.value++;
  }

  void _saveMiAndDensity() {
    // salva MI
    final miEntry = 'MI:${mi.value.toStringAsFixed(2)}';
    final miIndex = productService.selections.indexWhere(
      (s) => s.startsWith('MI:'),
    );
    if (miIndex >= 0) {
      productService.selections[miIndex] = miEntry;
    } else {
      productService.selections.add(miEntry);
    }

    // salva densidade
    final densityEntry = 'Density:${density.value.toStringAsFixed(3)}';
    final densityIndex = productService.selections.indexWhere(
      (s) => s.startsWith('Density:'),
    );
    if (densityIndex >= 0) {
      productService.selections[densityIndex] = densityEntry;
    } else {
      productService.selections.add(densityEntry);
    }
  }

  // 🔎 Busca produtos por grade (usando o service)
  Future<void> searchByGrade(String query) async {
    if (query.isEmpty) {
      filteredProducts.clear();
      return;
    }

    isLoading.value = true;

    final results = await productService.searchByGrade(query);
    filteredProducts.assignAll(results);

    isLoading.value = false;
  }

  /// Retorna todos os grades
  Future<List<String>> getAllGrades() async {
    return await productService.getAllGrades();
  }

  String normalize(String? value) {
    if (value == null) return '';
    return value.trim(); // SEM .toUpperCase()
  }

  Future<void> filterProducts() async {
    print("[HomeController] 🔎 filterProducts chamado!");

    // 🔥 Sempre começa limpando
    productService.selections.clear();
    filteredProducts.clear();

    // 🔥 Normaliza valores
    productService.selectedPolymer.value = normalize(
      productService.selectedPolymer.value,
    );

    productService.selectedProducer.value = normalize(
      productService.selectedProducer.value,
    );

    productService.grade.value = normalize(productService.grade.value);

    // 🔥 Atualiza selections corretamente
    _updateSelections();

    print("[HomeController] Selections enviadas para o service:");
    print(productService.selections);

    isLoading.value = true;

    try {
      final results = await productService.getFilteredProducts();
      filteredProducts.assignAll(results);
    } catch (e) {
      print("[HomeController] ❌ Erro no filterProducts: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Salva novo produto
  Future<void> saveProduct() async {
    await productService.saveProduct();
  }

  Future<void> searchByPolymer(String polymer) async {
    print("------------------------------------------------");
    print("[HomeController] 🔍 searchByPolymer chamado");
    print("[HomeController] Polymer recebido = '$polymer'");

    print("------------------------------------------------");

    final normalized = polymer.trim().toUpperCase();

    isLoading.value = true;
    try {
      // 🔥 LIMPA TUDO CORRETAMENTE ANTES
      print("[HomeController] Limpando filtros antes...");
      productService.selections.clear();
      filteredProducts.clear();

      productService.selectedProducer.value = '';
      productService.selectedPolymer.value = normalized;

      print(
        "[HomeController] selectedPolymer DEFINIDO como ${productService.selectedPolymer.value}",
      );

      // 🔥 GARANTE FILTRO EXATO por polimero
      productService.addSelection('Polymer', normalized);

      print("[HomeController] selections ENVIADO para o service:");
      print(productService.selections);

      // 🔥 CHAMA O SERVICE
      final results = await productService.getFilteredProducts();

      // 🔥 FILTRA DE NOVO AQUI NA TELA (SEGURANÇA EXTRA)
      final strictResults = results.where((p) {
        final polyName = p.polymer.value?.name.trim().toUpperCase();
        return polyName == normalized; // <--- IGUALDADE EXATA
      }).toList();

      print(
        "[HomeController] 🔎 Produtos recebidos DO SERVICE = ${results.length}",
      );
      print(
        "[HomeController] 🔎 Produtos após filtro ESTRITO = ${strictResults.length}",
      );

      for (var p in strictResults) {
        print(
          " -> productId=${p.id}, grade=${p.grade}, polymerId=${p.polymer.value?.id}, polymerName=${p.polymer.value?.name}",
        );
      }

      filteredProducts.assignAll(strictResults);

      print(
        "[HomeController] 🧮 Controller carregou ${filteredProducts.length} produtos",
      );
    } catch (e) {
      print('[HomeController] ❌ Erro ao buscar produtos de $polymer: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveProductToIsar() async {
    isLoading.value = true;
    try {
      await productService.saveProduct(
        documentFile: selectedDocumentFile.value, // <-- adiciona isso
        documentName: selectedDocumentName.value, // <-- adiciona isso
      );
      // depois de salvar, limpa os campos e resetas os valores
      _disposeFormData();

      // navega de volta pra home
      NavigationService.pageOffAndToNamed(AppRoutes.home);
    } catch (e) {
      print('[HomeController] ❌ Erro ao salvar produto: $e');
      Get.snackbar('Erro', 'Falha ao salvar produto: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadUserNameSafe() async {
    final session = globalController.userSession.value;
    if (session == null) return;
    userName.value = session.nome;
  }

  /// Sincroniza filtros do controller para o ProductService.selections
  void _updateSelections() {
    productService.selections.clear();

    // Polymer
    if (productService.selectedPolymer.value.isNotEmpty) {
      productService.addSelection(
        'Polymer',
        productService.selectedPolymer.value,
      );
    }

    // Producer
    if (productService.selectedProducer.value.isNotEmpty) {
      productService.addSelection(
        'Producer',
        productService.selectedProducer.value,
      );
    }

    // Grade
    if (productService.grade.value.isNotEmpty) {
      productService.addSelection('Grade', productService.grade.value);
    }

    // MI
    productService.addSelection('MI', mi.value.toStringAsFixed(2));

    // Density
    productService.addSelection('Density', density.value.toStringAsFixed(3));

    // Comonomer
    if (comonomerContent.value > 0) {
      productService.addSelection(
        'Comonomer',
        comonomerContent.value.toString(),
      );
    }

    print(
      '[HomeController] 🔍 Selections atualizadas: ${productService.selections}',
    );
  }

  void sair() {
    globalController.clearUserSession();
    NavigationService.pageOffAndToNamed(AppRoutes.login);
  }
}
