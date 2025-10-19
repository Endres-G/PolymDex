import 'package:isar/isar.dart';

part 'catalytic_system_model.g.dart';

@Collection()
class CatalyticSystemModel {
  Id id = Isar.autoIncrement;
  late String name;
}
