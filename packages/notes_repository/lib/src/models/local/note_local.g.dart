// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNoteLocalCollection on Isar {
  IsarCollection<NoteLocal> get noteLocals => this.collection();
}

const NoteLocalSchema = CollectionSchema(
  name: r'NoteLocal',
  id: -2232327117619814999,
  properties: {
    r'categoryId': PropertySchema(
      id: 0,
      name: r'categoryId',
      type: IsarType.string,
    ),
    r'createDate': PropertySchema(
      id: 1,
      name: r'createDate',
      type: IsarType.dateTime,
    ),
    r'examples': PropertySchema(
      id: 2,
      name: r'examples',
      type: IsarType.string,
    ),
    r'isAutoTranslated': PropertySchema(
      id: 3,
      name: r'isAutoTranslated',
      type: IsarType.bool,
    ),
    r'isLearned': PropertySchema(
      id: 4,
      name: r'isLearned',
      type: IsarType.bool,
    ),
    r'lastLearnDate': PropertySchema(
      id: 5,
      name: r'lastLearnDate',
      type: IsarType.dateTime,
    ),
    r'learnCount': PropertySchema(
      id: 6,
      name: r'learnCount',
      type: IsarType.long,
    ),
    r'learnDate': PropertySchema(
      id: 7,
      name: r'learnDate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(
      id: 8,
      name: r'notes',
      type: IsarType.string,
    ),
    r'originalText': PropertySchema(
      id: 9,
      name: r'originalText',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 10,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'transcription': PropertySchema(
      id: 11,
      name: r'transcription',
      type: IsarType.string,
    ),
    r'translatedText': PropertySchema(
      id: 12,
      name: r'translatedText',
      type: IsarType.string,
    )
  },
  estimateSize: _noteLocalEstimateSize,
  serialize: _noteLocalSerialize,
  deserialize: _noteLocalDeserialize,
  deserializeProp: _noteLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _noteLocalGetId,
  getLinks: _noteLocalGetLinks,
  attach: _noteLocalAttach,
  version: '3.1.0+1',
);

int _noteLocalEstimateSize(
  NoteLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.categoryId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.examples;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.originalText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transcription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.translatedText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _noteLocalSerialize(
  NoteLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryId);
  writer.writeDateTime(offsets[1], object.createDate);
  writer.writeString(offsets[2], object.examples);
  writer.writeBool(offsets[3], object.isAutoTranslated);
  writer.writeBool(offsets[4], object.isLearned);
  writer.writeDateTime(offsets[5], object.lastLearnDate);
  writer.writeLong(offsets[6], object.learnCount);
  writer.writeDateTime(offsets[7], object.learnDate);
  writer.writeString(offsets[8], object.notes);
  writer.writeString(offsets[9], object.originalText);
  writer.writeString(offsets[10], object.serverId);
  writer.writeString(offsets[11], object.transcription);
  writer.writeString(offsets[12], object.translatedText);
}

NoteLocal _noteLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NoteLocal(
    categoryId: reader.readStringOrNull(offsets[0]),
    createDate: reader.readDateTimeOrNull(offsets[1]),
    examples: reader.readStringOrNull(offsets[2]),
    isAutoTranslated: reader.readBoolOrNull(offsets[3]),
    isLearned: reader.readBoolOrNull(offsets[4]),
    lastLearnDate: reader.readDateTimeOrNull(offsets[5]),
    learnCount: reader.readLongOrNull(offsets[6]),
    learnDate: reader.readDateTimeOrNull(offsets[7]),
    notes: reader.readStringOrNull(offsets[8]),
    originalText: reader.readStringOrNull(offsets[9]),
    serverId: reader.readStringOrNull(offsets[10]),
    transcription: reader.readStringOrNull(offsets[11]),
    translatedText: reader.readStringOrNull(offsets[12]),
  );
  object.id = id;
  return object;
}

P _noteLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _noteLocalGetId(NoteLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _noteLocalGetLinks(NoteLocal object) {
  return [];
}

void _noteLocalAttach(IsarCollection<dynamic> col, Id id, NoteLocal object) {
  object.id = id;
}

extension NoteLocalQueryWhereSort
    on QueryBuilder<NoteLocal, NoteLocal, QWhere> {
  QueryBuilder<NoteLocal, NoteLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhere> anyServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'serverId'),
      );
    });
  }
}

extension NoteLocalQueryWhere
    on QueryBuilder<NoteLocal, NoteLocal, QWhereClause> {
  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdEqualTo(
      String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [serverId],
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdNotEqualTo(
      String? serverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [],
              upper: [serverId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [serverId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [serverId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [],
              upper: [serverId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdGreaterThan(
    String? serverId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [serverId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdLessThan(
    String? serverId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [],
        upper: [serverId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdBetween(
    String? lowerServerId,
    String? upperServerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [lowerServerId],
        includeLower: includeLower,
        upper: [upperServerId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdStartsWith(
      String ServerIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [ServerIdPrefix],
        upper: ['$ServerIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [''],
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterWhereClause> serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'serverId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'serverId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'serverId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'serverId',
              upper: [''],
            ));
      }
    });
  }
}

extension NoteLocalQueryFilter
    on QueryBuilder<NoteLocal, NoteLocal, QFilterCondition> {
  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryId',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      categoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryId',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      categoryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      categoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> categoryIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      categoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      categoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> createDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDate',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      createDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDate',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> createDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      createDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> createDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> createDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examples',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      examplesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examples',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examples',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examples',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examples',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> examplesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examples',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      examplesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examples',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      isAutoTranslatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isAutoTranslated',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      isAutoTranslatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isAutoTranslated',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      isAutoTranslatedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAutoTranslated',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> isLearnedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLearned',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      isLearnedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLearned',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> isLearnedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLearned',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      lastLearnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastLearnDate',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      lastLearnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastLearnDate',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      lastLearnDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastLearnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      lastLearnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastLearnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      lastLearnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastLearnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      lastLearnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastLearnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'learnCount',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      learnCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'learnCount',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'learnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      learnCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'learnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'learnCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'learnCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'learnDate',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      learnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'learnDate',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'learnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      learnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'learnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'learnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> learnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'learnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalText',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalText',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> originalTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> originalTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> originalTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalText',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      originalTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalText',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition> serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transcription',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transcription',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transcription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transcription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transcription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transcription',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      transcriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transcription',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translatedText',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translatedText',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translatedText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translatedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translatedText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translatedText',
        value: '',
      ));
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterFilterCondition>
      translatedTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translatedText',
        value: '',
      ));
    });
  }
}

extension NoteLocalQueryObject
    on QueryBuilder<NoteLocal, NoteLocal, QFilterCondition> {}

extension NoteLocalQueryLinks
    on QueryBuilder<NoteLocal, NoteLocal, QFilterCondition> {}

extension NoteLocalQuerySortBy on QueryBuilder<NoteLocal, NoteLocal, QSortBy> {
  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByExamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examples', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByExamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examples', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByIsAutoTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoTranslated', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy>
      sortByIsAutoTranslatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoTranslated', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByIsLearnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByLastLearnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLearnDate', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByLastLearnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLearnDate', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByLearnCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnCount', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByLearnCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnCount', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByLearnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnDate', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByLearnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnDate', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByOriginalText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByOriginalTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcription', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcription', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByTranslatedText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> sortByTranslatedTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.desc);
    });
  }
}

extension NoteLocalQuerySortThenBy
    on QueryBuilder<NoteLocal, NoteLocal, QSortThenBy> {
  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByCreateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDate', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByExamples() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examples', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByExamplesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examples', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByIsAutoTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoTranslated', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy>
      thenByIsAutoTranslatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAutoTranslated', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByIsLearnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByLastLearnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLearnDate', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByLastLearnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLearnDate', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByLearnCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnCount', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByLearnCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnCount', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByLearnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnDate', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByLearnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learnDate', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByOriginalText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByOriginalTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByTranscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcription', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByTranscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transcription', Sort.desc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByTranslatedText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.asc);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QAfterSortBy> thenByTranslatedTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translatedText', Sort.desc);
    });
  }
}

extension NoteLocalQueryWhereDistinct
    on QueryBuilder<NoteLocal, NoteLocal, QDistinct> {
  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByCategoryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByCreateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDate');
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByExamples(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examples', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByIsAutoTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAutoTranslated');
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLearned');
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByLastLearnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastLearnDate');
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByLearnCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'learnCount');
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByLearnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'learnDate');
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByOriginalText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByTranscription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transcription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoteLocal, NoteLocal, QDistinct> distinctByTranslatedText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translatedText',
          caseSensitive: caseSensitive);
    });
  }
}

extension NoteLocalQueryProperty
    on QueryBuilder<NoteLocal, NoteLocal, QQueryProperty> {
  QueryBuilder<NoteLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> categoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryId');
    });
  }

  QueryBuilder<NoteLocal, DateTime?, QQueryOperations> createDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDate');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> examplesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examples');
    });
  }

  QueryBuilder<NoteLocal, bool?, QQueryOperations> isAutoTranslatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAutoTranslated');
    });
  }

  QueryBuilder<NoteLocal, bool?, QQueryOperations> isLearnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLearned');
    });
  }

  QueryBuilder<NoteLocal, DateTime?, QQueryOperations> lastLearnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastLearnDate');
    });
  }

  QueryBuilder<NoteLocal, int?, QQueryOperations> learnCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'learnCount');
    });
  }

  QueryBuilder<NoteLocal, DateTime?, QQueryOperations> learnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'learnDate');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> originalTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalText');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> transcriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transcription');
    });
  }

  QueryBuilder<NoteLocal, String?, QQueryOperations> translatedTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translatedText');
    });
  }
}
