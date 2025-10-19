import 'package:get/get.dart';
import 'package:polymdex/core/db/isar_service.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';
import 'global_controller.dart'; // importe seu GlobalController

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString userName = 'Usuario'.obs;

  final IsarService isarService = IsarService();

  // Instância do GlobalController
  final GlobalController globalController = Get.find<GlobalController>();

  @override
  void onInit() {
    super.onInit();
    _loadUserNameSafe();
  }

  void sair() {
    Get.find<GlobalController>().clearUserSession();
    NavigationService.pageOffAndToNamed(AppRoutes.login);
  }

  /// Carrega o nome do usuário usando o ID salvo na sessão
  Future<void> _loadUserNameSafe() async {
    // Verifica se a sessão existe
    final session = globalController.userSession.value;
    if (session == null) {
      print("Sessão do usuário ainda não carregada.");
      return;
    }

    isLoading.value = true;

    try {
      final userSession = await isarService.getUserById(session.id);
      if (userSession != null) {
        userName.value = userSession.nome;
        print("Nome do usuário carregado: ${userSession.nome}");
      } else {
        print("Usuário com ID ${session.id} não encontrado no banco.");
      }
    } catch (e) {
      print("Erro ao carregar usuário: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
