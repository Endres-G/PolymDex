import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/controllers/login_controller.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Expanded(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),

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
                  _label("Email"),
                  TextField(
                    controller: controller.emailCtrl,
                    cursorColor: DesignSystemColors.lightgrey,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration("Digite seu email"),
                  ),
                  const SizedBox(height: 16),

                  _label("Nome"),
                  TextField(
                    controller: controller.nomeCtrl,
                    cursorColor: DesignSystemColors.lightgrey,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration("Digite seu nome"),
                  ),
                  const SizedBox(height: 16),

                  _label("Senha"),
                  TextField(
                    controller: controller.senhaCtrl,
                    obscureText: true,
                    cursorColor: DesignSystemColors.lightgrey,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration("Digite sua senha"),
                  ),
                  const SizedBox(height: 16),

                  _label("Senha novamente"),
                  TextField(
                    controller: controller.senha2Ctrl,
                    obscureText: true,
                    cursorColor: DesignSystemColors.lightgrey,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration("Digite sua senha novamente"),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.isLoading.value = true;
                        final result = await controller.registerUser();
                        controller.isLoading.value = false;

                        if (result == "success_register") {
                          Get.snackbar(
                            'Registro',
                            "Registro realizado com sucesso! Faça login para continuar.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black54,
                            colorText: Colors.white,
                          );

                          controller.toggleForm(true);
                        } else {
                          Get.snackbar(
                            'Registro',
                            result,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black54,
                            colorText: Colors.white,
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
                                "Registrar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Widget _label(String text) => Align(
    alignment: Alignment.bottomLeft,
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );

  InputDecoration _inputDecoration(String hint) => InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: DesignSystemColors.lightgrey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: DesignSystemColors.lightgrey),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
}
