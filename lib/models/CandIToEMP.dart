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


/** This is an auto generated class representing the CandIToEMP type in your schema. */
class CandIToEMP extends amplify_core.Model {
  static const classType = const _CandIToEMPModelType();
  final String id;
  final String? _empID;
  final String? _crime;
  final String? _crimeDesc;
  final List<String>? _emgDetails;
  final String? _noExperience;
  final String? _empStatement;
  final String? _desc;
  final String? _disease;
  final String? _diseaseDesc;
  final String? _liquor;
  final String? _liquorDesc;
  final String? _perIS;
  final String? _perID;
  final List<String>? _referees;
  final List<String>? _relatives;
  final String? _salaryExpectation;
  final String? _supportInfo;
  final List<String>? _workExperience;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CandIToEMPModelIdentifier get modelIdentifier {
      return CandIToEMPModelIdentifier(
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
  
  String? get crime {
    return _crime;
  }
  
  String? get crimeDesc {
    return _crimeDesc;
  }
  
  List<String>? get emgDetails {
    return _emgDetails;
  }
  
  String get noExperience {
    try {
      return _noExperience!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get empStatement {
    try {
      return _empStatement!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get desc {
    return _desc;
  }
  
  String? get disease {
    return _disease;
  }
  
  String? get diseaseDesc {
    return _diseaseDesc;
  }
  
  String? get liquor {
    return _liquor;
  }
  
  String? get liquorDesc {
    return _liquorDesc;
  }
  
  String get perIS {
    try {
      return _perIS!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get perID {
    return _perID;
  }
  
  List<String>? get referees {
    return _referees;
  }
  
  List<String>? get relatives {
    return _relatives;
  }
  
  String? get salaryExpectation {
    return _salaryExpectation;
  }
  
  String? get supportInfo {
    return _supportInfo;
  }
  
  List<String>? get workExperience {
    return _workExperience;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CandIToEMP._internal({required this.id, required empID, crime, crimeDesc, emgDetails, required noExperience, required empStatement, desc, disease, diseaseDesc, liquor, liquorDesc, required perIS, perID, referees, relatives, salaryExpectation, supportInfo, workExperience, createdAt, updatedAt}): _empID = empID, _crime = crime, _crimeDesc = crimeDesc, _emgDetails = emgDetails, _noExperience = noExperience, _empStatement = empStatement, _desc = desc, _disease = disease, _diseaseDesc = diseaseDesc, _liquor = liquor, _liquorDesc = liquorDesc, _perIS = perIS, _perID = perID, _referees = referees, _relatives = relatives, _salaryExpectation = salaryExpectation, _supportInfo = supportInfo, _workExperience = workExperience, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CandIToEMP({String? id, required String empID, String? crime, String? crimeDesc, List<String>? emgDetails, required String noExperience, required String empStatement, String? desc, String? disease, String? diseaseDesc, String? liquor, String? liquorDesc, required String perIS, String? perID, List<String>? referees, List<String>? relatives, String? salaryExpectation, String? supportInfo, List<String>? workExperience}) {
    return CandIToEMP._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      crime: crime,
      crimeDesc: crimeDesc,
      emgDetails: emgDetails != null ? List<String>.unmodifiable(emgDetails) : emgDetails,
      noExperience: noExperience,
      empStatement: empStatement,
      desc: desc,
      disease: disease,
      diseaseDesc: diseaseDesc,
      liquor: liquor,
      liquorDesc: liquorDesc,
      perIS: perIS,
      perID: perID,
      referees: referees != null ? List<String>.unmodifiable(referees) : referees,
      relatives: relatives != null ? List<String>.unmodifiable(relatives) : relatives,
      salaryExpectation: salaryExpectation,
      supportInfo: supportInfo,
      workExperience: workExperience != null ? List<String>.unmodifiable(workExperience) : workExperience);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CandIToEMP &&
      id == other.id &&
      _empID == other._empID &&
      _crime == other._crime &&
      _crimeDesc == other._crimeDesc &&
      DeepCollectionEquality().equals(_emgDetails, other._emgDetails) &&
      _noExperience == other._noExperience &&
      _empStatement == other._empStatement &&
      _desc == other._desc &&
      _disease == other._disease &&
      _diseaseDesc == other._diseaseDesc &&
      _liquor == other._liquor &&
      _liquorDesc == other._liquorDesc &&
      _perIS == other._perIS &&
      _perID == other._perID &&
      DeepCollectionEquality().equals(_referees, other._referees) &&
      DeepCollectionEquality().equals(_relatives, other._relatives) &&
      _salaryExpectation == other._salaryExpectation &&
      _supportInfo == other._supportInfo &&
      DeepCollectionEquality().equals(_workExperience, other._workExperience);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CandIToEMP {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("crime=" + "$_crime" + ", ");
    buffer.write("crimeDesc=" + "$_crimeDesc" + ", ");
    buffer.write("emgDetails=" + (_emgDetails != null ? _emgDetails!.toString() : "null") + ", ");
    buffer.write("noExperience=" + "$_noExperience" + ", ");
    buffer.write("empStatement=" + "$_empStatement" + ", ");
    buffer.write("desc=" + "$_desc" + ", ");
    buffer.write("disease=" + "$_disease" + ", ");
    buffer.write("diseaseDesc=" + "$_diseaseDesc" + ", ");
    buffer.write("liquor=" + "$_liquor" + ", ");
    buffer.write("liquorDesc=" + "$_liquorDesc" + ", ");
    buffer.write("perIS=" + "$_perIS" + ", ");
    buffer.write("perID=" + "$_perID" + ", ");
    buffer.write("referees=" + (_referees != null ? _referees!.toString() : "null") + ", ");
    buffer.write("relatives=" + (_relatives != null ? _relatives!.toString() : "null") + ", ");
    buffer.write("salaryExpectation=" + "$_salaryExpectation" + ", ");
    buffer.write("supportInfo=" + "$_supportInfo" + ", ");
    buffer.write("workExperience=" + (_workExperience != null ? _workExperience!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CandIToEMP copyWith({String? empID, String? crime, String? crimeDesc, List<String>? emgDetails, String? noExperience, String? empStatement, String? desc, String? disease, String? diseaseDesc, String? liquor, String? liquorDesc, String? perIS, String? perID, List<String>? referees, List<String>? relatives, String? salaryExpectation, String? supportInfo, List<String>? workExperience}) {
    return CandIToEMP._internal(
      id: id,
      empID: empID ?? this.empID,
      crime: crime ?? this.crime,
      crimeDesc: crimeDesc ?? this.crimeDesc,
      emgDetails: emgDetails ?? this.emgDetails,
      noExperience: noExperience ?? this.noExperience,
      empStatement: empStatement ?? this.empStatement,
      desc: desc ?? this.desc,
      disease: disease ?? this.disease,
      diseaseDesc: diseaseDesc ?? this.diseaseDesc,
      liquor: liquor ?? this.liquor,
      liquorDesc: liquorDesc ?? this.liquorDesc,
      perIS: perIS ?? this.perIS,
      perID: perID ?? this.perID,
      referees: referees ?? this.referees,
      relatives: relatives ?? this.relatives,
      salaryExpectation: salaryExpectation ?? this.salaryExpectation,
      supportInfo: supportInfo ?? this.supportInfo,
      workExperience: workExperience ?? this.workExperience);
  }
  
  CandIToEMP copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String?>? crime,
    ModelFieldValue<String?>? crimeDesc,
    ModelFieldValue<List<String>>? emgDetails,
    ModelFieldValue<String>? noExperience,
    ModelFieldValue<String>? empStatement,
    ModelFieldValue<String?>? desc,
    ModelFieldValue<String?>? disease,
    ModelFieldValue<String?>? diseaseDesc,
    ModelFieldValue<String?>? liquor,
    ModelFieldValue<String?>? liquorDesc,
    ModelFieldValue<String>? perIS,
    ModelFieldValue<String?>? perID,
    ModelFieldValue<List<String>?>? referees,
    ModelFieldValue<List<String>?>? relatives,
    ModelFieldValue<String?>? salaryExpectation,
    ModelFieldValue<String?>? supportInfo,
    ModelFieldValue<List<String>?>? workExperience
  }) {
    return CandIToEMP._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      crime: crime == null ? this.crime : crime.value,
      crimeDesc: crimeDesc == null ? this.crimeDesc : crimeDesc.value,
      emgDetails: emgDetails == null ? this.emgDetails : emgDetails.value,
      noExperience: noExperience == null ? this.noExperience : noExperience.value,
      empStatement: empStatement == null ? this.empStatement : empStatement.value,
      desc: desc == null ? this.desc : desc.value,
      disease: disease == null ? this.disease : disease.value,
      diseaseDesc: diseaseDesc == null ? this.diseaseDesc : diseaseDesc.value,
      liquor: liquor == null ? this.liquor : liquor.value,
      liquorDesc: liquorDesc == null ? this.liquorDesc : liquorDesc.value,
      perIS: perIS == null ? this.perIS : perIS.value,
      perID: perID == null ? this.perID : perID.value,
      referees: referees == null ? this.referees : referees.value,
      relatives: relatives == null ? this.relatives : relatives.value,
      salaryExpectation: salaryExpectation == null ? this.salaryExpectation : salaryExpectation.value,
      supportInfo: supportInfo == null ? this.supportInfo : supportInfo.value,
      workExperience: workExperience == null ? this.workExperience : workExperience.value
    );
  }
  
  CandIToEMP.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _crime = json['crime'],
      _crimeDesc = json['crimeDesc'],
      _emgDetails = json['emgDetails']?.cast<String>(),
      _noExperience = json['noExperience'],
      _empStatement = json['empStatement'],
      _desc = json['desc'],
      _disease = json['disease'],
      _diseaseDesc = json['diseaseDesc'],
      _liquor = json['liquor'],
      _liquorDesc = json['liquorDesc'],
      _perIS = json['perIS'],
      _perID = json['perID'],
      _referees = json['referees']?.cast<String>(),
      _relatives = json['relatives']?.cast<String>(),
      _salaryExpectation = json['salaryExpectation'],
      _supportInfo = json['supportInfo'],
      _workExperience = json['workExperience']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'crime': _crime, 'crimeDesc': _crimeDesc, 'emgDetails': _emgDetails, 'noExperience': _noExperience, 'empStatement': _empStatement, 'desc': _desc, 'disease': _disease, 'diseaseDesc': _diseaseDesc, 'liquor': _liquor, 'liquorDesc': _liquorDesc, 'perIS': _perIS, 'perID': _perID, 'referees': _referees, 'relatives': _relatives, 'salaryExpectation': _salaryExpectation, 'supportInfo': _supportInfo, 'workExperience': _workExperience, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'crime': _crime,
    'crimeDesc': _crimeDesc,
    'emgDetails': _emgDetails,
    'noExperience': _noExperience,
    'empStatement': _empStatement,
    'desc': _desc,
    'disease': _disease,
    'diseaseDesc': _diseaseDesc,
    'liquor': _liquor,
    'liquorDesc': _liquorDesc,
    'perIS': _perIS,
    'perID': _perID,
    'referees': _referees,
    'relatives': _relatives,
    'salaryExpectation': _salaryExpectation,
    'supportInfo': _supportInfo,
    'workExperience': _workExperience,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CandIToEMPModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CandIToEMPModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final CRIME = amplify_core.QueryField(fieldName: "crime");
  static final CRIMEDESC = amplify_core.QueryField(fieldName: "crimeDesc");
  static final EMGDETAILS = amplify_core.QueryField(fieldName: "emgDetails");
  static final NOEXPERIENCE = amplify_core.QueryField(fieldName: "noExperience");
  static final EMPSTATEMENT = amplify_core.QueryField(fieldName: "empStatement");
  static final DESC = amplify_core.QueryField(fieldName: "desc");
  static final DISEASE = amplify_core.QueryField(fieldName: "disease");
  static final DISEASEDESC = amplify_core.QueryField(fieldName: "diseaseDesc");
  static final LIQUOR = amplify_core.QueryField(fieldName: "liquor");
  static final LIQUORDESC = amplify_core.QueryField(fieldName: "liquorDesc");
  static final PERIS = amplify_core.QueryField(fieldName: "perIS");
  static final PERID = amplify_core.QueryField(fieldName: "perID");
  static final REFEREES = amplify_core.QueryField(fieldName: "referees");
  static final RELATIVES = amplify_core.QueryField(fieldName: "relatives");
  static final SALARYEXPECTATION = amplify_core.QueryField(fieldName: "salaryExpectation");
  static final SUPPORTINFO = amplify_core.QueryField(fieldName: "supportInfo");
  static final WORKEXPERIENCE = amplify_core.QueryField(fieldName: "workExperience");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CandIToEMP";
    modelSchemaDefinition.pluralName = "CandIToEMPS";
    
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
      key: CandIToEMP.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.CRIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.CRIMEDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.EMGDETAILS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.NOEXPERIENCE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.EMPSTATEMENT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.DESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.DISEASE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.DISEASEDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.LIQUOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.LIQUORDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.PERIS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.PERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.REFEREES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.RELATIVES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.SALARYEXPECTATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.SUPPORTINFO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CandIToEMP.WORKEXPERIENCE,
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

class _CandIToEMPModelType extends amplify_core.ModelType<CandIToEMP> {
  const _CandIToEMPModelType();
  
  @override
  CandIToEMP fromJson(Map<String, dynamic> jsonData) {
    return CandIToEMP.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CandIToEMP';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CandIToEMP] in your schema.
 */
class CandIToEMPModelIdentifier implements amplify_core.ModelIdentifier<CandIToEMP> {
  final String id;

  /** Create an instance of CandIToEMPModelIdentifier using [id] the primary key. */
  const CandIToEMPModelIdentifier({
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
  String toString() => 'CandIToEMPModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CandIToEMPModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}