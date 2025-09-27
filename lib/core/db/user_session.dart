import 'package:isar/isar.dart';

part 'user_session.g.dart'; // ⚠️ deve bater com o nome do arquivo

@Collection()
class UserSession {
  Id id = Isar.autoIncrement; // chave primária automática

  late String email;
  late String nome;
  late String senha;

  UserSession();

  UserSession.create({
    required this.email,
    required this.nome,
    required this.senha,
  });
}
