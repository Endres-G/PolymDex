import 'package:isar/isar.dart';
import 'package:polymdex/core/db/detailed_application_model.dart';
import 'package:polymdex/core/db/other_add_model.dart';
import 'package:polymdex/core/db/technology_licensor_model.dart';
import 'polymer_model.dart';
import 'producer_model.dart';
import 'resin_model.dart';
import 'comonomer_model.dart';
import 'processing_method_model.dart';
import 'mwd_model.dart';
import 'catalytic_system_model.dart';
import 'production_process_model.dart';

part 'product_model.g.dart';

@Collection()
class ProductModel {
  Id id = Isar.autoIncrement;

  final polymer = IsarLink<PolymerModel>();
  final producer = IsarLink<ProducerModel>();
  final resinType = IsarLink<ResinTypeModel>();

  final otherAdd = IsarLink<OtherAddModel>();
  final comonomer = IsarLink<ComonomerModel>();
  final processingMethod = IsarLink<ProcessingMethodModel>();
  final mwd = IsarLink<MWDModel>();
  final catalyticSystem = IsarLink<CatalyticSystemModel>();
  final productionProcess = IsarLink<ProductionProcessModel>();
  final technologyLicensor = IsarLink<TechnologyLicensorModel>();
  final detailedApplication = IsarLink<DetailedApplicationModel>();

  late String grade;
  late double mi;
  late double density;
  bool? antioxidant;
  int? antiBlock;
  bool? slip;
  bool? processingAid;
  String? aditivos;
  String? mainFeat;
  String? mainApplication;
}
