import 'package:isar/isar.dart';
import 'package:polymdex/core/db/product_model.dart';

part 'user_session.g.dart';

@Collection()
class UserSession {
  Id id = Isar.autoIncrement; // chave primária

  // Campos do usuário
  String email = '';
  String senha = '';
  String nome = '';
  final products = IsarLinks<ProductModel>();

  // Construtor vazio
  UserSession();

  // Criação rápida de usuário
  static UserSession create({
    required String email,
    required String senha,
    required String nome,
  }) {
    return UserSession()
      ..email = email
      ..senha = senha
      ..nome = nome;
  }

  // Converter para JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'senha': senha,
    'nome': nome,
  };

  // Criar UserSession a partir de JSON
  factory UserSession.fromJson(Map<String, dynamic> json) {
    final session = UserSession();
    session.id = json['id'] ?? 0;
    session.email = json['email'] ?? '';
    session.senha = json['senha'] ?? '';
    session.nome = json['nome'] ?? '';
    return session;
  }

  // Método útil para debug
  @override
  String toString() => 'UserSession(id: $id, email: $email, nome: $nome)';
}
