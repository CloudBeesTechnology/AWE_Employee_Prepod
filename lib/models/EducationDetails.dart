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


/** This is an auto generated class representing the EducationDetails type in your schema. */
class EducationDetails extends amplify_core.Model {
  static const classType = const _EducationDetailsModelType();
  final String id;
  final String? _tempID;
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
  final String? _noticePeriod;
  final String? _perIS;
  final String? _perIDesc;
  final List<String>? _referees;
  final List<String>? _relatives;
  final String? _salaryExpectation;
  final String? _supportInfo;
  final String? _uploadResume;
  final String? _uploadCertificate;
  final String? _uploadPp;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EducationDetailsModelIdentifier get modelIdentifier {
      return EducationDetailsModelIdentifier(
        id: id
      );
  }
  
  String get tempID {
    try {
      return _tempID!;
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
  
  String get noticePeriod {
    try {
      return _noticePeriod!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String? get perIDesc {
    return _perIDesc;
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
  
  String get uploadResume {
    try {
      return _uploadResume!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get uploadCertificate {
    try {
      return _uploadCertificate!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get uploadPp {
    try {
      return _uploadPp!;
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
  
  const EducationDetails._internal({required this.id, required tempID, crime, crimeDesc, emgDetails, required noExperience, required empStatement, desc, disease, diseaseDesc, liquor, liquorDesc, required noticePeriod, required perIS, perIDesc, referees, relatives, salaryExpectation, supportInfo, required uploadResume, required uploadCertificate, required uploadPp, createdAt, updatedAt}): _tempID = tempID, _crime = crime, _crimeDesc = crimeDesc, _emgDetails = emgDetails, _noExperience = noExperience, _empStatement = empStatement, _desc = desc, _disease = disease, _diseaseDesc = diseaseDesc, _liquor = liquor, _liquorDesc = liquorDesc, _noticePeriod = noticePeriod, _perIS = perIS, _perIDesc = perIDesc, _referees = referees, _relatives = relatives, _salaryExpectation = salaryExpectation, _supportInfo = supportInfo, _uploadResume = uploadResume, _uploadCertificate = uploadCertificate, _uploadPp = uploadPp, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EducationDetails({String? id, required String tempID, String? crime, String? crimeDesc, List<String>? emgDetails, required String noExperience, required String empStatement, String? desc, String? disease, String? diseaseDesc, String? liquor, String? liquorDesc, required String noticePeriod, required String perIS, String? perIDesc, List<String>? referees, List<String>? relatives, String? salaryExpectation, String? supportInfo, required String uploadResume, required String uploadCertificate, required String uploadPp}) {
    return EducationDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      tempID: tempID,
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
      noticePeriod: noticePeriod,
      perIS: perIS,
      perIDesc: perIDesc,
      referees: referees != null ? List<String>.unmodifiable(referees) : referees,
      relatives: relatives != null ? List<String>.unmodifiable(relatives) : relatives,
      salaryExpectation: salaryExpectation,
      supportInfo: supportInfo,
      uploadResume: uploadResume,
      uploadCertificate: uploadCertificate,
      uploadPp: uploadPp);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EducationDetails &&
      id == other.id &&
      _tempID == other._tempID &&
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
      _noticePeriod == other._noticePeriod &&
      _perIS == other._perIS &&
      _perIDesc == other._perIDesc &&
      DeepCollectionEquality().equals(_referees, other._referees) &&
      DeepCollectionEquality().equals(_relatives, other._relatives) &&
      _salaryExpectation == other._salaryExpectation &&
      _supportInfo == other._supportInfo &&
      _uploadResume == other._uploadResume &&
      _uploadCertificate == other._uploadCertificate &&
      _uploadPp == other._uploadPp;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EducationDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tempID=" + "$_tempID" + ", ");
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
    buffer.write("noticePeriod=" + "$_noticePeriod" + ", ");
    buffer.write("perIS=" + "$_perIS" + ", ");
    buffer.write("perIDesc=" + "$_perIDesc" + ", ");
    buffer.write("referees=" + (_referees != null ? _referees!.toString() : "null") + ", ");
    buffer.write("relatives=" + (_relatives != null ? _relatives!.toString() : "null") + ", ");
    buffer.write("salaryExpectation=" + "$_salaryExpectation" + ", ");
    buffer.write("supportInfo=" + "$_supportInfo" + ", ");
    buffer.write("uploadResume=" + "$_uploadResume" + ", ");
    buffer.write("uploadCertificate=" + "$_uploadCertificate" + ", ");
    buffer.write("uploadPp=" + "$_uploadPp" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EducationDetails copyWith({String? tempID, String? crime, String? crimeDesc, List<String>? emgDetails, String? noExperience, String? empStatement, String? desc, String? disease, String? diseaseDesc, String? liquor, String? liquorDesc, String? noticePeriod, String? perIS, String? perIDesc, List<String>? referees, List<String>? relatives, String? salaryExpectation, String? supportInfo, String? uploadResume, String? uploadCertificate, String? uploadPp}) {
    return EducationDetails._internal(
      id: id,
      tempID: tempID ?? this.tempID,
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
      noticePeriod: noticePeriod ?? this.noticePeriod,
      perIS: perIS ?? this.perIS,
      perIDesc: perIDesc ?? this.perIDesc,
      referees: referees ?? this.referees,
      relatives: relatives ?? this.relatives,
      salaryExpectation: salaryExpectation ?? this.salaryExpectation,
      supportInfo: supportInfo ?? this.supportInfo,
      uploadResume: uploadResume ?? this.uploadResume,
      uploadCertificate: uploadCertificate ?? this.uploadCertificate,
      uploadPp: uploadPp ?? this.uploadPp);
  }
  
  EducationDetails copyWithModelFieldValues({
    ModelFieldValue<String>? tempID,
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
    ModelFieldValue<String>? noticePeriod,
    ModelFieldValue<String>? perIS,
    ModelFieldValue<String?>? perIDesc,
    ModelFieldValue<List<String>?>? referees,
    ModelFieldValue<List<String>?>? relatives,
    ModelFieldValue<String?>? salaryExpectation,
    ModelFieldValue<String?>? supportInfo,
    ModelFieldValue<String>? uploadResume,
    ModelFieldValue<String>? uploadCertificate,
    ModelFieldValue<String>? uploadPp
  }) {
    return EducationDetails._internal(
      id: id,
      tempID: tempID == null ? this.tempID : tempID.value,
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
      noticePeriod: noticePeriod == null ? this.noticePeriod : noticePeriod.value,
      perIS: perIS == null ? this.perIS : perIS.value,
      perIDesc: perIDesc == null ? this.perIDesc : perIDesc.value,
      referees: referees == null ? this.referees : referees.value,
      relatives: relatives == null ? this.relatives : relatives.value,
      salaryExpectation: salaryExpectation == null ? this.salaryExpectation : salaryExpectation.value,
      supportInfo: supportInfo == null ? this.supportInfo : supportInfo.value,
      uploadResume: uploadResume == null ? this.uploadResume : uploadResume.value,
      uploadCertificate: uploadCertificate == null ? this.uploadCertificate : uploadCertificate.value,
      uploadPp: uploadPp == null ? this.uploadPp : uploadPp.value
    );
  }
  
  EducationDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tempID = json['tempID'],
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
      _noticePeriod = json['noticePeriod'],
      _perIS = json['perIS'],
      _perIDesc = json['perIDesc'],
      _referees = json['referees']?.cast<String>(),
      _relatives = json['relatives']?.cast<String>(),
      _salaryExpectation = json['salaryExpectation'],
      _supportInfo = json['supportInfo'],
      _uploadResume = json['uploadResume'],
      _uploadCertificate = json['uploadCertificate'],
      _uploadPp = json['uploadPp'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tempID': _tempID, 'crime': _crime, 'crimeDesc': _crimeDesc, 'emgDetails': _emgDetails, 'noExperience': _noExperience, 'empStatement': _empStatement, 'desc': _desc, 'disease': _disease, 'diseaseDesc': _diseaseDesc, 'liquor': _liquor, 'liquorDesc': _liquorDesc, 'noticePeriod': _noticePeriod, 'perIS': _perIS, 'perIDesc': _perIDesc, 'referees': _referees, 'relatives': _relatives, 'salaryExpectation': _salaryExpectation, 'supportInfo': _supportInfo, 'uploadResume': _uploadResume, 'uploadCertificate': _uploadCertificate, 'uploadPp': _uploadPp, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'tempID': _tempID,
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
    'noticePeriod': _noticePeriod,
    'perIS': _perIS,
    'perIDesc': _perIDesc,
    'referees': _referees,
    'relatives': _relatives,
    'salaryExpectation': _salaryExpectation,
    'supportInfo': _supportInfo,
    'uploadResume': _uploadResume,
    'uploadCertificate': _uploadCertificate,
    'uploadPp': _uploadPp,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EducationDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EducationDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TEMPID = amplify_core.QueryField(fieldName: "tempID");
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
  static final NOTICEPERIOD = amplify_core.QueryField(fieldName: "noticePeriod");
  static final PERIS = amplify_core.QueryField(fieldName: "perIS");
  static final PERIDESC = amplify_core.QueryField(fieldName: "perIDesc");
  static final REFEREES = amplify_core.QueryField(fieldName: "referees");
  static final RELATIVES = amplify_core.QueryField(fieldName: "relatives");
  static final SALARYEXPECTATION = amplify_core.QueryField(fieldName: "salaryExpectation");
  static final SUPPORTINFO = amplify_core.QueryField(fieldName: "supportInfo");
  static final UPLOADRESUME = amplify_core.QueryField(fieldName: "uploadResume");
  static final UPLOADCERTIFICATE = amplify_core.QueryField(fieldName: "uploadCertificate");
  static final UPLOADPP = amplify_core.QueryField(fieldName: "uploadPp");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EducationDetails";
    modelSchemaDefinition.pluralName = "EducationDetails";
    
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
      key: EducationDetails.TEMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.CRIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.CRIMEDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.EMGDETAILS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.NOEXPERIENCE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.EMPSTATEMENT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.DESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.DISEASE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.DISEASEDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.LIQUOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.LIQUORDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.NOTICEPERIOD,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.PERIS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.PERIDESC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.REFEREES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.RELATIVES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.SALARYEXPECTATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.SUPPORTINFO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.UPLOADRESUME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.UPLOADCERTIFICATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EducationDetails.UPLOADPP,
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

class _EducationDetailsModelType extends amplify_core.ModelType<EducationDetails> {
  const _EducationDetailsModelType();
  
  @override
  EducationDetails fromJson(Map<String, dynamic> jsonData) {
    return EducationDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EducationDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EducationDetails] in your schema.
 */
class EducationDetailsModelIdentifier implements amplify_core.ModelIdentifier<EducationDetails> {
  final String id;

  /** Create an instance of EducationDetailsModelIdentifier using [id] the primary key. */
  const EducationDetailsModelIdentifier({
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
  String toString() => 'EducationDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EducationDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}