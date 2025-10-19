import 'package:isar/isar.dart';

part 'technology_licensor_model.g.dart';

@Collection()
class TechnologyLicensorModel {
  Id id = Isar.autoIncrement;
  late String name;
}
