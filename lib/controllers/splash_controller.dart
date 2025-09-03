 
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    asyncInit();
    super.onInit();
  }

  Future<void> asyncInit() async {
    await Future.delayed(const Duration(seconds: 3));
    // final session = await Get.find<GlobalController>().getUserSession();

    // if (session != null) {
    //   NavigationService.pageToOffAllNamed(AppRoutes.homePageView);
    // } else {
    //   NavigationService.pageToOffAllNamed(AppRoutes.welcome);
    // }
  }
}