/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Blng type in your schema. */
class Blng extends amplify_core.Model {
  static const classType = const _BlngModelType();
  final String id;
  final List<String>? _weeklySheet;
  final String? _date;
  final String? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BlngModelIdentifier get modelIdentifier {
      return BlngModelIdentifier(
        id: id
      );
  }
  
  List<String>? get weeklySheet {
    return _weeklySheet;
  }
  
  String get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Blng._internal({required this.id, weeklySheet, required date, required status, createdAt, updatedAt}): _weeklySheet = weeklySheet, _date = date, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Blng({String? id, List<String>? weeklySheet, required String date, required String status}) {
    return Blng._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      weeklySheet: weeklySheet != null ? List<String>.unmodifiable(weeklySheet) : weeklySheet,
      date: date,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Blng &&
      id == other.id &&
      DeepCollectionEquality().equals(_weeklySheet, other._weeklySheet) &&
      _date == other._date &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Blng {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("weeklySheet=" + (_weeklySheet != null ? _weeklySheet!.toString() : "null") + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Blng copyWith({List<String>? weeklySheet, String? date, String? status}) {
    return Blng._internal(
      id: id,
      weeklySheet: weeklySheet ?? this.weeklySheet,
      date: date ?? this.date,
      status: status ?? this.status);
  }
  
  Blng copyWithModelFieldValues({
    ModelFieldValue<List<String>>? weeklySheet,
    ModelFieldValue<String>? date,
    ModelFieldValue<String>? status
  }) {
    return Blng._internal(
      id: id,
      weeklySheet: weeklySheet == null ? this.weeklySheet : weeklySheet.value,
      date: date == null ? this.date : date.value,
      status: status == null ? this.status : status.value
    );
  }
  
  Blng.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _weeklySheet = json['weeklySheet']?.cast<String>(),
      _date = json['date'],
      _status = json['status'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'weeklySheet': _weeklySheet, 'date': _date, 'status': _status, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'weeklySheet': _weeklySheet,
    'date': _date,
    'status': _status,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<BlngModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<BlngModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final WEEKLYSHEET = amplify_core.QueryField(fieldName: "weeklySheet");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Blng";
    modelSchemaDefinition.pluralName = "Blngs";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Blng.WEEKLYSHEET,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Blng.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Blng.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _BlngModelType extends amplify_core.ModelType<Blng> {
  const _BlngModelType();
  
  @override
  Blng fromJson(Map<String, dynamic> jsonData) {
    return Blng.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Blng';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Blng] in your schema.
 */
class BlngModelIdentifier implements amplify_core.ModelIdentifier<Blng> {
  final String id;

  /** Create an instance of BlngModelIdentifier using [id] the primary key. */
  const BlngModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'BlngModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BlngModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}