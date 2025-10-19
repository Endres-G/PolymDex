import 'package:isar/isar.dart';

part 'production_process_model.g.dart';

@Collection()
class ProductionProcessModel {
  Id id = Isar.autoIncrement;
  late String name;
}
