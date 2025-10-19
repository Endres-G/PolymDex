// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductModelCollection on Isar {
  IsarCollection<ProductModel> get productModels => this.collection();
}

const ProductModelSchema = CollectionSchema(
  name: r'ProductModel',
  id: -5593817549870564659,
  properties: {
    r'aditivos': PropertySchema(
      id: 0,
      name: r'aditivos',
      type: IsarType.string,
    ),
    r'antiBlock': PropertySchema(
      id: 1,
      name: r'antiBlock',
      type: IsarType.long,
    ),
    r'antioxidant': PropertySchema(
      id: 2,
      name: r'antioxidant',
      type: IsarType.bool,
    ),
    r'density': PropertySchema(
      id: 3,
      name: r'density',
      type: IsarType.double,
    ),
    r'grade': PropertySchema(
      id: 4,
      name: r'grade',
      type: IsarType.string,
    ),
    r'mainApplication': PropertySchema(
      id: 5,
      name: r'mainApplication',
      type: IsarType.string,
    ),
    r'mainFeat': PropertySchema(
      id: 6,
      name: r'mainFeat',
      type: IsarType.string,
    ),
    r'mi': PropertySchema(
      id: 7,
      name: r'mi',
      type: IsarType.double,
    ),
    r'processingAid': PropertySchema(
      id: 8,
      name: r'processingAid',
      type: IsarType.bool,
    ),
    r'slip': PropertySchema(
      id: 9,
      name: r'slip',
      type: IsarType.bool,
    )
  },
  estimateSize: _productModelEstimateSize,
  serialize: _productModelSerialize,
  deserialize: _productModelDeserialize,
  deserializeProp: _productModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'polymer': LinkSchema(
      id: -1572067331598177903,
      name: r'polymer',
      target: r'PolymerModel',
      single: true,
    ),
    r'producer': LinkSchema(
      id: 8047386384154618604,
      name: r'producer',
      target: r'ProducerModel',
      single: true,
    ),
    r'resinType': LinkSchema(
      id: 8310991998029774448,
      name: r'resinType',
      target: r'ResinTypeModel',
      single: true,
    ),
    r'otherAdd': LinkSchema(
      id: -5617306163722411654,
      name: r'otherAdd',
      target: r'OtherAddModel',
      single: true,
    ),
    r'comonomer': LinkSchema(
      id: 6079837043270953251,
      name: r'comonomer',
      target: r'ComonomerModel',
      single: true,
    ),
    r'processingMethod': LinkSchema(
      id: -6575478799952299203,
      name: r'processingMethod',
      target: r'ProcessingMethodModel',
      single: true,
    ),
    r'mwd': LinkSchema(
      id: -1211445122591121918,
      name: r'mwd',
      target: r'MWDModel',
      single: true,
    ),
    r'catalyticSystem': LinkSchema(
      id: 2721526396298430797,
      name: r'catalyticSystem',
      target: r'CatalyticSystemModel',
      single: true,
    ),
    r'productionProcess': LinkSchema(
      id: 8530898859767439755,
      name: r'productionProcess',
      target: r'ProductionProcessModel',
      single: true,
    ),
    r'technologyLicensor': LinkSchema(
      id: 8043933606754169134,
      name: r'technologyLicensor',
      target: r'TechnologyLicensorModel',
      single: true,
    ),
    r'detailedApplication': LinkSchema(
      id: -7864532171574490548,
      name: r'detailedApplication',
      target: r'DetailedApplicationModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _productModelGetId,
  getLinks: _productModelGetLinks,
  attach: _productModelAttach,
  version: '3.1.0+1',
);

int _productModelEstimateSize(
  ProductModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aditivos;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.grade.length * 3;
  {
    final value = object.mainApplication;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mainFeat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productModelSerialize(
  ProductModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aditivos);
  writer.writeLong(offsets[1], object.antiBlock);
  writer.writeBool(offsets[2], object.antioxidant);
  writer.writeDouble(offsets[3], object.density);
  writer.writeString(offsets[4], object.grade);
  writer.writeString(offsets[5], object.mainApplication);
  writer.writeString(offsets[6], object.mainFeat);
  writer.writeDouble(offsets[7], object.mi);
  writer.writeBool(offsets[8], object.processingAid);
  writer.writeBool(offsets[9], object.slip);
}

ProductModel _productModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductModel();
  object.aditivos = reader.readStringOrNull(offsets[0]);
  object.antiBlock = reader.readLongOrNull(offsets[1]);
  object.antioxidant = reader.readBoolOrNull(offsets[2]);
  object.density = reader.readDouble(offsets[3]);
  object.grade = reader.readString(offsets[4]);
  object.id = id;
  object.mainApplication = reader.readStringOrNull(offsets[5]);
  object.mainFeat = reader.readStringOrNull(offsets[6]);
  object.mi = reader.readDouble(offsets[7]);
  object.processingAid = reader.readBoolOrNull(offsets[8]);
  object.slip = reader.readBoolOrNull(offsets[9]);
  return object;
}

P _productModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productModelGetId(ProductModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productModelGetLinks(ProductModel object) {
  return [
    object.polymer,
    object.producer,
    object.resinType,
    object.otherAdd,
    object.comonomer,
    object.processingMethod,
    object.mwd,
    object.catalyticSystem,
    object.productionProcess,
    object.technologyLicensor,
    object.detailedApplication
  ];
}

void _productModelAttach(
    IsarCollection<dynamic> col, Id id, ProductModel object) {
  object.id = id;
  object.polymer
      .attach(col, col.isar.collection<PolymerModel>(), r'polymer', id);
  object.producer
      .attach(col, col.isar.collection<ProducerModel>(), r'producer', id);
  object.resinType
      .attach(col, col.isar.collection<ResinTypeModel>(), r'resinType', id);
  object.otherAdd
      .attach(col, col.isar.collection<OtherAddModel>(), r'otherAdd', id);
  object.comonomer
      .attach(col, col.isar.collection<ComonomerModel>(), r'comonomer', id);
  object.processingMethod.attach(col,
      col.isar.collection<ProcessingMethodModel>(), r'processingMethod', id);
  object.mwd.attach(col, col.isar.collection<MWDModel>(), r'mwd', id);
  object.catalyticSystem.attach(
      col, col.isar.collection<CatalyticSystemModel>(), r'catalyticSystem', id);
  object.productionProcess.attach(col,
      col.isar.collection<ProductionProcessModel>(), r'productionProcess', id);
  object.technologyLicensor.attach(
      col,
      col.isar.collection<TechnologyLicensorModel>(),
      r'technologyLicensor',
      id);
  object.detailedApplication.attach(
      col,
      col.isar.collection<DetailedApplicationModel>(),
      r'detailedApplication',
      id);
}

extension ProductModelQueryWhereSort
    on QueryBuilder<ProductModel, ProductModel, QWhere> {
  QueryBuilder<ProductModel, ProductModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductModelQueryWhere
    on QueryBuilder<ProductModel, ProductModel, QWhereClause> {
  QueryBuilder<ProductModel, ProductModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductModelQueryFilter
    on QueryBuilder<ProductModel, ProductModel, QFilterCondition> {
  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aditivos',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aditivos',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aditivos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aditivos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aditivos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aditivos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aditivos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aditivos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aditivos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aditivos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aditivos',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      aditivosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aditivos',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiBlockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'antiBlock',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiBlockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'antiBlock',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiBlockEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'antiBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiBlockGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'antiBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiBlockLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'antiBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiBlockBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'antiBlock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antioxidantIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'antioxidant',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antioxidantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'antioxidant',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antioxidantEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'antioxidant',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      densityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'density',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      densityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'density',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      densityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'density',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      densityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'density',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> gradeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      gradeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> gradeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> gradeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> gradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> gradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainApplication',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainApplication',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainApplication',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mainApplication',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mainApplication',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mainApplication',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mainApplication',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mainApplication',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mainApplication',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mainApplication',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainApplication',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainApplicationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mainApplication',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainFeat',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainFeat',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainFeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mainFeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mainFeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mainFeat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mainFeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mainFeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mainFeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mainFeat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainFeat',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mainFeatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mainFeat',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> miEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> miGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> miLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> miBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      processingAidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'processingAid',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      processingAidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'processingAid',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      processingAidEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processingAid',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> slipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slip',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      slipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slip',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> slipEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slip',
        value: value,
      ));
    });
  }
}

extension ProductModelQueryObject
    on QueryBuilder<ProductModel, ProductModel, QFilterCondition> {}

extension ProductModelQueryLinks
    on QueryBuilder<ProductModel, ProductModel, QFilterCondition> {
  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> polymer(
      FilterQuery<PolymerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'polymer');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      polymerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'polymer', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> producer(
      FilterQuery<ProducerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'producer');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      producerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'producer', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> resinType(
      FilterQuery<ResinTypeModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'resinType');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      resinTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'resinType', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> otherAdd(
      FilterQuery<OtherAddModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'otherAdd');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      otherAddIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'otherAdd', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> comonomer(
      FilterQuery<ComonomerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'comonomer');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'comonomer', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      processingMethod(FilterQuery<ProcessingMethodModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'processingMethod');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      processingMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'processingMethod', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwd(
      FilterQuery<MWDModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mwd');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mwd', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      catalyticSystem(FilterQuery<CatalyticSystemModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'catalyticSystem');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      catalyticSystemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'catalyticSystem', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      productionProcess(FilterQuery<ProductionProcessModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'productionProcess');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      productionProcessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productionProcess', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      technologyLicensor(FilterQuery<TechnologyLicensorModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'technologyLicensor');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      technologyLicensorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'technologyLicensor', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      detailedApplication(FilterQuery<DetailedApplicationModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'detailedApplication');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      detailedApplicationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'detailedApplication', 0, true, 0, true);
    });
  }
}

extension ProductModelQuerySortBy
    on QueryBuilder<ProductModel, ProductModel, QSortBy> {
  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAditivos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aditivos', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAditivosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aditivos', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAntiBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiBlock', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAntiBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiBlock', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAntioxidant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antioxidant', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByAntioxidantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antioxidant', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByDensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByMainApplication() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainApplication', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByMainApplicationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainApplication', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByMainFeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainFeat', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByMainFeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainFeat', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByMi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mi', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByMiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mi', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByProcessingAid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingAid', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByProcessingAidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingAid', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortBySlip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slip', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortBySlipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slip', Sort.desc);
    });
  }
}

extension ProductModelQuerySortThenBy
    on QueryBuilder<ProductModel, ProductModel, QSortThenBy> {
  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAditivos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aditivos', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAditivosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aditivos', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAntiBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiBlock', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAntiBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiBlock', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAntioxidant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antioxidant', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByAntioxidantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antioxidant', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByDensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByMainApplication() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainApplication', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByMainApplicationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainApplication', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByMainFeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainFeat', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByMainFeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainFeat', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByMi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mi', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByMiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mi', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByProcessingAid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingAid', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByProcessingAidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processingAid', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenBySlip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slip', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenBySlipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slip', Sort.desc);
    });
  }
}

extension ProductModelQueryWhereDistinct
    on QueryBuilder<ProductModel, ProductModel, QDistinct> {
  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByAditivos(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aditivos', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByAntiBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'antiBlock');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByAntioxidant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'antioxidant');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'density');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByMainApplication(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainApplication',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByMainFeat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainFeat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByMi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mi');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct>
      distinctByProcessingAid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processingAid');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctBySlip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slip');
    });
  }
}

extension ProductModelQueryProperty
    on QueryBuilder<ProductModel, ProductModel, QQueryProperty> {
  QueryBuilder<ProductModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations> aditivosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aditivos');
    });
  }

  QueryBuilder<ProductModel, int?, QQueryOperations> antiBlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'antiBlock');
    });
  }

  QueryBuilder<ProductModel, bool?, QQueryOperations> antioxidantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'antioxidant');
    });
  }

  QueryBuilder<ProductModel, double, QQueryOperations> densityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'density');
    });
  }

  QueryBuilder<ProductModel, String, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations>
      mainApplicationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainApplication');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations> mainFeatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainFeat');
    });
  }

  QueryBuilder<ProductModel, double, QQueryOperations> miProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mi');
    });
  }

  QueryBuilder<ProductModel, bool?, QQueryOperations> processingAidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processingAid');
    });
  }

  QueryBuilder<ProductModel, bool?, QQueryOperations> slipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slip');
    });
  }
}
