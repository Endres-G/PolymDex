import 'package:get/get.dart';
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
  final mi = 0.05.obs;
  final density = 0.800.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserNameSafe();
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

  Future<void> saveProductToIsar() async {
    isLoading.value = true;
    await productService.saveProduct();
    isLoading.value = false;
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
