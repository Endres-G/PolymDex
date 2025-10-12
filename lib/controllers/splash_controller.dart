import 'package:get/get.dart';
import 'package:polymdex/controllers/global_controller.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    asyncInit();
  }

  Future<void> asyncInit() async {
    await Future.delayed(const Duration(seconds: 2)); // tempo da splash

    final globalController = Get.find<GlobalController>();
    final session = globalController.userSession(); // recupera do cache/isar

    if (session != null && session.email.isNotEmpty) {
      print("Usuário logado detectado: ${session.email} (ID: ${session.id})");
      NavigationService.pageToOffAllNamed(AppRoutes.home);
    } else {
      print("Nenhum usuário logado encontrado. Redirecionando para login...");
      NavigationService.pageToOffAllNamed(AppRoutes.login);
    }
  }
}
