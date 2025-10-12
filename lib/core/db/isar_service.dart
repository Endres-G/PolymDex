import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'user_session.dart';

class IsarService {
  static Isar? _isar;

  /// Retorna a instância aberta do Isar
  Future<Isar> get _db async {
    if (_isar != null && _isar!.isOpen) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([UserSessionSchema], directory: dir.path);
    return _isar!;
  }

  /// Busca usuário pelo email
  Future<UserSession?> getUserByEmail(String email) async {
    final isar = await _db;
    return await isar.userSessions.filter().emailEqualTo(email).findFirst();
  }

  /// Busca usuário pelo ID
  Future<UserSession?> getUserById(int id) async {
    final isar = await _db;
    return await isar.userSessions.filter().idEqualTo(id).findFirst();
  }

  /// Salva ou atualiza usuário
  Future<void> saveUser(UserSession user) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      await isar.userSessions.put(user);
    });
  }

  /// Retorna todos os usuários
  Future<List<UserSession>> getAllUsers() async {
    final isar = await _db;
    return await isar.userSessions.where().findAll();
  }
}
