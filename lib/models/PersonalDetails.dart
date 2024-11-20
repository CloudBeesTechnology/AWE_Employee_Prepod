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


/** This is an auto generated class representing the PersonalDetails type in your schema. */
class PersonalDetails extends amplify_core.Model {
  static const classType = const _PersonalDetailsModelType();
  final String id;
  final String? _tempID;
  final int? _age;
  final String? _alternateNo;
  final String? _agent;
  final String? _bwnIcNo;
  final String? _bwnIcExpiry;
  final String? _bwnIcColour;
  final String? _contactNo;
  final String? _cob;
  final String? _contractType;
  final String? _chinese;
  final String? _dob;
  final String? _driveLic;
  final String? _email;
  final String? _empType;
  final List<String>? _eduDetails;
  final List<String>? _familyDetails;
  final String? _gender;
  final String? _lang;
  final String? _marital;
  final String? _name;
  final String? _nationality;
  final String? _otherNation;
  final String? _otherRace;
  final String? _otherReligion;
  final String? _ppNo;
  final String? _ppIssued;
  final String? _ppExpiry;
  final String? _ppDestinate;
  final String? _presentAddress;
  final String? _permanentAddress;
  final String? _profilePhoto;
  final String? _position;
  final String? _race;
  final String? _religion;
  final String? _status;
  final List<String>? _workExperience;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PersonalDetailsModelIdentifier get modelIdentifier {
      return PersonalDetailsModelIdentifier(
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
  
  int get age {
    try {
      return _age!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get alternateNo {
    return _alternateNo;
  }
  
  String? get agent {
    return _agent;
  }
  
  String? get bwnIcNo {
    return _bwnIcNo;
  }
  
  String? get bwnIcExpiry {
    return _bwnIcExpiry;
  }
  
  String? get bwnIcColour {
    return _bwnIcColour;
  }
  
  String get contactNo {
    try {
      return _contactNo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get cob {
    try {
      return _cob!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get contractType {
    try {
      return _contractType!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String? get driveLic {
    return _driveLic;
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
  
  String get empType {
    try {
      return _empType!;
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
  
  String get lang {
    try {
      return _lang!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  String get nationality {
    try {
      return _nationality!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get otherNation {
    return _otherNation;
  }
  
  String? get otherRace {
    return _otherRace;
  }
  
  String? get otherReligion {
    return _otherReligion;
  }
  
  String? get ppNo {
    return _ppNo;
  }
  
  String? get ppIssued {
    return _ppIssued;
  }
  
  String? get ppExpiry {
    return _ppExpiry;
  }
  
  String? get ppDestinate {
    return _ppDestinate;
  }
  
  String get presentAddress {
    try {
      return _presentAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get permanentAddress {
    try {
      return _permanentAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get profilePhoto {
    try {
      return _profilePhoto!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get position {
    try {
      return _position!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get race {
    try {
      return _race!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get religion {
    try {
      return _religion!;
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
  
  List<String>? get workExperience {
    return _workExperience;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PersonalDetails._internal({required this.id, required tempID, required age, alternateNo, agent, bwnIcNo, bwnIcExpiry, bwnIcColour, required contactNo, required cob, required contractType, chinese, required dob, driveLic, required email, required empType, eduDetails, familyDetails, required gender, required lang, required marital, required name, required nationality, otherNation, otherRace, otherReligion, ppNo, ppIssued, ppExpiry, ppDestinate, required presentAddress, required permanentAddress, required profilePhoto, required position, required race, required religion, required status, workExperience, createdAt, updatedAt}): _tempID = tempID, _age = age, _alternateNo = alternateNo, _agent = agent, _bwnIcNo = bwnIcNo, _bwnIcExpiry = bwnIcExpiry, _bwnIcColour = bwnIcColour, _contactNo = contactNo, _cob = cob, _contractType = contractType, _chinese = chinese, _dob = dob, _driveLic = driveLic, _email = email, _empType = empType, _eduDetails = eduDetails, _familyDetails = familyDetails, _gender = gender, _lang = lang, _marital = marital, _name = name, _nationality = nationality, _otherNation = otherNation, _otherRace = otherRace, _otherReligion = otherReligion, _ppNo = ppNo, _ppIssued = ppIssued, _ppExpiry = ppExpiry, _ppDestinate = ppDestinate, _presentAddress = presentAddress, _permanentAddress = permanentAddress, _profilePhoto = profilePhoto, _position = position, _race = race, _religion = religion, _status = status, _workExperience = workExperience, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PersonalDetails({String? id, required String tempID, required int age, String? alternateNo, String? agent, String? bwnIcNo, String? bwnIcExpiry, String? bwnIcColour, required String contactNo, required String cob, required String contractType, String? chinese, required String dob, String? driveLic, required String email, required String empType, List<String>? eduDetails, List<String>? familyDetails, required String gender, required String lang, required String marital, required String name, required String nationality, String? otherNation, String? otherRace, String? otherReligion, String? ppNo, String? ppIssued, String? ppExpiry, String? ppDestinate, required String presentAddress, required String permanentAddress, required String profilePhoto, required String position, required String race, required String religion, required String status, List<String>? workExperience}) {
    return PersonalDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      tempID: tempID,
      age: age,
      alternateNo: alternateNo,
      agent: agent,
      bwnIcNo: bwnIcNo,
      bwnIcExpiry: bwnIcExpiry,
      bwnIcColour: bwnIcColour,
      contactNo: contactNo,
      cob: cob,
      contractType: contractType,
      chinese: chinese,
      dob: dob,
      driveLic: driveLic,
      email: email,
      empType: empType,
      eduDetails: eduDetails != null ? List<String>.unmodifiable(eduDetails) : eduDetails,
      familyDetails: familyDetails != null ? List<String>.unmodifiable(familyDetails) : familyDetails,
      gender: gender,
      lang: lang,
      marital: marital,
      name: name,
      nationality: nationality,
      otherNation: otherNation,
      otherRace: otherRace,
      otherReligion: otherReligion,
      ppNo: ppNo,
      ppIssued: ppIssued,
      ppExpiry: ppExpiry,
      ppDestinate: ppDestinate,
      presentAddress: presentAddress,
      permanentAddress: permanentAddress,
      profilePhoto: profilePhoto,
      position: position,
      race: race,
      religion: religion,
      status: status,
      workExperience: workExperience != null ? List<String>.unmodifiable(workExperience) : workExperience);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonalDetails &&
      id == other.id &&
      _tempID == other._tempID &&
      _age == other._age &&
      _alternateNo == other._alternateNo &&
      _agent == other._agent &&
      _bwnIcNo == other._bwnIcNo &&
      _bwnIcExpiry == other._bwnIcExpiry &&
      _bwnIcColour == other._bwnIcColour &&
      _contactNo == other._contactNo &&
      _cob == other._cob &&
      _contractType == other._contractType &&
      _chinese == other._chinese &&
      _dob == other._dob &&
      _driveLic == other._driveLic &&
      _email == other._email &&
      _empType == other._empType &&
      DeepCollectionEquality().equals(_eduDetails, other._eduDetails) &&
      DeepCollectionEquality().equals(_familyDetails, other._familyDetails) &&
      _gender == other._gender &&
      _lang == other._lang &&
      _marital == other._marital &&
      _name == other._name &&
      _nationality == other._nationality &&
      _otherNation == other._otherNation &&
      _otherRace == other._otherRace &&
      _otherReligion == other._otherReligion &&
      _ppNo == other._ppNo &&
      _ppIssued == other._ppIssued &&
      _ppExpiry == other._ppExpiry &&
      _ppDestinate == other._ppDestinate &&
      _presentAddress == other._presentAddress &&
      _permanentAddress == other._permanentAddress &&
      _profilePhoto == other._profilePhoto &&
      _position == other._position &&
      _race == other._race &&
      _religion == other._religion &&
      _status == other._status &&
      DeepCollectionEquality().equals(_workExperience, other._workExperience);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PersonalDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tempID=" + "$_tempID" + ", ");
    buffer.write("age=" + (_age != null ? _age!.toString() : "null") + ", ");
    buffer.write("alternateNo=" + "$_alternateNo" + ", ");
    buffer.write("agent=" + "$_agent" + ", ");
    buffer.write("bwnIcNo=" + "$_bwnIcNo" + ", ");
    buffer.write("bwnIcExpiry=" + "$_bwnIcExpiry" + ", ");
    buffer.write("bwnIcColour=" + "$_bwnIcColour" + ", ");
    buffer.write("contactNo=" + "$_contactNo" + ", ");
    buffer.write("cob=" + "$_cob" + ", ");
    buffer.write("contractType=" + "$_contractType" + ", ");
    buffer.write("chinese=" + "$_chinese" + ", ");
    buffer.write("dob=" + "$_dob" + ", ");
    buffer.write("driveLic=" + "$_driveLic" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("empType=" + "$_empType" + ", ");
    buffer.write("eduDetails=" + (_eduDetails != null ? _eduDetails!.toString() : "null") + ", ");
    buffer.write("familyDetails=" + (_familyDetails != null ? _familyDetails!.toString() : "null") + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("lang=" + "$_lang" + ", ");
    buffer.write("marital=" + "$_marital" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("nationality=" + "$_nationality" + ", ");
    buffer.write("otherNation=" + "$_otherNation" + ", ");
    buffer.write("otherRace=" + "$_otherRace" + ", ");
    buffer.write("otherReligion=" + "$_otherReligion" + ", ");
    buffer.write("ppNo=" + "$_ppNo" + ", ");
    buffer.write("ppIssued=" + "$_ppIssued" + ", ");
    buffer.write("ppExpiry=" + "$_ppExpiry" + ", ");
    buffer.write("ppDestinate=" + "$_ppDestinate" + ", ");
    buffer.write("presentAddress=" + "$_presentAddress" + ", ");
    buffer.write("permanentAddress=" + "$_permanentAddress" + ", ");
    buffer.write("profilePhoto=" + "$_profilePhoto" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("race=" + "$_race" + ", ");
    buffer.write("religion=" + "$_religion" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("workExperience=" + (_workExperience != null ? _workExperience!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PersonalDetails copyWith({String? tempID, int? age, String? alternateNo, String? agent, String? bwnIcNo, String? bwnIcExpiry, String? bwnIcColour, String? contactNo, String? cob, String? contractType, String? chinese, String? dob, String? driveLic, String? email, String? empType, List<String>? eduDetails, List<String>? familyDetails, String? gender, String? lang, String? marital, String? name, String? nationality, String? otherNation, String? otherRace, String? otherReligion, String? ppNo, String? ppIssued, String? ppExpiry, String? ppDestinate, String? presentAddress, String? permanentAddress, String? profilePhoto, String? position, String? race, String? religion, String? status, List<String>? workExperience}) {
    return PersonalDetails._internal(
      id: id,
      tempID: tempID ?? this.tempID,
      age: age ?? this.age,
      alternateNo: alternateNo ?? this.alternateNo,
      agent: agent ?? this.agent,
      bwnIcNo: bwnIcNo ?? this.bwnIcNo,
      bwnIcExpiry: bwnIcExpiry ?? this.bwnIcExpiry,
      bwnIcColour: bwnIcColour ?? this.bwnIcColour,
      contactNo: contactNo ?? this.contactNo,
      cob: cob ?? this.cob,
      contractType: contractType ?? this.contractType,
      chinese: chinese ?? this.chinese,
      dob: dob ?? this.dob,
      driveLic: driveLic ?? this.driveLic,
      email: email ?? this.email,
      empType: empType ?? this.empType,
      eduDetails: eduDetails ?? this.eduDetails,
      familyDetails: familyDetails ?? this.familyDetails,
      gender: gender ?? this.gender,
      lang: lang ?? this.lang,
      marital: marital ?? this.marital,
      name: name ?? this.name,
      nationality: nationality ?? this.nationality,
      otherNation: otherNation ?? this.otherNation,
      otherRace: otherRace ?? this.otherRace,
      otherReligion: otherReligion ?? this.otherReligion,
      ppNo: ppNo ?? this.ppNo,
      ppIssued: ppIssued ?? this.ppIssued,
      ppExpiry: ppExpiry ?? this.ppExpiry,
      ppDestinate: ppDestinate ?? this.ppDestinate,
      presentAddress: presentAddress ?? this.presentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      position: position ?? this.position,
      race: race ?? this.race,
      religion: religion ?? this.religion,
      status: status ?? this.status,
      workExperience: workExperience ?? this.workExperience);
  }
  
  PersonalDetails copyWithModelFieldValues({
    ModelFieldValue<String>? tempID,
    ModelFieldValue<int>? age,
    ModelFieldValue<String?>? alternateNo,
    ModelFieldValue<String?>? agent,
    ModelFieldValue<String?>? bwnIcNo,
    ModelFieldValue<String?>? bwnIcExpiry,
    ModelFieldValue<String?>? bwnIcColour,
    ModelFieldValue<String>? contactNo,
    ModelFieldValue<String>? cob,
    ModelFieldValue<String>? contractType,
    ModelFieldValue<String?>? chinese,
    ModelFieldValue<String>? dob,
    ModelFieldValue<String?>? driveLic,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? empType,
    ModelFieldValue<List<String>>? eduDetails,
    ModelFieldValue<List<String>?>? familyDetails,
    ModelFieldValue<String>? gender,
    ModelFieldValue<String>? lang,
    ModelFieldValue<String>? marital,
    ModelFieldValue<String>? name,
    ModelFieldValue<String>? nationality,
    ModelFieldValue<String?>? otherNation,
    ModelFieldValue<String?>? otherRace,
    ModelFieldValue<String?>? otherReligion,
    ModelFieldValue<String?>? ppNo,
    ModelFieldValue<String?>? ppIssued,
    ModelFieldValue<String?>? ppExpiry,
    ModelFieldValue<String?>? ppDestinate,
    ModelFieldValue<String>? presentAddress,
    ModelFieldValue<String>? permanentAddress,
    ModelFieldValue<String>? profilePhoto,
    ModelFieldValue<String>? position,
    ModelFieldValue<String>? race,
    ModelFieldValue<String>? religion,
    ModelFieldValue<String>? status,
    ModelFieldValue<List<String>?>? workExperience
  }) {
    return PersonalDetails._internal(
      id: id,
      tempID: tempID == null ? this.tempID : tempID.value,
      age: age == null ? this.age : age.value,
      alternateNo: alternateNo == null ? this.alternateNo : alternateNo.value,
      agent: agent == null ? this.agent : agent.value,
      bwnIcNo: bwnIcNo == null ? this.bwnIcNo : bwnIcNo.value,
      bwnIcExpiry: bwnIcExpiry == null ? this.bwnIcExpiry : bwnIcExpiry.value,
      bwnIcColour: bwnIcColour == null ? this.bwnIcColour : bwnIcColour.value,
      contactNo: contactNo == null ? this.contactNo : contactNo.value,
      cob: cob == null ? this.cob : cob.value,
      contractType: contractType == null ? this.contractType : contractType.value,
      chinese: chinese == null ? this.chinese : chinese.value,
      dob: dob == null ? this.dob : dob.value,
      driveLic: driveLic == null ? this.driveLic : driveLic.value,
      email: email == null ? this.email : email.value,
      empType: empType == null ? this.empType : empType.value,
      eduDetails: eduDetails == null ? this.eduDetails : eduDetails.value,
      familyDetails: familyDetails == null ? this.familyDetails : familyDetails.value,
      gender: gender == null ? this.gender : gender.value,
      lang: lang == null ? this.lang : lang.value,
      marital: marital == null ? this.marital : marital.value,
      name: name == null ? this.name : name.value,
      nationality: nationality == null ? this.nationality : nationality.value,
      otherNation: otherNation == null ? this.otherNation : otherNation.value,
      otherRace: otherRace == null ? this.otherRace : otherRace.value,
      otherReligion: otherReligion == null ? this.otherReligion : otherReligion.value,
      ppNo: ppNo == null ? this.ppNo : ppNo.value,
      ppIssued: ppIssued == null ? this.ppIssued : ppIssued.value,
      ppExpiry: ppExpiry == null ? this.ppExpiry : ppExpiry.value,
      ppDestinate: ppDestinate == null ? this.ppDestinate : ppDestinate.value,
      presentAddress: presentAddress == null ? this.presentAddress : presentAddress.value,
      permanentAddress: permanentAddress == null ? this.permanentAddress : permanentAddress.value,
      profilePhoto: profilePhoto == null ? this.profilePhoto : profilePhoto.value,
      position: position == null ? this.position : position.value,
      race: race == null ? this.race : race.value,
      religion: religion == null ? this.religion : religion.value,
      status: status == null ? this.status : status.value,
      workExperience: workExperience == null ? this.workExperience : workExperience.value
    );
  }
  
  PersonalDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tempID = json['tempID'],
      _age = (json['age'] as num?)?.toInt(),
      _alternateNo = json['alternateNo'],
      _agent = json['agent'],
      _bwnIcNo = json['bwnIcNo'],
      _bwnIcExpiry = json['bwnIcExpiry'],
      _bwnIcColour = json['bwnIcColour'],
      _contactNo = json['contactNo'],
      _cob = json['cob'],
      _contractType = json['contractType'],
      _chinese = json['chinese'],
      _dob = json['dob'],
      _driveLic = json['driveLic'],
      _email = json['email'],
      _empType = json['empType'],
      _eduDetails = json['eduDetails']?.cast<String>(),
      _familyDetails = json['familyDetails']?.cast<String>(),
      _gender = json['gender'],
      _lang = json['lang'],
      _marital = json['marital'],
      _name = json['name'],
      _nationality = json['nationality'],
      _otherNation = json['otherNation'],
      _otherRace = json['otherRace'],
      _otherReligion = json['otherReligion'],
      _ppNo = json['ppNo'],
      _ppIssued = json['ppIssued'],
      _ppExpiry = json['ppExpiry'],
      _ppDestinate = json['ppDestinate'],
      _presentAddress = json['presentAddress'],
      _permanentAddress = json['permanentAddress'],
      _profilePhoto = json['profilePhoto'],
      _position = json['position'],
      _race = json['race'],
      _religion = json['religion'],
      _status = json['status'],
      _workExperience = json['workExperience']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tempID': _tempID, 'age': _age, 'alternateNo': _alternateNo, 'agent': _agent, 'bwnIcNo': _bwnIcNo, 'bwnIcExpiry': _bwnIcExpiry, 'bwnIcColour': _bwnIcColour, 'contactNo': _contactNo, 'cob': _cob, 'contractType': _contractType, 'chinese': _chinese, 'dob': _dob, 'driveLic': _driveLic, 'email': _email, 'empType': _empType, 'eduDetails': _eduDetails, 'familyDetails': _familyDetails, 'gender': _gender, 'lang': _lang, 'marital': _marital, 'name': _name, 'nationality': _nationality, 'otherNation': _otherNation, 'otherRace': _otherRace, 'otherReligion': _otherReligion, 'ppNo': _ppNo, 'ppIssued': _ppIssued, 'ppExpiry': _ppExpiry, 'ppDestinate': _ppDestinate, 'presentAddress': _presentAddress, 'permanentAddress': _permanentAddress, 'profilePhoto': _profilePhoto, 'position': _position, 'race': _race, 'religion': _religion, 'status': _status, 'workExperience': _workExperience, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'tempID': _tempID,
    'age': _age,
    'alternateNo': _alternateNo,
    'agent': _agent,
    'bwnIcNo': _bwnIcNo,
    'bwnIcExpiry': _bwnIcExpiry,
    'bwnIcColour': _bwnIcColour,
    'contactNo': _contactNo,
    'cob': _cob,
    'contractType': _contractType,
    'chinese': _chinese,
    'dob': _dob,
    'driveLic': _driveLic,
    'email': _email,
    'empType': _empType,
    'eduDetails': _eduDetails,
    'familyDetails': _familyDetails,
    'gender': _gender,
    'lang': _lang,
    'marital': _marital,
    'name': _name,
    'nationality': _nationality,
    'otherNation': _otherNation,
    'otherRace': _otherRace,
    'otherReligion': _otherReligion,
    'ppNo': _ppNo,
    'ppIssued': _ppIssued,
    'ppExpiry': _ppExpiry,
    'ppDestinate': _ppDestinate,
    'presentAddress': _presentAddress,
    'permanentAddress': _permanentAddress,
    'profilePhoto': _profilePhoto,
    'position': _position,
    'race': _race,
    'religion': _religion,
    'status': _status,
    'workExperience': _workExperience,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PersonalDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PersonalDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TEMPID = amplify_core.QueryField(fieldName: "tempID");
  static final AGE = amplify_core.QueryField(fieldName: "age");
  static final ALTERNATENO = amplify_core.QueryField(fieldName: "alternateNo");
  static final AGENT = amplify_core.QueryField(fieldName: "agent");
  static final BWNICNO = amplify_core.QueryField(fieldName: "bwnIcNo");
  static final BWNICEXPIRY = amplify_core.QueryField(fieldName: "bwnIcExpiry");
  static final BWNICCOLOUR = amplify_core.QueryField(fieldName: "bwnIcColour");
  static final CONTACTNO = amplify_core.QueryField(fieldName: "contactNo");
  static final COB = amplify_core.QueryField(fieldName: "cob");
  static final CONTRACTTYPE = amplify_core.QueryField(fieldName: "contractType");
  static final CHINESE = amplify_core.QueryField(fieldName: "chinese");
  static final DOB = amplify_core.QueryField(fieldName: "dob");
  static final DRIVELIC = amplify_core.QueryField(fieldName: "driveLic");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final EMPTYPE = amplify_core.QueryField(fieldName: "empType");
  static final EDUDETAILS = amplify_core.QueryField(fieldName: "eduDetails");
  static final FAMILYDETAILS = amplify_core.QueryField(fieldName: "familyDetails");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final LANG = amplify_core.QueryField(fieldName: "lang");
  static final MARITAL = amplify_core.QueryField(fieldName: "marital");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final NATIONALITY = amplify_core.QueryField(fieldName: "nationality");
  static final OTHERNATION = amplify_core.QueryField(fieldName: "otherNation");
  static final OTHERRACE = amplify_core.QueryField(fieldName: "otherRace");
  static final OTHERRELIGION = amplify_core.QueryField(fieldName: "otherReligion");
  static final PPNO = amplify_core.QueryField(fieldName: "ppNo");
  static final PPISSUED = amplify_core.QueryField(fieldName: "ppIssued");
  static final PPEXPIRY = amplify_core.QueryField(fieldName: "ppExpiry");
  static final PPDESTINATE = amplify_core.QueryField(fieldName: "ppDestinate");
  static final PRESENTADDRESS = amplify_core.QueryField(fieldName: "presentAddress");
  static final PERMANENTADDRESS = amplify_core.QueryField(fieldName: "permanentAddress");
  static final PROFILEPHOTO = amplify_core.QueryField(fieldName: "profilePhoto");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final RACE = amplify_core.QueryField(fieldName: "race");
  static final RELIGION = amplify_core.QueryField(fieldName: "religion");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final WORKEXPERIENCE = amplify_core.QueryField(fieldName: "workExperience");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PersonalDetails";
    modelSchemaDefinition.pluralName = "PersonalDetails";
    
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
      key: PersonalDetails.TEMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.AGE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.ALTERNATENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.AGENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.BWNICNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.BWNICEXPIRY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.BWNICCOLOUR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.CONTACTNO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.COB,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.CONTRACTTYPE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.CHINESE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.DOB,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.DRIVELIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.EMPTYPE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.EDUDETAILS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.FAMILYDETAILS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.GENDER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.LANG,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.MARITAL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.NATIONALITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.OTHERNATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.OTHERRACE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.OTHERRELIGION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PPNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PPISSUED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PPEXPIRY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PPDESTINATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PRESENTADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PERMANENTADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.PROFILEPHOTO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.POSITION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.RACE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.RELIGION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PersonalDetails.WORKEXPERIENCE,
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

class _PersonalDetailsModelType extends amplify_core.ModelType<PersonalDetails> {
  const _PersonalDetailsModelType();
  
  @override
  PersonalDetails fromJson(Map<String, dynamic> jsonData) {
    return PersonalDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PersonalDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PersonalDetails] in your schema.
 */
class PersonalDetailsModelIdentifier implements amplify_core.ModelIdentifier<PersonalDetails> {
  final String id;

  /** Create an instance of PersonalDetailsModelIdentifier using [id] the primary key. */
  const PersonalDetailsModelIdentifier({
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
  String toString() => 'PersonalDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PersonalDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}