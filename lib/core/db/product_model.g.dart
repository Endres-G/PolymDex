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
    r'additives': PropertySchema(
      id: 0,
      name: r'additives',
      type: IsarType.stringList,
    ),
    r'antiblock': PropertySchema(
      id: 1,
      name: r'antiblock',
      type: IsarType.bool,
    ),
    r'comonomer': PropertySchema(
      id: 2,
      name: r'comonomer',
      type: IsarType.string,
    ),
    r'comonomerContent': PropertySchema(
      id: 3,
      name: r'comonomerContent',
      type: IsarType.double,
    ),
    r'density': PropertySchema(
      id: 4,
      name: r'density',
      type: IsarType.double,
    ),
    r'documentName': PropertySchema(
      id: 5,
      name: r'documentName',
      type: IsarType.string,
    ),
    r'documentPath': PropertySchema(
      id: 6,
      name: r'documentPath',
      type: IsarType.string,
    ),
    r'grade': PropertySchema(
      id: 7,
      name: r'grade',
      type: IsarType.string,
    ),
    r'mi': PropertySchema(
      id: 8,
      name: r'mi',
      type: IsarType.double,
    ),
    r'mwd': PropertySchema(
      id: 9,
      name: r'mwd',
      type: IsarType.string,
    ),
    r'processingAid': PropertySchema(
      id: 10,
      name: r'processingAid',
      type: IsarType.bool,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.long,
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
    final list = object.additives;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.comonomer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.documentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.documentPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.grade.length * 3;
  {
    final value = object.mwd;
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
  writer.writeStringList(offsets[0], object.additives);
  writer.writeBool(offsets[1], object.antiblock);
  writer.writeString(offsets[2], object.comonomer);
  writer.writeDouble(offsets[3], object.comonomerContent);
  writer.writeDouble(offsets[4], object.density);
  writer.writeString(offsets[5], object.documentName);
  writer.writeString(offsets[6], object.documentPath);
  writer.writeString(offsets[7], object.grade);
  writer.writeDouble(offsets[8], object.mi);
  writer.writeString(offsets[9], object.mwd);
  writer.writeBool(offsets[10], object.processingAid);
  writer.writeLong(offsets[11], object.userId);
}

ProductModel _productModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductModel();
  object.additives = reader.readStringList(offsets[0]);
  object.antiblock = reader.readBoolOrNull(offsets[1]);
  object.comonomer = reader.readStringOrNull(offsets[2]);
  object.comonomerContent = reader.readDoubleOrNull(offsets[3]);
  object.density = reader.readDouble(offsets[4]);
  object.documentName = reader.readStringOrNull(offsets[5]);
  object.documentPath = reader.readStringOrNull(offsets[6]);
  object.grade = reader.readString(offsets[7]);
  object.id = id;
  object.mi = reader.readDouble(offsets[8]);
  object.mwd = reader.readStringOrNull(offsets[9]);
  object.processingAid = reader.readBoolOrNull(offsets[10]);
  object.userId = reader.readLong(offsets[11]);
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
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productModelGetId(ProductModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productModelGetLinks(ProductModel object) {
  return [object.polymer, object.producer];
}

void _productModelAttach(
    IsarCollection<dynamic> col, Id id, ProductModel object) {
  object.id = id;
  object.polymer
      .attach(col, col.isar.collection<PolymerModel>(), r'polymer', id);
  object.producer
      .attach(col, col.isar.collection<ProducerModel>(), r'producer', id);
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
      additivesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'additives',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'additives',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'additives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'additives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'additives',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'additives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'additives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'additives',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'additives',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additives',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'additives',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additives',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additives',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additives',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additives',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additives',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      additivesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'additives',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiblockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'antiblock',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiblockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'antiblock',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      antiblockEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'antiblock',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comonomer',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comonomer',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comonomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comonomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comonomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comonomer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comonomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comonomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comonomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comonomer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comonomer',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comonomer',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comonomerContent',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comonomerContent',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comonomerContent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comonomerContent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comonomerContent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      comonomerContentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comonomerContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
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

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentName',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentName',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentPath',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentPath',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      documentPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentPath',
        value: '',
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

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mwd',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mwdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mwd',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mwd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mwdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mwd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mwd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mwd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mwd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mwd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mwd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mwd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> mwdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mwd',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      mwdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mwd',
        value: '',
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

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
}

extension ProductModelQuerySortBy
    on QueryBuilder<ProductModel, ProductModel, QSortBy> {
  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAntiblock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiblock', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByAntiblockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiblock', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByComonomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomer', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByComonomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomer', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByComonomerContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomerContent', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByComonomerContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomerContent', Sort.desc);
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

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByDocumentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentName', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByDocumentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentName', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByDocumentPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentPath', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      sortByDocumentPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentPath', Sort.desc);
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

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByMwd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mwd', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByMwdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mwd', Sort.desc);
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

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ProductModelQuerySortThenBy
    on QueryBuilder<ProductModel, ProductModel, QSortThenBy> {
  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAntiblock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiblock', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByAntiblockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'antiblock', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByComonomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomer', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByComonomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomer', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByComonomerContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomerContent', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByComonomerContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comonomerContent', Sort.desc);
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

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByDocumentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentName', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByDocumentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentName', Sort.desc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByDocumentPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentPath', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy>
      thenByDocumentPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentPath', Sort.desc);
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

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByMwd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mwd', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByMwdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mwd', Sort.desc);
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

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ProductModelQueryWhereDistinct
    on QueryBuilder<ProductModel, ProductModel, QDistinct> {
  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByAdditives() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'additives');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByAntiblock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'antiblock');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByComonomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comonomer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct>
      distinctByComonomerContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comonomerContent');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'density');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByDocumentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByDocumentPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByMi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mi');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByMwd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mwd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct>
      distinctByProcessingAid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processingAid');
    });
  }

  QueryBuilder<ProductModel, ProductModel, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
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

  QueryBuilder<ProductModel, List<String>?, QQueryOperations>
      additivesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'additives');
    });
  }

  QueryBuilder<ProductModel, bool?, QQueryOperations> antiblockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'antiblock');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations> comonomerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comonomer');
    });
  }

  QueryBuilder<ProductModel, double?, QQueryOperations>
      comonomerContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comonomerContent');
    });
  }

  QueryBuilder<ProductModel, double, QQueryOperations> densityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'density');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations> documentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentName');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations> documentPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentPath');
    });
  }

  QueryBuilder<ProductModel, String, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<ProductModel, double, QQueryOperations> miProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mi');
    });
  }

  QueryBuilder<ProductModel, String?, QQueryOperations> mwdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mwd');
    });
  }

  QueryBuilder<ProductModel, bool?, QQueryOperations> processingAidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processingAid');
    });
  }

  QueryBuilder<ProductModel, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
