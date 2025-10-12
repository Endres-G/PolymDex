import 'package:get/instance_manager.dart';
import 'package:polymdex/controllers/global_controller.dart';

class AplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
  }
}
