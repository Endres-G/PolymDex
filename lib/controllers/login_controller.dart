import 'package:get/get.dart';
import '../core/db/isar_service.dart';
import '../core/db/user_session.dart';
import 'global_controller.dart';

class LoginController extends GetxController {
  final RxBool isLogin = true.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxString email = ''.obs;
  final RxString senha = ''.obs;
  final RxString nome = ''.obs;
  final RxBool isLoading = false.obs;

  final IsarService isarService = IsarService();

  final GlobalController globalController = Get.find<GlobalController>();

  void toggleForm(bool login) {
    isLogin.value = login;
  }

  Future<String> loginUser() async {
    try {
      print("=== LOGIN ===");
      print("Tentando logar com email: ${email.value}, senha: ${senha.value}");

      final session = await isarService.getUserByEmail(email.value);

      if (session != null) {
        print("Sessão encontrada no banco:");
        print("Email armazenado: ${session.email}");
        print("Senha armazenada: ${session.senha}");
        print("Nome armazenado: ${session.nome}");

        if (session.senha == senha.value) {
          globalController.saveUserSession(
            UserSession()
              ..id = session.id
              ..email = session.email
              ..nome = session.nome
              ..senha = '',
          );

          print(
            "Login bem-sucedido, dados do usuário carregados no GlobalController.",
          );
          print(
            "Sessão salva: ${globalController.userSession.value!.nome}, ID: ${globalController.userSession.value!.id}",
          );

          return "success_login";
        }
      }

      return "Email ou senha incorretos.";
    } catch (e) {
      return "Erro ao tentar logar: $e";
    }
  }

  Future<String> registerUser() async {
    try {
      print("=== REGISTRO ===");
      print(
        "Tentando registrar com email: ${email.value}, senha: ${senha.value}, nome: ${nome.value}",
      );

      final existing = await isarService.getUserByEmail(email.value);
      if (existing != null) {
        return "Email já registrado!";
      }

      final user = UserSession.create(
        email: email.value,
        nome: nome.value,
        senha: senha.value,
      );

      await isarService.saveUser(user);

      print("Registro salvo no banco com sucesso!");
      return "success_register";
    } catch (e) {
      return "Erro ao registrar usuário: $e";
    }
  }
}
