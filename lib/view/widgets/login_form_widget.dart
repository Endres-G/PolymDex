import 'package:flutter/material.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';
import 'package:polymdex/core/themes/design_system.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 322,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: DesignSystemColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Text("Email"),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: DesignSystemColors.lightgrey,
                decoration: InputDecoration(
                  hintText: "Digite seu email",
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: DesignSystemColors.lightgrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: DesignSystemColors.lightgrey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),

            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Text("Senha"),
            ),

            SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: DesignSystemColors.lightgrey,

                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: DesignSystemColors.lightgrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: DesignSystemColors.lightgrey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
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
                onPressed: () {
                  print("vai para home");
                  NavigationService.pageOffAndToNamed(AppRoutes.home);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Logar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  // Ação de recuperar senha
                },
                child: const Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
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
