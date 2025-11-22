import 'package:isar/isar.dart';
import 'polymer_model.dart';
import 'producer_model.dart';

part 'product_model.g.dart';

@Collection()
class ProductModel {
  Id id = Isar.autoIncrement;

  final polymer = IsarLink<PolymerModel>();
  final producer = IsarLink<ProducerModel>();

  late int userId;
  late String grade; // Ex: Grade-PP
  late double mi; // Índice de fluidez
  late double density; // Densidade

  bool? processingAid; // Sim/Não
  bool? antiblock; // Sim/Não

  List<String>? additives; // Lista de aditivos selecionados

  String? mwd; // Ex: Narrow-Monomodal
  String? comonomer; // Ex: 1-Butene/1-Hexene/Propene
  double? comonomerContent; // Ex: 1.547
  String? documentPath;
  String? documentName;
}
