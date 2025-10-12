import 'dart:convert';
import 'package:get/get.dart';
import 'package:polymdex/core/db/user_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  static const String _keyUserSession = 'user_session';

  final Rxn<UserSession> userSession = Rxn<UserSession>();
  final RxBool isLogged = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserSession();
  }

  /// Salva a sessão do usuário
  Future<void> saveUserSession(UserSession session) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserSession, jsonEncode(session.toJson()));
    userSession.value = session;
    isLogged.value = true;
    print("Sessão salva: ${session.nome}, ID: ${session.id}");
  }

  /// Carrega a sessão do usuário
  Future<void> loadUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyUserSession);
    if (jsonString != null) {
      final session = UserSession.fromJson(jsonDecode(jsonString));
      userSession.value = session;
      isLogged.value = true;
      print("Sessão carregada: ${session.nome}, ID: ${session.id}");
    } else {
      isLogged.value = false;
      print("Nenhuma sessão encontrada");
    }
  }

  /// Limpa a sessão do usuário (logout)
  Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserSession);
    userSession.value = null;
    isLogged.value = false;
    print("Sessão limpa");
  }
}
