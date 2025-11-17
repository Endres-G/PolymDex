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

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Center(
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
                // EMAIL -------------------
                Align(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Email",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),

                TextField(
                  controller: controller.emailCtrl,
                  cursorColor: DesignSystemColors.lightgrey,
                  decoration: InputDecoration(
                    hintText: "Digite seu email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: DesignSystemColors.lightgrey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: DesignSystemColors.lightgrey,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 16),

                // SENHA ---------------------
                Align(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Senha",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),

                Obx(
                  () => TextField(
                    controller: controller.senhaCtrl,
                    obscureText: !controller.isPasswordVisible.value,
                    cursorColor: DesignSystemColors.lightgrey,
                    decoration: InputDecoration(
                      hintText: "Digite sua senha",
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value;
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: DesignSystemColors.lightgrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: DesignSystemColors.lightgrey,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 24),

                // BOTÃO ---------------------
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      controller.isLoading.value = true;

                      final result = await controller.loginUser();

                      controller.isLoading.value = false;

                      if (result == "success_login") {
                        NavigationService.pageOffAndToNamed(AppRoutes.home);

                        Get.snackbar(
                          "Login",
                          "Bem-vindo!",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        Get.snackbar(
                          "Erro ao logar",
                          result,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
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
                          : const Text(
                              "Logar",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
