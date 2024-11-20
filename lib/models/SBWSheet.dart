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


/** This is an auto generated class representing the SBWSheet type in your schema. */
class SBWSheet extends amplify_core.Model {
  static const classType = const _SBWSheetModelType();
  final String id;
  final String? _date;
  final List<String>? _dailySheet;
  final String? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SBWSheetModelIdentifier get modelIdentifier {
      return SBWSheetModelIdentifier(
        id: id
      );
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
  
  List<String>? get dailySheet {
    return _dailySheet;
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
  
  const SBWSheet._internal({required this.id, required date, dailySheet, required status, createdAt, updatedAt}): _date = date, _dailySheet = dailySheet, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SBWSheet({String? id, required String date, List<String>? dailySheet, required String status}) {
    return SBWSheet._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      date: date,
      dailySheet: dailySheet != null ? List<String>.unmodifiable(dailySheet) : dailySheet,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SBWSheet &&
      id == other.id &&
      _date == other._date &&
      DeepCollectionEquality().equals(_dailySheet, other._dailySheet) &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SBWSheet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("dailySheet=" + (_dailySheet != null ? _dailySheet!.toString() : "null") + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SBWSheet copyWith({String? date, List<String>? dailySheet, String? status}) {
    return SBWSheet._internal(
      id: id,
      date: date ?? this.date,
      dailySheet: dailySheet ?? this.dailySheet,
      status: status ?? this.status);
  }
  
  SBWSheet copyWithModelFieldValues({
    ModelFieldValue<String>? date,
    ModelFieldValue<List<String>>? dailySheet,
    ModelFieldValue<String>? status
  }) {
    return SBWSheet._internal(
      id: id,
      date: date == null ? this.date : date.value,
      dailySheet: dailySheet == null ? this.dailySheet : dailySheet.value,
      status: status == null ? this.status : status.value
    );
  }
  
  SBWSheet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'],
      _dailySheet = json['dailySheet']?.cast<String>(),
      _status = json['status'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date, 'dailySheet': _dailySheet, 'status': _status, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'date': _date,
    'dailySheet': _dailySheet,
    'status': _status,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<SBWSheetModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<SBWSheetModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final DAILYSHEET = amplify_core.QueryField(fieldName: "dailySheet");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SBWSheet";
    modelSchemaDefinition.pluralName = "SBWSheets";
    
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
      key: SBWSheet.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SBWSheet.DAILYSHEET,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SBWSheet.STATUS,
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

class _SBWSheetModelType extends amplify_core.ModelType<SBWSheet> {
  const _SBWSheetModelType();
  
  @override
  SBWSheet fromJson(Map<String, dynamic> jsonData) {
    return SBWSheet.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SBWSheet';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SBWSheet] in your schema.
 */
class SBWSheetModelIdentifier implements amplify_core.ModelIdentifier<SBWSheet> {
  final String id;

  /** Create an instance of SBWSheetModelIdentifier using [id] the primary key. */
  const SBWSheetModelIdentifier({
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
  String toString() => 'SBWSheetModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SBWSheetModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}