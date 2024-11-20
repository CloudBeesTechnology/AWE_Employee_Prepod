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


/** This is an auto generated class representing the EmpPersonalInfo type in your schema. */
class EmpPersonalInfo extends amplify_core.Model {
  static const classType = const _EmpPersonalInfoModelType();
  final String id;
  final String? _empID;
  final int? _age;
  final String? _aTQualify;
  final String? _alternateNo;
  final List<String>? _agent;
  final List<String>? _contactNo;
  final String? _cob;
  final List<String>? _contractType;
  final String? _ctryOfOrigin;
  final String? _chinese;
  final String? _dob;
  final String? _educLevel;
  final String? _email;
  final List<String>? _eduDetails;
  final String? _empBadgeNo;
  final List<String>? _empType;
  final List<String>? _familyDetails;
  final String? _gender;
  final String? _lang;
  final String? _marital;
  final String? _name;
  final String? _officialEmail;
  final String? _oCOfOrigin;
  final String? _profilePhoto;
  final List<String>? _permanentAddress;
  final List<String>? _position;
  final String? _sapNo;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmpPersonalInfoModelIdentifier get modelIdentifier {
      return EmpPersonalInfoModelIdentifier(
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
  
  int? get age {
    return _age;
  }
  
  String? get aTQualify {
    return _aTQualify;
  }
  
  String? get alternateNo {
    return _alternateNo;
  }
  
  List<String>? get agent {
    return _agent;
  }
  
  List<String>? get contactNo {
    return _contactNo;
  }
  
  String? get cob {
    return _cob;
  }
  
  List<String>? get contractType {
    return _contractType;
  }
  
  String? get ctryOfOrigin {
    return _ctryOfOrigin;
  }
  
  String? get chinese {
    return _chinese;
  }
  
  String get dob {
    try {
      return _dob!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get educLevel {
    return _educLevel;
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get eduDetails {
    return _eduDetails;
  }
  
  String? get empBadgeNo {
    return _empBadgeNo;
  }
  
  List<String>? get empType {
    return _empType;
  }
  
  List<String>? get familyDetails {
    return _familyDetails;
  }
  
  String get gender {
    try {
      return _gender!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get lang {
    return _lang;
  }
  
  String get marital {
    try {
      return _marital!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get officialEmail {
    return _officialEmail;
  }
  
  String? get oCOfOrigin {
    return _oCOfOrigin;
  }
  
  String? get profilePhoto {
    return _profilePhoto;
  }
  
  List<String>? get permanentAddress {
    return _permanentAddress;
  }
  
  List<String>? get position {
    return _position;
  }
  
  String? get sapNo {
    return _sapNo;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EmpPersonalInfo._internal({required this.id, required empID, age, aTQualify, alternateNo, agent, contactNo, cob, contractType, ctryOfOrigin, chinese, required dob, educLevel, required email, eduDetails, empBadgeNo, empType, familyDetails, required gender, lang, required marital, required name, officialEmail, oCOfOrigin, profilePhoto, permanentAddress, position, sapNo, createdAt, updatedAt}): _empID = empID, _age = age, _aTQualify = aTQualify, _alternateNo = alternateNo, _agent = agent, _contactNo = contactNo, _cob = cob, _contractType = contractType, _ctryOfOrigin = ctryOfOrigin, _chinese = chinese, _dob = dob, _educLevel = educLevel, _email = email, _eduDetails = eduDetails, _empBadgeNo = empBadgeNo, _empType = empType, _familyDetails = familyDetails, _gender = gender, _lang = lang, _marital = marital, _name = name, _officialEmail = officialEmail, _oCOfOrigin = oCOfOrigin, _profilePhoto = profilePhoto, _permanentAddress = permanentAddress, _position = position, _sapNo = sapNo, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmpPersonalInfo({String? id, required String empID, int? age, String? aTQualify, String? alternateNo, List<String>? agent, List<String>? contactNo, String? cob, List<String>? contractType, String? ctryOfOrigin, String? chinese, required String dob, String? educLevel, required String email, List<String>? eduDetails, String? empBadgeNo, List<String>? empType, List<String>? familyDetails, required String gender, String? lang, required String marital, required String name, String? officialEmail, String? oCOfOrigin, String? profilePhoto, List<String>? permanentAddress, List<String>? position, String? sapNo}) {
    return EmpPersonalInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      age: age,
      aTQualify: aTQualify,
      alternateNo: alternateNo,
      agent: agent != null ? List<String>.unmodifiable(agent) : agent,
      contactNo: contactNo != null ? List<String>.unmodifiable(contactNo) : contactNo,
      cob: cob,
      contractType: contractType != null ? List<String>.unmodifiable(contractType) : contractType,
      ctryOfOrigin: ctryOfOrigin,
      chinese: chinese,
      dob: dob,
      educLevel: educLevel,
      email: email,
      eduDetails: eduDetails != null ? List<String>.unmodifiable(eduDetails) : eduDetails,
      empBadgeNo: empBadgeNo,
      empType: empType != null ? List<String>.unmodifiable(empType) : empType,
      familyDetails: familyDetails != null ? List<String>.unmodifiable(familyDetails) : familyDetails,
      gender: gender,
      lang: lang,
      marital: marital,
      name: name,
      officialEmail: officialEmail,
      oCOfOrigin: oCOfOrigin,
      profilePhoto: profilePhoto,
      permanentAddress: permanentAddress != null ? List<String>.unmodifiable(permanentAddress) : permanentAddress,
      position: position != null ? List<String>.unmodifiable(position) : position,
      sapNo: sapNo);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmpPersonalInfo &&
      id == other.id &&
      _empID == other._empID &&
      _age == other._age &&
      _aTQualify == other._aTQualify &&
      _alternateNo == other._alternateNo &&
      DeepCollectionEquality().equals(_agent, other._agent) &&
      DeepCollectionEquality().equals(_contactNo, other._contactNo) &&
      _cob == other._cob &&
      DeepCollectionEquality().equals(_contractType, other._contractType) &&
      _ctryOfOrigin == other._ctryOfOrigin &&
      _chinese == other._chinese &&
      _dob == other._dob &&
      _educLevel == other._educLevel &&
      _email == other._email &&
      DeepCollectionEquality().equals(_eduDetails, other._eduDetails) &&
      _empBadgeNo == other._empBadgeNo &&
      DeepCollectionEquality().equals(_empType, other._empType) &&
      DeepCollectionEquality().equals(_familyDetails, other._familyDetails) &&
      _gender == other._gender &&
      _lang == other._lang &&
      _marital == other._marital &&
      _name == other._name &&
      _officialEmail == other._officialEmail &&
      _oCOfOrigin == other._oCOfOrigin &&
      _profilePhoto == other._profilePhoto &&
      DeepCollectionEquality().equals(_permanentAddress, other._permanentAddress) &&
      DeepCollectionEquality().equals(_position, other._position) &&
      _sapNo == other._sapNo;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmpPersonalInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("age=" + (_age != null ? _age!.toString() : "null") + ", ");
    buffer.write("aTQualify=" + "$_aTQualify" + ", ");
    buffer.write("alternateNo=" + "$_alternateNo" + ", ");
    buffer.write("agent=" + (_agent != null ? _agent!.toString() : "null") + ", ");
    buffer.write("contactNo=" + (_contactNo != null ? _contactNo!.toString() : "null") + ", ");
    buffer.write("cob=" + "$_cob" + ", ");
    buffer.write("contractType=" + (_contractType != null ? _contractType!.toString() : "null") + ", ");
    buffer.write("ctryOfOrigin=" + "$_ctryOfOrigin" + ", ");
    buffer.write("chinese=" + "$_chinese" + ", ");
    buffer.write("dob=" + "$_dob" + ", ");
    buffer.write("educLevel=" + "$_educLevel" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("eduDetails=" + (_eduDetails != null ? _eduDetails!.toString() : "null") + ", ");
    buffer.write("empBadgeNo=" + "$_empBadgeNo" + ", ");
    buffer.write("empType=" + (_empType != null ? _empType!.toString() : "null") + ", ");
    buffer.write("familyDetails=" + (_familyDetails != null ? _familyDetails!.toString() : "null") + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("lang=" + "$_lang" + ", ");
    buffer.write("marital=" + "$_marital" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("officialEmail=" + "$_officialEmail" + ", ");
    buffer.write("oCOfOrigin=" + "$_oCOfOrigin" + ", ");
    buffer.write("profilePhoto=" + "$_profilePhoto" + ", ");
    buffer.write("permanentAddress=" + (_permanentAddress != null ? _permanentAddress!.toString() : "null") + ", ");
    buffer.write("position=" + (_position != null ? _position!.toString() : "null") + ", ");
    buffer.write("sapNo=" + "$_sapNo" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmpPersonalInfo copyWith({String? empID, int? age, String? aTQualify, String? alternateNo, List<String>? agent, List<String>? contactNo, String? cob, List<String>? contractType, String? ctryOfOrigin, String? chinese, String? dob, String? educLevel, String? email, List<String>? eduDetails, String? empBadgeNo, List<String>? empType, List<String>? familyDetails, String? gender, String? lang, String? marital, String? name, String? officialEmail, String? oCOfOrigin, String? profilePhoto, List<String>? permanentAddress, List<String>? position, String? sapNo}) {
    return EmpPersonalInfo._internal(
      id: id,
      empID: empID ?? this.empID,
      age: age ?? this.age,
      aTQualify: aTQualify ?? this.aTQualify,
      alternateNo: alternateNo ?? this.alternateNo,
      agent: agent ?? this.agent,
      contactNo: contactNo ?? this.contactNo,
      cob: cob ?? this.cob,
      contractType: contractType ?? this.contractType,
      ctryOfOrigin: ctryOfOrigin ?? this.ctryOfOrigin,
      chinese: chinese ?? this.chinese,
      dob: dob ?? this.dob,
      educLevel: educLevel ?? this.educLevel,
      email: email ?? this.email,
      eduDetails: eduDetails ?? this.eduDetails,
      empBadgeNo: empBadgeNo ?? this.empBadgeNo,
      empType: empType ?? this.empType,
      familyDetails: familyDetails ?? this.familyDetails,
      gender: gender ?? this.gender,
      lang: lang ?? this.lang,
      marital: marital ?? this.marital,
      name: name ?? this.name,
      officialEmail: officialEmail ?? this.officialEmail,
      oCOfOrigin: oCOfOrigin ?? this.oCOfOrigin,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      position: position ?? this.position,
      sapNo: sapNo ?? this.sapNo);
  }
  
  EmpPersonalInfo copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<int?>? age,
    ModelFieldValue<String?>? aTQualify,
    ModelFieldValue<String?>? alternateNo,
    ModelFieldValue<List<String>?>? agent,
    ModelFieldValue<List<String>>? contactNo,
    ModelFieldValue<String?>? cob,
    ModelFieldValue<List<String>?>? contractType,
    ModelFieldValue<String?>? ctryOfOrigin,
    ModelFieldValue<String?>? chinese,
    ModelFieldValue<String>? dob,
    ModelFieldValue<String?>? educLevel,
    ModelFieldValue<String>? email,
    ModelFieldValue<List<String>?>? eduDetails,
    ModelFieldValue<String?>? empBadgeNo,
    ModelFieldValue<List<String>?>? empType,
    ModelFieldValue<List<String>?>? familyDetails,
    ModelFieldValue<String>? gender,
    ModelFieldValue<String?>? lang,
    ModelFieldValue<String>? marital,
    ModelFieldValue<String>? name,
    ModelFieldValue<String?>? officialEmail,
    ModelFieldValue<String?>? oCOfOrigin,
    ModelFieldValue<String?>? profilePhoto,
    ModelFieldValue<List<String>>? permanentAddress,
    ModelFieldValue<List<String>?>? position,
    ModelFieldValue<String?>? sapNo
  }) {
    return EmpPersonalInfo._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      age: age == null ? this.age : age.value,
      aTQualify: aTQualify == null ? this.aTQualify : aTQualify.value,
      alternateNo: alternateNo == null ? this.alternateNo : alternateNo.value,
      agent: agent == null ? this.agent : agent.value,
      contactNo: contactNo == null ? this.contactNo : contactNo.value,
      cob: cob == null ? this.cob : cob.value,
      contractType: contractType == null ? this.contractType : contractType.value,
      ctryOfOrigin: ctryOfOrigin == null ? this.ctryOfOrigin : ctryOfOrigin.value,
      chinese: chinese == null ? this.chinese : chinese.value,
      dob: dob == null ? this.dob : dob.value,
      educLevel: educLevel == null ? this.educLevel : educLevel.value,
      email: email == null ? this.email : email.value,
      eduDetails: eduDetails == null ? this.eduDetails : eduDetails.value,
      empBadgeNo: empBadgeNo == null ? this.empBadgeNo : empBadgeNo.value,
      empType: empType == null ? this.empType : empType.value,
      familyDetails: familyDetails == null ? this.familyDetails : familyDetails.value,
      gender: gender == null ? this.gender : gender.value,
      lang: lang == null ? this.lang : lang.value,
      marital: marital == null ? this.marital : marital.value,
      name: name == null ? this.name : name.value,
      officialEmail: officialEmail == null ? this.officialEmail : officialEmail.value,
      oCOfOrigin: oCOfOrigin == null ? this.oCOfOrigin : oCOfOrigin.value,
      profilePhoto: profilePhoto == null ? this.profilePhoto : profilePhoto.value,
      permanentAddress: permanentAddress == null ? this.permanentAddress : permanentAddress.value,
      position: position == null ? this.position : position.value,
      sapNo: sapNo == null ? this.sapNo : sapNo.value
    );
  }
  
  EmpPersonalInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _age = (json['age'] as num?)?.toInt(),
      _aTQualify = json['aTQualify'],
      _alternateNo = json['alternateNo'],
      _agent = json['agent']?.cast<String>(),
      _contactNo = json['contactNo']?.cast<String>(),
      _cob = json['cob'],
      _contractType = json['contractType']?.cast<String>(),
      _ctryOfOrigin = json['ctryOfOrigin'],
      _chinese = json['chinese'],
      _dob = json['dob'],
      _educLevel = json['educLevel'],
      _email = json['email'],
      _eduDetails = json['eduDetails']?.cast<String>(),
      _empBadgeNo = json['empBadgeNo'],
      _empType = json['empType']?.cast<String>(),
      _familyDetails = json['familyDetails']?.cast<String>(),
      _gender = json['gender'],
      _lang = json['lang'],
      _marital = json['marital'],
      _name = json['name'],
      _officialEmail = json['officialEmail'],
      _oCOfOrigin = json['oCOfOrigin'],
      _profilePhoto = json['profilePhoto'],
      _permanentAddress = json['permanentAddress']?.cast<String>(),
      _position = json['position']?.cast<String>(),
      _sapNo = json['sapNo'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'age': _age, 'aTQualify': _aTQualify, 'alternateNo': _alternateNo, 'agent': _agent, 'contactNo': _contactNo, 'cob': _cob, 'contractType': _contractType, 'ctryOfOrigin': _ctryOfOrigin, 'chinese': _chinese, 'dob': _dob, 'educLevel': _educLevel, 'email': _email, 'eduDetails': _eduDetails, 'empBadgeNo': _empBadgeNo, 'empType': _empType, 'familyDetails': _familyDetails, 'gender': _gender, 'lang': _lang, 'marital': _marital, 'name': _name, 'officialEmail': _officialEmail, 'oCOfOrigin': _oCOfOrigin, 'profilePhoto': _profilePhoto, 'permanentAddress': _permanentAddress, 'position': _position, 'sapNo': _sapNo, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'age': _age,
    'aTQualify': _aTQualify,
    'alternateNo': _alternateNo,
    'agent': _agent,
    'contactNo': _contactNo,
    'cob': _cob,
    'contractType': _contractType,
    'ctryOfOrigin': _ctryOfOrigin,
    'chinese': _chinese,
    'dob': _dob,
    'educLevel': _educLevel,
    'email': _email,
    'eduDetails': _eduDetails,
    'empBadgeNo': _empBadgeNo,
    'empType': _empType,
    'familyDetails': _familyDetails,
    'gender': _gender,
    'lang': _lang,
    'marital': _marital,
    'name': _name,
    'officialEmail': _officialEmail,
    'oCOfOrigin': _oCOfOrigin,
    'profilePhoto': _profilePhoto,
    'permanentAddress': _permanentAddress,
    'position': _position,
    'sapNo': _sapNo,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmpPersonalInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmpPersonalInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final AGE = amplify_core.QueryField(fieldName: "age");
  static final ATQUALIFY = amplify_core.QueryField(fieldName: "aTQualify");
  static final ALTERNATENO = amplify_core.QueryField(fieldName: "alternateNo");
  static final AGENT = amplify_core.QueryField(fieldName: "agent");
  static final CONTACTNO = amplify_core.QueryField(fieldName: "contactNo");
  static final COB = amplify_core.QueryField(fieldName: "cob");
  static final CONTRACTTYPE = amplify_core.QueryField(fieldName: "contractType");
  static final CTRYOFORIGIN = amplify_core.QueryField(fieldName: "ctryOfOrigin");
  static final CHINESE = amplify_core.QueryField(fieldName: "chinese");
  static final DOB = amplify_core.QueryField(fieldName: "dob");
  static final EDUCLEVEL = amplify_core.QueryField(fieldName: "educLevel");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final EDUDETAILS = amplify_core.QueryField(fieldName: "eduDetails");
  static final EMPBADGENO = amplify_core.QueryField(fieldName: "empBadgeNo");
  static final EMPTYPE = amplify_core.QueryField(fieldName: "empType");
  static final FAMILYDETAILS = amplify_core.QueryField(fieldName: "familyDetails");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final LANG = amplify_core.QueryField(fieldName: "lang");
  static final MARITAL = amplify_core.QueryField(fieldName: "marital");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final OFFICIALEMAIL = amplify_core.QueryField(fieldName: "officialEmail");
  static final OCOFORIGIN = amplify_core.QueryField(fieldName: "oCOfOrigin");
  static final PROFILEPHOTO = amplify_core.QueryField(fieldName: "profilePhoto");
  static final PERMANENTADDRESS = amplify_core.QueryField(fieldName: "permanentAddress");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final SAPNO = amplify_core.QueryField(fieldName: "sapNo");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmpPersonalInfo";
    modelSchemaDefinition.pluralName = "EmpPersonalInfos";
    
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
      key: EmpPersonalInfo.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.AGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.ATQUALIFY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.ALTERNATENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.AGENT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.CONTACTNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.COB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.CONTRACTTYPE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.CTRYOFORIGIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.CHINESE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.DOB,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.EDUCLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.EDUDETAILS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.EMPBADGENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.EMPTYPE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.FAMILYDETAILS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.GENDER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.LANG,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.MARITAL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.OFFICIALEMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.OCOFORIGIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.PROFILEPHOTO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.PERMANENTADDRESS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.POSITION,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpPersonalInfo.SAPNO,
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

class _EmpPersonalInfoModelType extends amplify_core.ModelType<EmpPersonalInfo> {
  const _EmpPersonalInfoModelType();
  
  @override
  EmpPersonalInfo fromJson(Map<String, dynamic> jsonData) {
    return EmpPersonalInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmpPersonalInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmpPersonalInfo] in your schema.
 */
class EmpPersonalInfoModelIdentifier implements amplify_core.ModelIdentifier<EmpPersonalInfo> {
  final String id;

  /** Create an instance of EmpPersonalInfoModelIdentifier using [id] the primary key. */
  const EmpPersonalInfoModelIdentifier({
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
  String toString() => 'EmpPersonalInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmpPersonalInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}