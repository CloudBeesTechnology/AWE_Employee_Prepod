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


/** This is an auto generated class representing the LabourMedicalInfo type in your schema. */
class LabourMedicalInfo extends amplify_core.Model {
  static const classType = const _LabourMedicalInfoModelType();
  final String id;
  final String? _empID;
  final String? _overMD;
  final String? _overME;
  final String? _bruhimsRD;
  final String? _bruhimsRNo;
  final List<String>? _bruneiMAD;
  final List<String>? _bruneiME;
  final String? _uploadFitness;
  final String? _uploadRegis;
  final List<String>? _uploadBwn;
  final List<String>? _dependPass;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LabourMedicalInfoModelIdentifier get modelIdentifier {
      return LabourMedicalInfoModelIdentifier(
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
  
  String? get overMD {
    return _overMD;
  }
  
  String? get overME {
    return _overME;
  }
  
  String? get bruhimsRD {
    return _bruhimsRD;
  }
  
  String? get bruhimsRNo {
    return _bruhimsRNo;
  }
  
  List<String>? get bruneiMAD {
    return _bruneiMAD;
  }
  
  List<String>? get bruneiME {
    return _bruneiME;
  }
  
  String? get uploadFitness {
    return _uploadFitness;
  }
  
  String? get uploadRegis {
    return _uploadRegis;
  }
  
  List<String>? get uploadBwn {
    return _uploadBwn;
  }
  
  List<String>? get dependPass {
    return _dependPass;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LabourMedicalInfo._internal({required this.id, required empID, overMD, overME, bruhimsRD, bruhimsRNo, bruneiMAD, bruneiME, uploadFitness, uploadRegis, uploadBwn, dependPass, createdAt, updatedAt}): _empID = empID, _overMD = overMD, _overME = overME, _bruhimsRD = bruhimsRD, _bruhimsRNo = bruhimsRNo, _bruneiMAD = bruneiMAD, _bruneiME = bruneiME, _uploadFitness = uploadFitness, _uploadRegis = uploadRegis, _uploadBwn = uploadBwn, _dependPass = dependPass, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LabourMedicalInfo({String? id, required String empID, String? overMD, String? overME, String? bruhimsRD, String? bruhimsRNo, List<String>? bruneiMAD, List<String>? bruneiME, String? uploadFitness, String? uploadRegis, List<String>? uploadBwn, List<String>? dependPass}) {
    return LabourMedicalInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      overMD: overMD,
      overME: overME,
      bruhimsRD: bruhimsRD,
      bruhimsRNo: bruhimsRNo,
      bruneiMAD: bruneiMAD != null ? List<String>.unmodifiable(bruneiMAD) : bruneiMAD,
      bruneiME: bruneiME != null ? List<String>.unmodifiable(bruneiME) : bruneiME,
      uploadFitness: uploadFitness,
      uploadRegis: uploadRegis,
      uploadBwn: uploadBwn != null ? List<String>.unmodifiable(uploadBwn) : uploadBwn,
      dependPass: dependPass != null ? List<String>.unmodifiable(dependPass) : dependPass);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LabourMedicalInfo &&
      id == other.id &&
      _empID == other._empID &&
      _overMD == other._overMD &&
      _overME == other._overME &&
      _bruhimsRD == other._bruhimsRD &&
      _bruhimsRNo == other._bruhimsRNo &&
      DeepCollectionEquality().equals(_bruneiMAD, other._bruneiMAD) &&
      DeepCollectionEquality().equals(_bruneiME, other._bruneiME) &&
      _uploadFitness == other._uploadFitness &&
      _uploadRegis == other._uploadRegis &&
      DeepCollectionEquality().equals(_uploadBwn, other._uploadBwn) &&
      DeepCollectionEquality().equals(_dependPass, other._dependPass);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LabourMedicalInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("overMD=" + "$_overMD" + ", ");
    buffer.write("overME=" + "$_overME" + ", ");
    buffer.write("bruhimsRD=" + "$_bruhimsRD" + ", ");
    buffer.write("bruhimsRNo=" + "$_bruhimsRNo" + ", ");
    buffer.write("bruneiMAD=" + (_bruneiMAD != null ? _bruneiMAD!.toString() : "null") + ", ");
    buffer.write("bruneiME=" + (_bruneiME != null ? _bruneiME!.toString() : "null") + ", ");
    buffer.write("uploadFitness=" + "$_uploadFitness" + ", ");
    buffer.write("uploadRegis=" + "$_uploadRegis" + ", ");
    buffer.write("uploadBwn=" + (_uploadBwn != null ? _uploadBwn!.toString() : "null") + ", ");
    buffer.write("dependPass=" + (_dependPass != null ? _dependPass!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LabourMedicalInfo copyWith({String? empID, String? overMD, String? overME, String? bruhimsRD, String? bruhimsRNo, List<String>? bruneiMAD, List<String>? bruneiME, String? uploadFitness, String? uploadRegis, List<String>? uploadBwn, List<String>? dependPass}) {
    return LabourMedicalInfo._internal(
      id: id,
      empID: empID ?? this.empID,
      overMD: overMD ?? this.overMD,
      overME: overME ?? this.overME,
      bruhimsRD: bruhimsRD ?? this.bruhimsRD,
      bruhimsRNo: bruhimsRNo ?? this.bruhimsRNo,
      bruneiMAD: bruneiMAD ?? this.bruneiMAD,
      bruneiME: bruneiME ?? this.bruneiME,
      uploadFitness: uploadFitness ?? this.uploadFitness,
      uploadRegis: uploadRegis ?? this.uploadRegis,
      uploadBwn: uploadBwn ?? this.uploadBwn,
      dependPass: dependPass ?? this.dependPass);
  }
  
  LabourMedicalInfo copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String?>? overMD,
    ModelFieldValue<String?>? overME,
    ModelFieldValue<String?>? bruhimsRD,
    ModelFieldValue<String?>? bruhimsRNo,
    ModelFieldValue<List<String>?>? bruneiMAD,
    ModelFieldValue<List<String>?>? bruneiME,
    ModelFieldValue<String?>? uploadFitness,
    ModelFieldValue<String?>? uploadRegis,
    ModelFieldValue<List<String>?>? uploadBwn,
    ModelFieldValue<List<String>?>? dependPass
  }) {
    return LabourMedicalInfo._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      overMD: overMD == null ? this.overMD : overMD.value,
      overME: overME == null ? this.overME : overME.value,
      bruhimsRD: bruhimsRD == null ? this.bruhimsRD : bruhimsRD.value,
      bruhimsRNo: bruhimsRNo == null ? this.bruhimsRNo : bruhimsRNo.value,
      bruneiMAD: bruneiMAD == null ? this.bruneiMAD : bruneiMAD.value,
      bruneiME: bruneiME == null ? this.bruneiME : bruneiME.value,
      uploadFitness: uploadFitness == null ? this.uploadFitness : uploadFitness.value,
      uploadRegis: uploadRegis == null ? this.uploadRegis : uploadRegis.value,
      uploadBwn: uploadBwn == null ? this.uploadBwn : uploadBwn.value,
      dependPass: dependPass == null ? this.dependPass : dependPass.value
    );
  }
  
  LabourMedicalInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _overMD = json['overMD'],
      _overME = json['overME'],
      _bruhimsRD = json['bruhimsRD'],
      _bruhimsRNo = json['bruhimsRNo'],
      _bruneiMAD = json['bruneiMAD']?.cast<String>(),
      _bruneiME = json['bruneiME']?.cast<String>(),
      _uploadFitness = json['uploadFitness'],
      _uploadRegis = json['uploadRegis'],
      _uploadBwn = json['uploadBwn']?.cast<String>(),
      _dependPass = json['dependPass']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'overMD': _overMD, 'overME': _overME, 'bruhimsRD': _bruhimsRD, 'bruhimsRNo': _bruhimsRNo, 'bruneiMAD': _bruneiMAD, 'bruneiME': _bruneiME, 'uploadFitness': _uploadFitness, 'uploadRegis': _uploadRegis, 'uploadBwn': _uploadBwn, 'dependPass': _dependPass, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'overMD': _overMD,
    'overME': _overME,
    'bruhimsRD': _bruhimsRD,
    'bruhimsRNo': _bruhimsRNo,
    'bruneiMAD': _bruneiMAD,
    'bruneiME': _bruneiME,
    'uploadFitness': _uploadFitness,
    'uploadRegis': _uploadRegis,
    'uploadBwn': _uploadBwn,
    'dependPass': _dependPass,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LabourMedicalInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LabourMedicalInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final OVERMD = amplify_core.QueryField(fieldName: "overMD");
  static final OVERME = amplify_core.QueryField(fieldName: "overME");
  static final BRUHIMSRD = amplify_core.QueryField(fieldName: "bruhimsRD");
  static final BRUHIMSRNO = amplify_core.QueryField(fieldName: "bruhimsRNo");
  static final BRUNEIMAD = amplify_core.QueryField(fieldName: "bruneiMAD");
  static final BRUNEIME = amplify_core.QueryField(fieldName: "bruneiME");
  static final UPLOADFITNESS = amplify_core.QueryField(fieldName: "uploadFitness");
  static final UPLOADREGIS = amplify_core.QueryField(fieldName: "uploadRegis");
  static final UPLOADBWN = amplify_core.QueryField(fieldName: "uploadBwn");
  static final DEPENDPASS = amplify_core.QueryField(fieldName: "dependPass");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LabourMedicalInfo";
    modelSchemaDefinition.pluralName = "LabourMedicalInfos";
    
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
      key: LabourMedicalInfo.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.OVERMD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.OVERME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.BRUHIMSRD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.BRUHIMSRNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.BRUNEIMAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.BRUNEIME,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.UPLOADFITNESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.UPLOADREGIS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.UPLOADBWN,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LabourMedicalInfo.DEPENDPASS,
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

class _LabourMedicalInfoModelType extends amplify_core.ModelType<LabourMedicalInfo> {
  const _LabourMedicalInfoModelType();
  
  @override
  LabourMedicalInfo fromJson(Map<String, dynamic> jsonData) {
    return LabourMedicalInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LabourMedicalInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LabourMedicalInfo] in your schema.
 */
class LabourMedicalInfoModelIdentifier implements amplify_core.ModelIdentifier<LabourMedicalInfo> {
  final String id;

  /** Create an instance of LabourMedicalInfoModelIdentifier using [id] the primary key. */
  const LabourMedicalInfoModelIdentifier({
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
  String toString() => 'LabourMedicalInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LabourMedicalInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}