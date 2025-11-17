import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/core/db/product_model.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';
import 'package:polymdex/controllers/global_controller.dart';
import 'package:polymdex/core/services/product_service.dart';

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

  @override
  void onInit() {
    super.onInit();

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

  Future<void> loadGrades() async {
    final grades = await productService.getAllGrades();
    allGrades.assignAll(grades);
  }

  Future<void> loadFilteredProducts() async {
    isLoading.value = true;
    try {
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

  /// Chama a filtragem geral (com filtros compostos)
  Future<void> filterProducts() async {
    isLoading.value = true;
    final results = await productService.getFilteredProducts();
    filteredProducts.assignAll(results);
    isLoading.value = false;
  }

  /// Salva novo produto
  Future<void> saveProduct() async {
    await productService.saveProduct();
  }

  Future<void> searchByPolymer(String polymer) async {
    isLoading.value = true;
    try {
      productService.selections.clear();
      productService.addSelection('Polymer', polymer);

      final results = await productService.getFilteredProducts();

      // salva direto no controller
      filteredProducts.assignAll(results);

      // navega para a tela
      NavigationService.pageToNamed(AppRoutes.search);

      print(
        '[HomeController] 🧮 ${filteredProducts.length} produtos carregados',
      );
    } catch (e) {
      print('[HomeController] ❌ Erro ao buscar produtos de $polymer: $e');
      Get.snackbar('Erro', 'Falha ao buscar produtos de $polymer');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveProductToIsar() async {
    isLoading.value = true;
    try {
      await productService.saveProduct();

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

  // método privado que reseta os dados do formulário
  void _disposeFormData() {
    gradeController.clear();
    miController.clear();
    densityController.clear();

    mi.value = 0.05;
    density.value = 0.800;
    comonomerContent.value = 0.0;

    currentStep.value = 0;
    filteredProducts.clear();
    productService.selections.clear();
    productService.grade.value = '';
  }

  Future<void> _loadUserNameSafe() async {
    final session = globalController.userSession.value;
    if (session == null) return;
    userName.value = session.nome;
  }

  void sair() {
    globalController.clearUserSession();
    NavigationService.pageOffAndToNamed(AppRoutes.login);
  }
}
