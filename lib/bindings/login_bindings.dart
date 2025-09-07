import 'package:get/get.dart';
import 'package:polymdex/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
