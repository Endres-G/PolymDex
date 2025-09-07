import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/login_controller.dart';
import 'package:polymdex/view/widgets/login_form_widget.dart';
import 'package:polymdex/view/widgets/register_form_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.toggleForm(true),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: controller.isLogin.value
                              ? TextDecoration.underline
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => controller.toggleForm(false),
                      child: Text(
                        "Registro",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: !controller.isLogin.value
                              ? TextDecoration.underline
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => controller.isLogin.value
                  ? const LoginFormWidget()
                  : const RegisterFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
