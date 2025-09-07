import 'package:get/get.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    asyncInit();
    super.onInit();
  }

  Future<void> asyncInit() async {
    await Future.delayed(const Duration(seconds: 3));
    NavigationService.pageToOffAllNamed(AppRoutes.login);

    // final session = await Get.find<GlobalController>().getUserSession();

    // if (session != null) {
    //   NavigationService.pageToOffAllNamed(AppRoutes.homePageView);
    // } else {
    //   NavigationService.pageToOffAllNamed(AppRoutes.welcome);
    // }
  }
}
