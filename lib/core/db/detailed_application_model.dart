import 'package:isar/isar.dart';

part 'detailed_application_model.g.dart';

@Collection()
class DetailedApplicationModel {
  Id id = Isar.autoIncrement;
  late String name;
}
