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


/** This is an auto generated class representing the LocalMobilization type in your schema. */
class LocalMobilization extends amplify_core.Model {
  static const classType = const _LocalMobilizationModelType();
  final String id;
  final String? _tempID;
  final String? _mobSignDate;
  final String? _mobFile;
  final String? _paafApproveDate;
  final String? _paafFile;
  final String? _loiIssueDate;
  final String? _loiAcceptDate;
  final String? _loiDeclineDate;
  final String? _declineReason;
  final String? _loiFile;
  final String? _cvecApproveDate;
  final String? _cvecFile;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LocalMobilizationModelIdentifier get modelIdentifier {
      return LocalMobilizationModelIdentifier(
        id: id
      );
  }
  
  String? get tempID {
    return _tempID;
  }
  
  String? get mobSignDate {
    return _mobSignDate;
  }
  
  String? get mobFile {
    return _mobFile;
  }
  
  String? get paafApproveDate {
    return _paafApproveDate;
  }
  
  String? get paafFile {
    return _paafFile;
  }
  
  String? get loiIssueDate {
    return _loiIssueDate;
  }
  
  String? get loiAcceptDate {
    return _loiAcceptDate;
  }
  
  String? get loiDeclineDate {
    return _loiDeclineDate;
  }
  
  String? get declineReason {
    return _declineReason;
  }
  
  String? get loiFile {
    return _loiFile;
  }
  
  String? get cvecApproveDate {
    return _cvecApproveDate;
  }
  
  String? get cvecFile {
    return _cvecFile;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LocalMobilization._internal({required this.id, tempID, mobSignDate, mobFile, paafApproveDate, paafFile, loiIssueDate, loiAcceptDate, loiDeclineDate, declineReason, loiFile, cvecApproveDate, cvecFile, createdAt, updatedAt}): _tempID = tempID, _mobSignDate = mobSignDate, _mobFile = mobFile, _paafApproveDate = paafApproveDate, _paafFile = paafFile, _loiIssueDate = loiIssueDate, _loiAcceptDate = loiAcceptDate, _loiDeclineDate = loiDeclineDate, _declineReason = declineReason, _loiFile = loiFile, _cvecApproveDate = cvecApproveDate, _cvecFile = cvecFile, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LocalMobilization({String? id, String? tempID, String? mobSignDate, String? mobFile, String? paafApproveDate, String? paafFile, String? loiIssueDate, String? loiAcceptDate, String? loiDeclineDate, String? declineReason, String? loiFile, String? cvecApproveDate, String? cvecFile}) {
    return LocalMobilization._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      tempID: tempID,
      mobSignDate: mobSignDate,
      mobFile: mobFile,
      paafApproveDate: paafApproveDate,
      paafFile: paafFile,
      loiIssueDate: loiIssueDate,
      loiAcceptDate: loiAcceptDate,
      loiDeclineDate: loiDeclineDate,
      declineReason: declineReason,
      loiFile: loiFile,
      cvecApproveDate: cvecApproveDate,
      cvecFile: cvecFile);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocalMobilization &&
      id == other.id &&
      _tempID == other._tempID &&
      _mobSignDate == other._mobSignDate &&
      _mobFile == other._mobFile &&
      _paafApproveDate == other._paafApproveDate &&
      _paafFile == other._paafFile &&
      _loiIssueDate == other._loiIssueDate &&
      _loiAcceptDate == other._loiAcceptDate &&
      _loiDeclineDate == other._loiDeclineDate &&
      _declineReason == other._declineReason &&
      _loiFile == other._loiFile &&
      _cvecApproveDate == other._cvecApproveDate &&
      _cvecFile == other._cvecFile;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LocalMobilization {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tempID=" + "$_tempID" + ", ");
    buffer.write("mobSignDate=" + "$_mobSignDate" + ", ");
    buffer.write("mobFile=" + "$_mobFile" + ", ");
    buffer.write("paafApproveDate=" + "$_paafApproveDate" + ", ");
    buffer.write("paafFile=" + "$_paafFile" + ", ");
    buffer.write("loiIssueDate=" + "$_loiIssueDate" + ", ");
    buffer.write("loiAcceptDate=" + "$_loiAcceptDate" + ", ");
    buffer.write("loiDeclineDate=" + "$_loiDeclineDate" + ", ");
    buffer.write("declineReason=" + "$_declineReason" + ", ");
    buffer.write("loiFile=" + "$_loiFile" + ", ");
    buffer.write("cvecApproveDate=" + "$_cvecApproveDate" + ", ");
    buffer.write("cvecFile=" + "$_cvecFile" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LocalMobilization copyWith({String? tempID, String? mobSignDate, String? mobFile, String? paafApproveDate, String? paafFile, String? loiIssueDate, String? loiAcceptDate, String? loiDeclineDate, String? declineReason, String? loiFile, String? cvecApproveDate, String? cvecFile}) {
    return LocalMobilization._internal(
      id: id,
      tempID: tempID ?? this.tempID,
      mobSignDate: mobSignDate ?? this.mobSignDate,
      mobFile: mobFile ?? this.mobFile,
      paafApproveDate: paafApproveDate ?? this.paafApproveDate,
      paafFile: paafFile ?? this.paafFile,
      loiIssueDate: loiIssueDate ?? this.loiIssueDate,
      loiAcceptDate: loiAcceptDate ?? this.loiAcceptDate,
      loiDeclineDate: loiDeclineDate ?? this.loiDeclineDate,
      declineReason: declineReason ?? this.declineReason,
      loiFile: loiFile ?? this.loiFile,
      cvecApproveDate: cvecApproveDate ?? this.cvecApproveDate,
      cvecFile: cvecFile ?? this.cvecFile);
  }
  
  LocalMobilization copyWithModelFieldValues({
    ModelFieldValue<String?>? tempID,
    ModelFieldValue<String?>? mobSignDate,
    ModelFieldValue<String?>? mobFile,
    ModelFieldValue<String?>? paafApproveDate,
    ModelFieldValue<String?>? paafFile,
    ModelFieldValue<String?>? loiIssueDate,
    ModelFieldValue<String?>? loiAcceptDate,
    ModelFieldValue<String?>? loiDeclineDate,
    ModelFieldValue<String?>? declineReason,
    ModelFieldValue<String?>? loiFile,
    ModelFieldValue<String?>? cvecApproveDate,
    ModelFieldValue<String?>? cvecFile
  }) {
    return LocalMobilization._internal(
      id: id,
      tempID: tempID == null ? this.tempID : tempID.value,
      mobSignDate: mobSignDate == null ? this.mobSignDate : mobSignDate.value,
      mobFile: mobFile == null ? this.mobFile : mobFile.value,
      paafApproveDate: paafApproveDate == null ? this.paafApproveDate : paafApproveDate.value,
      paafFile: paafFile == null ? this.paafFile : paafFile.value,
      loiIssueDate: loiIssueDate == null ? this.loiIssueDate : loiIssueDate.value,
      loiAcceptDate: loiAcceptDate == null ? this.loiAcceptDate : loiAcceptDate.value,
      loiDeclineDate: loiDeclineDate == null ? this.loiDeclineDate : loiDeclineDate.value,
      declineReason: declineReason == null ? this.declineReason : declineReason.value,
      loiFile: loiFile == null ? this.loiFile : loiFile.value,
      cvecApproveDate: cvecApproveDate == null ? this.cvecApproveDate : cvecApproveDate.value,
      cvecFile: cvecFile == null ? this.cvecFile : cvecFile.value
    );
  }
  
  LocalMobilization.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tempID = json['tempID'],
      _mobSignDate = json['mobSignDate'],
      _mobFile = json['mobFile'],
      _paafApproveDate = json['paafApproveDate'],
      _paafFile = json['paafFile'],
      _loiIssueDate = json['loiIssueDate'],
      _loiAcceptDate = json['loiAcceptDate'],
      _loiDeclineDate = json['loiDeclineDate'],
      _declineReason = json['declineReason'],
      _loiFile = json['loiFile'],
      _cvecApproveDate = json['cvecApproveDate'],
      _cvecFile = json['cvecFile'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tempID': _tempID, 'mobSignDate': _mobSignDate, 'mobFile': _mobFile, 'paafApproveDate': _paafApproveDate, 'paafFile': _paafFile, 'loiIssueDate': _loiIssueDate, 'loiAcceptDate': _loiAcceptDate, 'loiDeclineDate': _loiDeclineDate, 'declineReason': _declineReason, 'loiFile': _loiFile, 'cvecApproveDate': _cvecApproveDate, 'cvecFile': _cvecFile, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'tempID': _tempID,
    'mobSignDate': _mobSignDate,
    'mobFile': _mobFile,
    'paafApproveDate': _paafApproveDate,
    'paafFile': _paafFile,
    'loiIssueDate': _loiIssueDate,
    'loiAcceptDate': _loiAcceptDate,
    'loiDeclineDate': _loiDeclineDate,
    'declineReason': _declineReason,
    'loiFile': _loiFile,
    'cvecApproveDate': _cvecApproveDate,
    'cvecFile': _cvecFile,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LocalMobilizationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LocalMobilizationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TEMPID = amplify_core.QueryField(fieldName: "tempID");
  static final MOBSIGNDATE = amplify_core.QueryField(fieldName: "mobSignDate");
  static final MOBFILE = amplify_core.QueryField(fieldName: "mobFile");
  static final PAAFAPPROVEDATE = amplify_core.QueryField(fieldName: "paafApproveDate");
  static final PAAFFILE = amplify_core.QueryField(fieldName: "paafFile");
  static final LOIISSUEDATE = amplify_core.QueryField(fieldName: "loiIssueDate");
  static final LOIACCEPTDATE = amplify_core.QueryField(fieldName: "loiAcceptDate");
  static final LOIDECLINEDATE = amplify_core.QueryField(fieldName: "loiDeclineDate");
  static final DECLINEREASON = amplify_core.QueryField(fieldName: "declineReason");
  static final LOIFILE = amplify_core.QueryField(fieldName: "loiFile");
  static final CVECAPPROVEDATE = amplify_core.QueryField(fieldName: "cvecApproveDate");
  static final CVECFILE = amplify_core.QueryField(fieldName: "cvecFile");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LocalMobilization";
    modelSchemaDefinition.pluralName = "LocalMobilizations";
    
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
      key: LocalMobilization.TEMPID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.MOBSIGNDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.MOBFILE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.PAAFAPPROVEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.PAAFFILE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.LOIISSUEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.LOIACCEPTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.LOIDECLINEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.DECLINEREASON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.LOIFILE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.CVECAPPROVEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LocalMobilization.CVECFILE,
      isRequired: false,
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

class _LocalMobilizationModelType extends amplify_core.ModelType<LocalMobilization> {
  const _LocalMobilizationModelType();
  
  @override
  LocalMobilization fromJson(Map<String, dynamic> jsonData) {
    return LocalMobilization.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LocalMobilization';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LocalMobilization] in your schema.
 */
class LocalMobilizationModelIdentifier implements amplify_core.ModelIdentifier<LocalMobilization> {
  final String id;

  /** Create an instance of LocalMobilizationModelIdentifier using [id] the primary key. */
  const LocalMobilizationModelIdentifier({
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
  String toString() => 'LocalMobilizationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LocalMobilizationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}