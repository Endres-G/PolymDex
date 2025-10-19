import 'package:isar/isar.dart';

part 'producer_model.g.dart';

@Collection()
class ProducerModel {
  Id id = Isar.autoIncrement;
  late String name; // Ex: "Braskem"
}
