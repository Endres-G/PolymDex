import 'package:isar/isar.dart';

part 'comonomer_model.g.dart';

@Collection()
class ComonomerModel {
  Id id = Isar.autoIncrement;
  late String name;
}
