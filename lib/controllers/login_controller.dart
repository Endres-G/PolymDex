import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/db/isar_service.dart';
import '../core/db/user_session.dart';
import 'global_controller.dart';

class LoginController extends GetxController {
  // Estado da tela
  final isLogin = true.obs;
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  // Controllers de texto usados nos forms
  final emailCtrl = TextEditingController();
  final senhaCtrl = TextEditingController();
  final nomeCtrl = TextEditingController();
  final senha2Ctrl = TextEditingController();

  // Dados observáveis
  final email = ''.obs;
  final senha = ''.obs;
  final nome = ''.obs;

  final IsarService isarService = IsarService();
  final GlobalController globalController = Get.find<GlobalController>();

  // Alterna entre Login ⟷ Registro
  void toggleForm(bool login) {
    isLogin.value = login;
    clearFields();
  }

  // Limpa todos os campos
  void clearFields() {
    emailCtrl.clear();
    senhaCtrl.clear();
    nomeCtrl.clear();
    senha2Ctrl.clear();

    email.value = '';
    senha.value = '';
    nome.value = '';
  }

  // Função de LOGIN
  Future<String> loginUser() async {
    try {
      email.value = emailCtrl.text.trim();
      senha.value = senhaCtrl.text.trim();

      print("=== LOGIN ===");
      print("Tentando logar com email: ${email.value}, senha: ${senha.value}");

      final session = await isarService.getUserByEmail(email.value);

      if (session == null) {
        return "Email não encontrado.";
      }

      if (session.senha != senha.value) {
        return "Senha incorreta.";
      }

      globalController.saveUserSession(
        UserSession()
          ..id = session.id
          ..email = session.email
          ..nome = session.nome
          ..senha = '',
      );

      print("Login bem-sucedido.");
      return "success_login";
    } catch (e) {
      return "Erro ao tentar logar: $e";
    }
  }

  // Função de REGISTRO
  Future<String> registerUser() async {
    try {
      email.value = emailCtrl.text.trim();
      senha.value = senhaCtrl.text.trim();
      nome.value = nomeCtrl.text.trim();
      final senha2 = senha2Ctrl.text.trim();

      print("=== REGISTRO ===");
      print(
        "Email: ${email.value}, Nome: ${nome.value}, Senha: ${senha.value}",
      );

      // -------- VALIDAÇÕES --------
      if (email.value.isEmpty || !email.value.contains("@")) {
        return "Email inválido.";
      }

      if (nome.value.isEmpty) {
        return "Digite seu nome.";
      }

      if (senha.value.length < 4) {
        return "A senha deve ter pelo menos 4 dígitos.";
      }

      if (senha.value != senha2) {
        return "As senhas não coincidem.";
      }

      final existing = await isarService.getUserByEmail(email.value);
      if (existing != null) {
        return "Email já registrado!";
      }

      // -------- SALVAR NO BANCO --------
      final user = UserSession.create(
        email: email.value,
        nome: nome.value,
        senha: senha.value,
      );

      await isarService.saveUser(user);

      print("Registro salvo com sucesso.");
      return "success_register";
    } catch (e) {
      return "Erro ao registrar usuário: $e";
    }
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    senhaCtrl.dispose();
    nomeCtrl.dispose();
    senha2Ctrl.dispose();
    super.onClose();
  }
}
