import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLogin = true.obs;

  void toggleForm(bool login) {
    isLogin.value = login;
  }
}
