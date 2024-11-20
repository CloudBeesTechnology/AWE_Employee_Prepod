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


/** This is an auto generated class representing the TerminationInfo type in your schema. */
class TerminationInfo extends amplify_core.Model {
  static const classType = const _TerminationInfoModelType();
  final String id;
  final String? _empID;
  final String? _resignDate;
  final String? _resignNotProb;
  final String? _otherResignNotProb;
  final String? _resignNotConf;
  final String? _otherResignNotConf;
  final String? _reasonResign;
  final String? _reasonTerminate;
  final String? _termiDate;
  final String? _termiNotProb;
  final String? _otherTermiNotProb;
  final String? _termiNotConf;
  final String? _otherTermiNotConf;
  final List<String>? _workInfoUploads;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TerminationInfoModelIdentifier get modelIdentifier {
      return TerminationInfoModelIdentifier(
        id: id
      );
  }
  
  String get empID {
    try {
      return _empID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get resignDate {
    return _resignDate;
  }
  
  String? get resignNotProb {
    return _resignNotProb;
  }
  
  String? get otherResignNotProb {
    return _otherResignNotProb;
  }
  
  String? get resignNotConf {
    return _resignNotConf;
  }
  
  String? get otherResignNotConf {
    return _otherResignNotConf;
  }
  
  String? get reasonResign {
    return _reasonResign;
  }
  
  String? get reasonTerminate {
    return _reasonTerminate;
  }
  
  String? get termiDate {
    return _termiDate;
  }
  
  String? get termiNotProb {
    return _termiNotProb;
  }
  
  String? get otherTermiNotProb {
    return _otherTermiNotProb;
  }
  
  String? get termiNotConf {
    return _termiNotConf;
  }
  
  String? get otherTermiNotConf {
    return _otherTermiNotConf;
  }
  
  List<String>? get workInfoUploads {
    return _workInfoUploads;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TerminationInfo._internal({required this.id, required empID, resignDate, resignNotProb, otherResignNotProb, resignNotConf, otherResignNotConf, reasonResign, reasonTerminate, termiDate, termiNotProb, otherTermiNotProb, termiNotConf, otherTermiNotConf, workInfoUploads, createdAt, updatedAt}): _empID = empID, _resignDate = resignDate, _resignNotProb = resignNotProb, _otherResignNotProb = otherResignNotProb, _resignNotConf = resignNotConf, _otherResignNotConf = otherResignNotConf, _reasonResign = reasonResign, _reasonTerminate = reasonTerminate, _termiDate = termiDate, _termiNotProb = termiNotProb, _otherTermiNotProb = otherTermiNotProb, _termiNotConf = termiNotConf, _otherTermiNotConf = otherTermiNotConf, _workInfoUploads = workInfoUploads, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TerminationInfo({String? id, required String empID, String? resignDate, String? resignNotProb, String? otherResignNotProb, String? resignNotConf, String? otherResignNotConf, String? reasonResign, String? reasonTerminate, String? termiDate, String? termiNotProb, String? otherTermiNotProb, String? termiNotConf, String? otherTermiNotConf, List<String>? workInfoUploads}) {
    return TerminationInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      resignDate: resignDate,
      resignNotProb: resignNotProb,
      otherResignNotProb: otherResignNotProb,
      resignNotConf: resignNotConf,
      otherResignNotConf: otherResignNotConf,
      reasonResign: reasonResign,
      reasonTerminate: reasonTerminate,
      termiDate: termiDate,
      termiNotProb: termiNotProb,
      otherTermiNotProb: otherTermiNotProb,
      termiNotConf: termiNotConf,
      otherTermiNotConf: otherTermiNotConf,
      workInfoUploads: workInfoUploads != null ? List<String>.unmodifiable(workInfoUploads) : workInfoUploads);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TerminationInfo &&
      id == other.id &&
      _empID == other._empID &&
      _resignDate == other._resignDate &&
      _resignNotProb == other._resignNotProb &&
      _otherResignNotProb == other._otherResignNotProb &&
      _resignNotConf == other._resignNotConf &&
      _otherResignNotConf == other._otherResignNotConf &&
      _reasonResign == other._reasonResign &&
      _reasonTerminate == other._reasonTerminate &&
      _termiDate == other._termiDate &&
      _termiNotProb == other._termiNotProb &&
      _otherTermiNotProb == other._otherTermiNotProb &&
      _termiNotConf == other._termiNotConf &&
      _otherTermiNotConf == other._otherTermiNotConf &&
      DeepCollectionEquality().equals(_workInfoUploads, other._workInfoUploads);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TerminationInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("resignDate=" + "$_resignDate" + ", ");
    buffer.write("resignNotProb=" + "$_resignNotProb" + ", ");
    buffer.write("otherResignNotProb=" + "$_otherResignNotProb" + ", ");
    buffer.write("resignNotConf=" + "$_resignNotConf" + ", ");
    buffer.write("otherResignNotConf=" + "$_otherResignNotConf" + ", ");
    buffer.write("reasonResign=" + "$_reasonResign" + ", ");
    buffer.write("reasonTerminate=" + "$_reasonTerminate" + ", ");
    buffer.write("termiDate=" + "$_termiDate" + ", ");
    buffer.write("termiNotProb=" + "$_termiNotProb" + ", ");
    buffer.write("otherTermiNotProb=" + "$_otherTermiNotProb" + ", ");
    buffer.write("termiNotConf=" + "$_termiNotConf" + ", ");
    buffer.write("otherTermiNotConf=" + "$_otherTermiNotConf" + ", ");
    buffer.write("workInfoUploads=" + (_workInfoUploads != null ? _workInfoUploads!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TerminationInfo copyWith({String? empID, String? resignDate, String? resignNotProb, String? otherResignNotProb, String? resignNotConf, String? otherResignNotConf, String? reasonResign, String? reasonTerminate, String? termiDate, String? termiNotProb, String? otherTermiNotProb, String? termiNotConf, String? otherTermiNotConf, List<String>? workInfoUploads}) {
    return TerminationInfo._internal(
      id: id,
      empID: empID ?? this.empID,
      resignDate: resignDate ?? this.resignDate,
      resignNotProb: resignNotProb ?? this.resignNotProb,
      otherResignNotProb: otherResignNotProb ?? this.otherResignNotProb,
      resignNotConf: resignNotConf ?? this.resignNotConf,
      otherResignNotConf: otherResignNotConf ?? this.otherResignNotConf,
      reasonResign: reasonResign ?? this.reasonResign,
      reasonTerminate: reasonTerminate ?? this.reasonTerminate,
      termiDate: termiDate ?? this.termiDate,
      termiNotProb: termiNotProb ?? this.termiNotProb,
      otherTermiNotProb: otherTermiNotProb ?? this.otherTermiNotProb,
      termiNotConf: termiNotConf ?? this.termiNotConf,
      otherTermiNotConf: otherTermiNotConf ?? this.otherTermiNotConf,
      workInfoUploads: workInfoUploads ?? this.workInfoUploads);
  }
  
  TerminationInfo copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String?>? resignDate,
    ModelFieldValue<String?>? resignNotProb,
    ModelFieldValue<String?>? otherResignNotProb,
    ModelFieldValue<String?>? resignNotConf,
    ModelFieldValue<String?>? otherResignNotConf,
    ModelFieldValue<String?>? reasonResign,
    ModelFieldValue<String?>? reasonTerminate,
    ModelFieldValue<String?>? termiDate,
    ModelFieldValue<String?>? termiNotProb,
    ModelFieldValue<String?>? otherTermiNotProb,
    ModelFieldValue<String?>? termiNotConf,
    ModelFieldValue<String?>? otherTermiNotConf,
    ModelFieldValue<List<String>?>? workInfoUploads
  }) {
    return TerminationInfo._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      resignDate: resignDate == null ? this.resignDate : resignDate.value,
      resignNotProb: resignNotProb == null ? this.resignNotProb : resignNotProb.value,
      otherResignNotProb: otherResignNotProb == null ? this.otherResignNotProb : otherResignNotProb.value,
      resignNotConf: resignNotConf == null ? this.resignNotConf : resignNotConf.value,
      otherResignNotConf: otherResignNotConf == null ? this.otherResignNotConf : otherResignNotConf.value,
      reasonResign: reasonResign == null ? this.reasonResign : reasonResign.value,
      reasonTerminate: reasonTerminate == null ? this.reasonTerminate : reasonTerminate.value,
      termiDate: termiDate == null ? this.termiDate : termiDate.value,
      termiNotProb: termiNotProb == null ? this.termiNotProb : termiNotProb.value,
      otherTermiNotProb: otherTermiNotProb == null ? this.otherTermiNotProb : otherTermiNotProb.value,
      termiNotConf: termiNotConf == null ? this.termiNotConf : termiNotConf.value,
      otherTermiNotConf: otherTermiNotConf == null ? this.otherTermiNotConf : otherTermiNotConf.value,
      workInfoUploads: workInfoUploads == null ? this.workInfoUploads : workInfoUploads.value
    );
  }
  
  TerminationInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _resignDate = json['resignDate'],
      _resignNotProb = json['resignNotProb'],
      _otherResignNotProb = json['otherResignNotProb'],
      _resignNotConf = json['resignNotConf'],
      _otherResignNotConf = json['otherResignNotConf'],
      _reasonResign = json['reasonResign'],
      _reasonTerminate = json['reasonTerminate'],
      _termiDate = json['termiDate'],
      _termiNotProb = json['termiNotProb'],
      _otherTermiNotProb = json['otherTermiNotProb'],
      _termiNotConf = json['termiNotConf'],
      _otherTermiNotConf = json['otherTermiNotConf'],
      _workInfoUploads = json['workInfoUploads']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'resignDate': _resignDate, 'resignNotProb': _resignNotProb, 'otherResignNotProb': _otherResignNotProb, 'resignNotConf': _resignNotConf, 'otherResignNotConf': _otherResignNotConf, 'reasonResign': _reasonResign, 'reasonTerminate': _reasonTerminate, 'termiDate': _termiDate, 'termiNotProb': _termiNotProb, 'otherTermiNotProb': _otherTermiNotProb, 'termiNotConf': _termiNotConf, 'otherTermiNotConf': _otherTermiNotConf, 'workInfoUploads': _workInfoUploads, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'resignDate': _resignDate,
    'resignNotProb': _resignNotProb,
    'otherResignNotProb': _otherResignNotProb,
    'resignNotConf': _resignNotConf,
    'otherResignNotConf': _otherResignNotConf,
    'reasonResign': _reasonResign,
    'reasonTerminate': _reasonTerminate,
    'termiDate': _termiDate,
    'termiNotProb': _termiNotProb,
    'otherTermiNotProb': _otherTermiNotProb,
    'termiNotConf': _termiNotConf,
    'otherTermiNotConf': _otherTermiNotConf,
    'workInfoUploads': _workInfoUploads,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TerminationInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TerminationInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final RESIGNDATE = amplify_core.QueryField(fieldName: "resignDate");
  static final RESIGNNOTPROB = amplify_core.QueryField(fieldName: "resignNotProb");
  static final OTHERRESIGNNOTPROB = amplify_core.QueryField(fieldName: "otherResignNotProb");
  static final RESIGNNOTCONF = amplify_core.QueryField(fieldName: "resignNotConf");
  static final OTHERRESIGNNOTCONF = amplify_core.QueryField(fieldName: "otherResignNotConf");
  static final REASONRESIGN = amplify_core.QueryField(fieldName: "reasonResign");
  static final REASONTERMINATE = amplify_core.QueryField(fieldName: "reasonTerminate");
  static final TERMIDATE = amplify_core.QueryField(fieldName: "termiDate");
  static final TERMINOTPROB = amplify_core.QueryField(fieldName: "termiNotProb");
  static final OTHERTERMINOTPROB = amplify_core.QueryField(fieldName: "otherTermiNotProb");
  static final TERMINOTCONF = amplify_core.QueryField(fieldName: "termiNotConf");
  static final OTHERTERMINOTCONF = amplify_core.QueryField(fieldName: "otherTermiNotConf");
  static final WORKINFOUPLOADS = amplify_core.QueryField(fieldName: "workInfoUploads");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TerminationInfo";
    modelSchemaDefinition.pluralName = "TerminationInfos";
    
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
      key: TerminationInfo.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.RESIGNDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.RESIGNNOTPROB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.OTHERRESIGNNOTPROB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.RESIGNNOTCONF,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.OTHERRESIGNNOTCONF,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.REASONRESIGN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.REASONTERMINATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.TERMIDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.TERMINOTPROB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.OTHERTERMINOTPROB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.TERMINOTCONF,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.OTHERTERMINOTCONF,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TerminationInfo.WORKINFOUPLOADS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
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

class _TerminationInfoModelType extends amplify_core.ModelType<TerminationInfo> {
  const _TerminationInfoModelType();
  
  @override
  TerminationInfo fromJson(Map<String, dynamic> jsonData) {
    return TerminationInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TerminationInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TerminationInfo] in your schema.
 */
class TerminationInfoModelIdentifier implements amplify_core.ModelIdentifier<TerminationInfo> {
  final String id;

  /** Create an instance of TerminationInfoModelIdentifier using [id] the primary key. */
  const TerminationInfoModelIdentifier({
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
  String toString() => 'TerminationInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TerminationInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}