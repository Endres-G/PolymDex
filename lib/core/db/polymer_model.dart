import 'package:isar/isar.dart';

part 'polymer_model.g.dart';

@Collection()
class PolymerModel {
  Id id = Isar.autoIncrement;
  late String name; // Ex: "Polyethylene (PE)"
}
