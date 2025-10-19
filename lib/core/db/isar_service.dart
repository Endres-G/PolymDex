import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polymdex/core/db/catalytic_system_model.dart';
import 'package:polymdex/core/db/comonomer_model.dart';
import 'package:polymdex/core/db/detailed_application_model.dart';
import 'package:polymdex/core/db/init_isar_data.dart';
import 'package:polymdex/core/db/mwd_model.dart';
import 'package:polymdex/core/db/other_add_model.dart';
import 'package:polymdex/core/db/polymer_model.dart';
import 'package:polymdex/core/db/processing_method_model.dart';
import 'package:polymdex/core/db/producer_model.dart';
import 'package:polymdex/core/db/product_model.dart';
import 'package:polymdex/core/db/production_process_model.dart';
import 'package:polymdex/core/db/resin_model.dart';
import 'package:polymdex/core/db/technology_licensor_model.dart';
import 'package:polymdex/core/db/user_session.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;
  IsarService._internal();

  Isar? _isar;

  /// Abre o banco se ainda não estiver aberto (singleton)
  Future<Isar> get db async {
    if (_isar != null && _isar!.isOpen) {
      print('[IsarService] -> returning existing Isar instance.');
      return _isar!;
    }

    print('[IsarService] -> opening Isar...');
    final dir = await getApplicationDocumentsDirectory();
    print('[IsarService] -> directory: ${dir.path}');

    _isar = await Isar.open([
      UserSessionSchema,
      ProductModelSchema,
      PolymerModelSchema,
      ProducerModelSchema,
      ResinTypeModelSchema,
      OtherAddModelSchema,
      ComonomerModelSchema,
      ProcessingMethodModelSchema,
      MWDModelSchema,
      CatalyticSystemModelSchema,
      ProductionProcessModelSchema,
      TechnologyLicensorModelSchema,
      DetailedApplicationModelSchema,
    ], directory: dir.path);

    print('[IsarService] -> Isar opened with schemas.');

    // 🔥 CHAME AQUI
    await initIsarData(_isar!);

    await debugDbInfo(); // imprime info inicial para debug
    return _isar!;
  }

  /// Imprime várias informações de debug sobre o banco
  Future<void> debugDbInfo() async {
    try {
      final isar = await db;
      print('--- [IsarService] DEBUG INFO START ---');
      // coleções existentes e contagens
      try {
        final userCount = await isar.userSessions.count();
        final prodCount = await isar.productModels.count();
        final polymerCount = await isar.polymerModels.count();
        final producerCount = await isar.producerModels.count();
        final resinCount = await isar.resinTypeModels.count();
        print(
          '[IsarService] counts -> users:$userCount products:$prodCount polymers:$polymerCount producers:$producerCount resins:$resinCount',
        );
      } catch (e) {
        print('[IsarService] warning counting collections: $e');
      }

      // mostra 1 usuário exemplo (se houver)
      try {
        final anyUsers = await isar.userSessions.where().limit(5).findAll();
        print('[IsarService] sample users (${anyUsers.length}):');
        for (final u in anyUsers) {
          print('  - user id=${u.id} nome=${u.nome} email=${u.email}');
        }
      } catch (e) {
        print('[IsarService] warning fetching sample users: $e');
      }

      // mostra 1 produto exemplo (se houver)
      try {
        final anyProds = await isar.productModels.where().limit(5).findAll();
        print('[IsarService] sample products (${anyProds.length}):');
        for (final p in anyProds) {
          // attempt to load polymer link for readable debug (non-blocking inside write txn? it's fine to load)
          await p.polymer.load();
          print(
            '  - product id=${p.id} grade=${p.grade} polymer=${p.polymer.value?.name ?? "—"}',
          );
        }
      } catch (e) {
        print('[IsarService] warning fetching sample products: $e');
      }
      print('--- [IsarService] DEBUG INFO END ---');
    } catch (e) {
      print('[IsarService] debugDbInfo failed: $e');
    }
  }

  /// Salva ou atualiza um usuário
  Future<void> saveUser(UserSession user) async {
    final isar = await db;
    print('[IsarService] -> saving user id=${user.id} email=${user.email}');
    await isar.writeTxn(() async {
      await isar.userSessions.put(user);
    });
    print('[IsarService] -> user saved.');
  }

  /// Busca usuário pelo email
  Future<UserSession?> getUserByEmail(String email) async {
    final isar = await db;
    print('[IsarService] -> searching user by email: $email');
    final found = await isar.userSessions
        .filter()
        .emailEqualTo(email)
        .findFirst();
    print('[IsarService] -> found by email: ${found != null}');
    return found;
  }

  /// Busca usuário pelo ID
  Future<UserSession?> getUserById(int id) async {
    final isar = await db;
    print('[IsarService] -> searching user by id: $id');
    final found = await isar.userSessions.get(id);
    print('[IsarService] -> found by id: ${found != null}');
    return found;
  }

  /// Retorna todos os usuários
  Future<List<UserSession>> getAllUsers() async {
    final isar = await db;
    return await isar.userSessions.where().findAll();
  }

  /// Garante que o usuário existe no banco e retorna ele
  Future<UserSession> ensureUserInDb(UserSession user) async {
    final isar = await db;
    print(
      '[IsarService] -> ensureUserInDb for id=${user.id} email=${user.email}',
    );
    final existing = await isar.userSessions.get(user.id);
    if (existing == null) {
      print('[IsarService] -> user not present, inserting into Isar.');
      await isar.writeTxn(() async {
        await isar.userSessions.put(user);
      });
      // reload from db to return canonical instance
      final inserted = await isar.userSessions.get(user.id);
      print('[IsarService] -> user inserted: ${inserted != null}');
      return inserted ?? user;
    }
    print('[IsarService] -> user already exists in db.');
    return existing;
  }

  /// Tenta encontrar um usuário no banco sem depender de cache.
  /// Estratégias (na ordem):
  /// 1) Se id foi passado, tenta por id.
  /// 2) Se email foi passado, tenta por email.
  /// 3) Se nada foi passado, retorna o primeiro usuário (ou null).
  Future<UserSession?> findUserInDb({int? id, String? email}) async {
    final isar = await db;
    print('[IsarService] -> findUserInDb called with id=$id email=$email');

    if (id != null) {
      final byId = await isar.userSessions.get(id);
      if (byId != null) {
        print('[IsarService] -> found user by id: ${byId.email}');
        return byId;
      } else {
        print('[IsarService] -> no user found by id $id');
      }
    }

    if (email != null && email.isNotEmpty) {
      final byEmail = await isar.userSessions
          .filter()
          .emailEqualTo(email)
          .findFirst();
      if (byEmail != null) {
        print('[IsarService] -> found user by email: ${byEmail.id}');
        return byEmail;
      } else {
        print('[IsarService] -> no user found by email $email');
      }
    }

    // fallback: get any user (first inserted)
    final any = await isar.userSessions.where().limit(1).findAll();
    if (any.isNotEmpty) {
      print(
        '[IsarService] -> returning first user found id=${any.first.id} email=${any.first.email}',
      );
      return any.first;
    }

    print('[IsarService] -> no users present in Isar.');
    return null;
  }

  /// Tenta achar qualquer usuário no DB (primeiro ou último) - útil "sem cache"
  Future<UserSession?> findAnyUser() async {
    final isar = await db;
    print('[IsarService] -> findAnyUser()');
    final users = await isar.userSessions.where().findAll();
    if (users.isEmpty) {
      print('[IsarService] -> no users at all');
      return null;
    }
    // returning the last user may be more "recent"
    print(
      '[IsarService] -> users count=${users.length}, returning last id=${users.last.id}',
    );
    return users.last;
  }

  /// Printa os produtos vinculados a um usuário. Se `user` for null e
  /// tryAnyIfMissing=true, tenta recuperar qualquer usuário do Isar (sem cache).
  Future<void> printUserProducts({
    UserSession? user,
    bool tryAnyIfMissing = true,
  }) async {
    try {
      final isar = await db;
      print(
        '[IsarService] -> printUserProducts started. passedUser=${user != null} tryAnyIfMissing=$tryAnyIfMissing',
      );

      UserSession? dbUser;
      if (user != null) {
        // try to get canonical one from DB
        dbUser = await isar.userSessions.get(user.id);
        if (dbUser == null) {
          print(
            '[IsarService] -> passed user not found in DB by id=${user.id}, will insert it.',
          );
          dbUser = await ensureUserInDb(user);
        } else {
          print(
            '[IsarService] -> passed user found in DB id=${dbUser.id} email=${dbUser.email}',
          );
        }
      } else if (tryAnyIfMissing) {
        // try to find any user in DB (no cache)
        dbUser = await findAnyUser();
        if (dbUser == null) {
          print(
            '[IsarService] -> no user found in DB when trying findAnyUser().',
          );
          return;
        } else {
          print(
            '[IsarService] -> using user from DB id=${dbUser.id} email=${dbUser.email}',
          );
        }
      } else {
        print(
          '[IsarService] -> no user provided and tryAnyIfMissing=false, aborting.',
        );
        return;
      }

      // Now ensure links are loaded for readable debug
      print(
        '[IsarService] -> loading user.products links for user id=${dbUser.id}',
      );
      await dbUser.products.load();

      // optionally load polymer links for each product to show names
      if (dbUser.products.isEmpty) {
        print(
          '[IsarService] -> user id=${dbUser.id} nome=${dbUser.nome} has 0 products.',
        );
        return;
      }

      print(
        '[IsarService] -> user id=${dbUser.id} nome=${dbUser.nome} has ${dbUser.products.length} products:',
      );
      for (var p in dbUser.products) {
        // ensure polymer link loaded (defensive)
        await p.polymer.load();
        final polymerName = p.polymer.value?.name ?? 'Sem polymer';
        print(
          '    • product id=${p.id} grade=${p.grade} polymer=$polymerName mi=${p.mi} density=${p.density}',
        );
      }
    } catch (e, st) {
      print('[IsarService] -> ERROR in printUserProducts: $e');
      print(st);
    }
  }
}
