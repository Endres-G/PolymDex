import 'package:isar/isar.dart';

part 'resin_model.g.dart';

@Collection()
class ResinTypeModel {
  Id id = Isar.autoIncrement;
  late String name; // Ex: "LDPE"
}
