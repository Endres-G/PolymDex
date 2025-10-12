import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/login_controller.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';
import 'package:polymdex/core/themes/design_system.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    final emailController = TextEditingController();
    final senhaController = TextEditingController();

    return Center(
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: DesignSystemColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // EMAIL
            Align(
              alignment: Alignment.bottomLeft,
              child: const Text("Email", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              cursorColor: DesignSystemColors.lightgrey,
              decoration: InputDecoration(
                hintText: "Digite seu email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 16),

            // SENHA
            Align(
              alignment: Alignment.bottomLeft,
              child: const Text("Senha", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            Obx(
              () => TextField(
                controller: senhaController,
                obscureText: !controller.isPasswordVisible.value,
                cursorColor: DesignSystemColors.lightgrey,
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => controller.isPasswordVisible.value =
                        !controller.isPasswordVisible.value,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  controller.isLoading.value = true;

                  // Preenche email e senha
                  controller.email.value = emailController.text.trim();
                  controller.senha.value = senhaController.text.trim();

                  String result;

                  if (controller.isLogin.value) {
                    // LOGIN
                    result = await controller.loginUser();

                    if (result == "success_login") {
                      // Navega para Home
                      NavigationService.pageOffAndToNamed(AppRoutes.home);

                      // Snack de sucesso
                      Get.snackbar(
                        "Login",
                        "Bem-vindo, login com sucesso!",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      // Snack de erro
                      Get.snackbar(
                        "Login",
                        result,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  } else {
                    // REGISTRO
                    // Pega nome do usuário como prefixo do email, exemplo
                    controller.nome.value = emailController.text.split('@')[0];

                    result = await controller.registerUser();

                    if (result == "success_register") {
                      controller.toggleForm(true); // volta para login

                      Get.snackbar(
                        "Registro",
                        "Registrado com sucesso! Faça login.",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      Get.snackbar(
                        "Registro",
                        result,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  }

                  controller.isLoading.value = false;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2,
                        )
                      : Text(
                          controller.isLogin.value ? "Logar" : "Registrar",
                          style: const TextStyle(color: Colors.black),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
