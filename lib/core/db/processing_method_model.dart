import 'package:isar/isar.dart';

part 'processing_method_model.g.dart';

@Collection()
class ProcessingMethodModel {
  Id id = Isar.autoIncrement;
  late String name;
}
