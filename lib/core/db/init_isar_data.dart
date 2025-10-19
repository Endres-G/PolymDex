import 'package:isar/isar.dart';
import 'package:polymdex/core/db/catalytic_system_model.dart';
import 'package:polymdex/core/db/comonomer_model.dart';
import 'package:polymdex/core/db/detailed_application_model.dart';
import 'package:polymdex/core/db/mwd_model.dart';
import 'package:polymdex/core/db/other_add_model.dart';
import 'package:polymdex/core/db/processing_method_model.dart';
import 'package:polymdex/core/db/production_process_model.dart';
import 'package:polymdex/core/db/technology_licensor_model.dart';
import 'polymer_model.dart';
import 'producer_model.dart';
import 'resin_model.dart';

const producerNames = [
  'Braskem',
  'ExxonMobil',
  'LyondellBasell',
  'Dow',
  'Sabic',
  'Chevron Phillips Chemical',
  'Formosa Plastics',
  'Westlake',
  'Nova Chemicals',
  'Equistar',
  'Borealis',
  'Baystar',
  'Hanwha',
  'Ineos',
  'LG Chemical',
  'Lotte Chemical',
  'Mitsui Chemical',
  'SK Chemicals',
  'Total Energies',
  'Ethydco',
  'Sinopec',
  'Daelim',
  'Orpic',
];

const resinTypeNames = [
  'LDPE',
  'LLDPE',
  'LMDPE',
  'MDPE',
  'HDPE',
  'VLDPE',
  'U-VLDPE',
  'POP',
  'POE',
  'EVA',
  'TIE LAYER',
];

Future<void> initIsarData(Isar isar) async {
  final hasData = await isar.polymerModels.count() > 0;

  if (hasData) {
    print('✅ Dados fixos já estão no banco.');
    return;
  }

  print('🧩 Inserindo dados fixos no Isar...');

  await isar.writeTxn(() async {
    // Polymers
    await isar.polymerModels.putAll([
      PolymerModel()..name = 'Polyethylene (PE)',
      PolymerModel()..name = 'Polypropylene (PP)',
    ]);

    // Producers
    await isar.producerModels.putAll(
      producerNames.map((name) => ProducerModel()..name = name).toList(),
    );

    // Resin
    await isar.resinTypeModels.putAll(
      resinTypeNames.map((name) => ResinTypeModel()..name = name).toList(),
    );

    await isar.otherAddModels.putAll([
      OtherAddModel()..name = 'UV Stabilizer',
      OtherAddModel()..name = 'Flame Retardant',
      OtherAddModel()..name = 'Antistatic',
      OtherAddModel()..name = 'Impact Modifiers',
      OtherAddModel()..name = 'Pigments',
      OtherAddModel()..name = 'Fillers',
      OtherAddModel()..name = 'Plasticizers',
    ]);

    // Comonomers
    await isar.comonomerModels.putAll([
      ComonomerModel()..name = 'None',
      ComonomerModel()..name = '1-Butene',
      ComonomerModel()..name = '1-Hexene',
      ComonomerModel()..name = '1-Octene',
      ComonomerModel()..name = '1-Butene/1-Hexene',
      ComonomerModel()..name = '1-Butene/1-Hexene/Propene',
      ComonomerModel()..name = 'Vinyl Acetate',
    ]);

    // Processing Methods
    await isar.processingMethodModels.putAll([
      ProcessingMethodModel()..name = 'Blown Film Extrusion',
      ProcessingMethodModel()..name = 'Blow Molding',
      ProcessingMethodModel()..name = 'Cast Film Extrusion',
      ProcessingMethodModel()..name = 'Compression Molding',
      ProcessingMethodModel()..name = 'Continuous Filament/Spinning',
      ProcessingMethodModel()..name = 'Drip Irrigation Tape Extrusion',
      ProcessingMethodModel()..name = 'Extrusion Coating',
      ProcessingMethodModel()..name = 'Extrusion Compression Molding',
      ProcessingMethodModel()..name = 'Film Calendering',
      ProcessingMethodModel()..name = 'Fiber, Filament & Tape Extrusion',
      ProcessingMethodModel()..name = 'Hot Melt & Adhesives',
      ProcessingMethodModel()..name = 'Injection Molding',
      ProcessingMethodModel()..name = 'Masterbatch/Compound',
      ProcessingMethodModel()..name = 'Melt-Blown Extrusion',
      ProcessingMethodModel()..name = 'Pipe Extrusion',
      ProcessingMethodModel()..name = 'Profile Extrusion',
      ProcessingMethodModel()..name = 'Powders',
      ProcessingMethodModel()..name = 'Protected Expanded Polyethylene',
      ProcessingMethodModel()..name = 'Raffia Tape Extrusion',
      ProcessingMethodModel()..name = 'Rotational Molding',
      ProcessingMethodModel()..name = 'Sheet Extrusion',
      ProcessingMethodModel()..name = 'Spunbond',
      ProcessingMethodModel()..name = 'Staple Fiber',
      ProcessingMethodModel()..name = 'Thermoforming',
      ProcessingMethodModel()..name = 'Transfer Molding',
      ProcessingMethodModel()..name = 'Wire and Cable Extrusion',
    ]);

    // MWD
    await isar.mWDModels.putAll([
      MWDModel()..name = 'Narrow-Monomodal',
      MWDModel()..name = 'Medium-Monomodal',
      MWDModel()..name = 'Wide-Monomodal',
      MWDModel()..name = 'Wide-Bimodal',
    ]);

    // Catalytic Systems
    await isar.catalyticSystemModels.putAll([
      CatalyticSystemModel()..name = 'Free Radical',
      CatalyticSystemModel()..name = 'Ziegler-Natta',
      CatalyticSystemModel()..name = 'Phillips (Cr-based)',
      CatalyticSystemModel()..name = 'Metallocene',
      CatalyticSystemModel()..name = 'Post-metallocene',
    ]);

    // Production Process
    await isar.productionProcessModels.putAll([
      ProductionProcessModel()..name = 'High pressure-Autoclave',
      ProductionProcessModel()..name = 'High pressure-Tubular',
      ProductionProcessModel()..name = 'Solution Process',
      ProductionProcessModel()..name = 'Slurry Process',
      ProductionProcessModel()..name = 'Gas Phase Process',
    ]);

    // Technology/Licensor
    await isar.technologyLicensorModels.putAll([
      TechnologyLicensorModel()..name = 'Lupotech T,A/LyondellBasell (LDPE)',
      TechnologyLicensorModel()..name = 'Innovene LD/Ineos Technologies (LDPE)',
      TechnologyLicensorModel()..name = 'ExxonMobil/ExxonMobil (LDPE)',
      TechnologyLicensorModel()
        ..name = 'Mitsui Chemicals/Mitsui Chemicals (LDPE)',
      TechnologyLicensorModel()..name = 'Innovene S/Ineos Technologies (LMDPE)',
      TechnologyLicensorModel()..name = 'Hostalen/LyondellBasell (LMDPE)',
      TechnologyLicensorModel()..name = 'MarTECH/Chevron Phillips (LMDPE)',
      TechnologyLicensorModel()
        ..name = 'Unipol PE/Univation Technologies (LMDPE)',
      TechnologyLicensorModel()
        ..name = 'Spherilene S,C/LyondellBasell (LLDPE/MDPE/HDPE)',
      TechnologyLicensorModel()
        ..name = 'Borstar/Borealis Chemical (LLDPE/MDPE/HDPE)',
      TechnologyLicensorModel()
        ..name = 'Innovene S,G/Ineos Technologies (LLDPE/HDPE)',
      TechnologyLicensorModel()..name = 'Hostalen ACP/LyondellBasell (HDPE)',
      TechnologyLicensorModel()..name = 'MarTECH/Chevron Phillips (HDPE)',
      TechnologyLicensorModel()..name = 'CX Process/Mitsui Chemicals (HDPE)',
      TechnologyLicensorModel()
        ..name = 'Unipol PE/Univation Technologies (HDPE)',
    ]);

    // Detailed Applications
    await isar.detailedApplicationModels.putAll([
      DetailedApplicationModel()..name = 'Adhesive Lamination',
      DetailedApplicationModel()..name = 'Adhesives and Sealants',
      DetailedApplicationModel()..name = 'Agriculture Chemical Storage Tanks',
      DetailedApplicationModel()..name = 'Agriculture Greenhouse Film (Eva)',
      DetailedApplicationModel()
        ..name = 'Agriculture Greenhouse Film (Non-Eva)',
      DetailedApplicationModel()..name = "Agriculture IBC's",
      DetailedApplicationModel()..name = 'Agriculture Mulch Film',
      DetailedApplicationModel()..name = 'Agriculture Products',
      DetailedApplicationModel()
        ..name = 'Agriculture Silage Stretch/Silage Bags',
      DetailedApplicationModel()..name = 'Agriculture Silo Bags',
      DetailedApplicationModel()..name = 'Agriculture Tunnel Film',
      DetailedApplicationModel()..name = 'Aqualiner',
      DetailedApplicationModel()..name = 'Artificial Grass',
      DetailedApplicationModel()..name = 'Automotive Coatings',
      DetailedApplicationModel()..name = 'Automotive Components',
      DetailedApplicationModel()..name = 'Automotive Fittings',
      DetailedApplicationModel()..name = 'Automotive Fuel Tanks',
      DetailedApplicationModel()
        ..name = 'Backsheet - Breathable Film (E.G. Diapers)',
      DetailedApplicationModel()
        ..name = 'Backsheet - Non Breathable Film (E.G. Diapers)',
      DetailedApplicationModel()
        ..name = 'Bag In A Box (Dry Food - Cereal Liners, Crackers, Etc.)',
      DetailedApplicationModel()..name = 'Bag In A Box (Dry NonFood)',
      DetailedApplicationModel()
        ..name = 'Bag In A Box (Liquid Food - Wines & Institutional Pkg)',
      DetailedApplicationModel()..name = 'Bag In A Box (Liquid NonFood)',
    ]);
  });

  print('✅ Dados fixos inseridos com sucesso!');
}
