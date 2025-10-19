import 'package:isar/isar.dart';

part 'other_add_model.g.dart';

@Collection()
class OtherAddModel {
  Id id = Isar.autoIncrement;
  late String name;
}
