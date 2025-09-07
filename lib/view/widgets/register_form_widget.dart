import 'package:flutter/material.dart';
import 'package:polymdex/core/themes/design_system.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Email
            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Text("Email", style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: DesignSystemColors.lightgrey,
                decoration: InputDecoration(
                  hintText: "Digite seu email",
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

            // Nome
            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Text("Nome", style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: DesignSystemColors.lightgrey,
                decoration: InputDecoration(
                  hintText: "Digite seu nome",
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

            // Senha
            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Text("Senha", style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: DesignSystemColors.lightgrey,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
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

            // Senha novamente
            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Text(
                "Senha novamente",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextField(
                cursorColor: DesignSystemColors.lightgrey,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Digite sua senha novamente",
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
            const SizedBox(height: 24),

            // Botão Registrar
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Registrar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
