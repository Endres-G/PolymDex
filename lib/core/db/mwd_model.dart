import 'package:isar/isar.dart';

part 'mwd_model.g.dart';

@Collection()
class MWDModel {
  Id id = Isar.autoIncrement;
  late String name;
}
