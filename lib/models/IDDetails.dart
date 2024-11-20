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


/** This is an auto generated class representing the IDDetails type in your schema. */
class IDDetails extends amplify_core.Model {
  static const classType = const _IDDetailsModelType();
  final String id;
  final String? _empID;
  final List<String>? _applicationUpload;
  final String? _bwnIcNo;
  final String? _bwnIcColour;
  final List<String>? _bwnIcExpiry;
  final List<String>? _bwnUpload;
  final List<String>? _cvCertifyUpload;
  final String? _driveLic;
  final String? _inducBrief;
  final String? _inducBriefUp;
  final List<String>? _loiUpload;
  final String? _myIcNo;
  final List<String>? _myIcUpload;
  final String? _nationality;
  final String? _nationalCat;
  final String? _otherNation;
  final String? _otherRace;
  final String? _otherReligion;
  final List<String>? _ppNo;
  final List<String>? _paafCvevUpload;
  final List<String>? _ppIssued;
  final List<String>? _ppExpiry;
  final List<String>? _ppUpload;
  final List<String>? _ppDestinate;
  final String? _preEmp;
  final String? _preEmpPeriod;
  final String? _race;
  final String? _religion;
  final List<String>? _supportDocUpload;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  IDDetailsModelIdentifier get modelIdentifier {
      return IDDetailsModelIdentifier(
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
  
  List<String>? get applicationUpload {
    return _applicationUpload;
  }
  
  String? get bwnIcNo {
    return _bwnIcNo;
  }
  
  String? get bwnIcColour {
    return _bwnIcColour;
  }
  
  List<String>? get bwnIcExpiry {
    return _bwnIcExpiry;
  }
  
  List<String>? get bwnUpload {
    return _bwnUpload;
  }
  
  List<String>? get cvCertifyUpload {
    return _cvCertifyUpload;
  }
  
  String? get driveLic {
    return _driveLic;
  }
  
  String? get inducBrief {
    return _inducBrief;
  }
  
  String? get inducBriefUp {
    return _inducBriefUp;
  }
  
  List<String>? get loiUpload {
    return _loiUpload;
  }
  
  String? get myIcNo {
    return _myIcNo;
  }
  
  List<String>? get myIcUpload {
    return _myIcUpload;
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
  
  String? get nationalCat {
    return _nationalCat;
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
  
  List<String>? get ppNo {
    return _ppNo;
  }
  
  List<String>? get paafCvevUpload {
    return _paafCvevUpload;
  }
  
  List<String>? get ppIssued {
    return _ppIssued;
  }
  
  List<String>? get ppExpiry {
    return _ppExpiry;
  }
  
  List<String>? get ppUpload {
    return _ppUpload;
  }
  
  List<String>? get ppDestinate {
    return _ppDestinate;
  }
  
  String? get preEmp {
    return _preEmp;
  }
  
  String? get preEmpPeriod {
    return _preEmpPeriod;
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
  
  List<String>? get supportDocUpload {
    return _supportDocUpload;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const IDDetails._internal({required this.id, required empID, applicationUpload, bwnIcNo, bwnIcColour, bwnIcExpiry, bwnUpload, cvCertifyUpload, driveLic, inducBrief, inducBriefUp, loiUpload, myIcNo, myIcUpload, required nationality, nationalCat, otherNation, otherRace, otherReligion, ppNo, paafCvevUpload, ppIssued, ppExpiry, ppUpload, ppDestinate, preEmp, preEmpPeriod, required race, required religion, supportDocUpload, createdAt, updatedAt}): _empID = empID, _applicationUpload = applicationUpload, _bwnIcNo = bwnIcNo, _bwnIcColour = bwnIcColour, _bwnIcExpiry = bwnIcExpiry, _bwnUpload = bwnUpload, _cvCertifyUpload = cvCertifyUpload, _driveLic = driveLic, _inducBrief = inducBrief, _inducBriefUp = inducBriefUp, _loiUpload = loiUpload, _myIcNo = myIcNo, _myIcUpload = myIcUpload, _nationality = nationality, _nationalCat = nationalCat, _otherNation = otherNation, _otherRace = otherRace, _otherReligion = otherReligion, _ppNo = ppNo, _paafCvevUpload = paafCvevUpload, _ppIssued = ppIssued, _ppExpiry = ppExpiry, _ppUpload = ppUpload, _ppDestinate = ppDestinate, _preEmp = preEmp, _preEmpPeriod = preEmpPeriod, _race = race, _religion = religion, _supportDocUpload = supportDocUpload, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory IDDetails({String? id, required String empID, List<String>? applicationUpload, String? bwnIcNo, String? bwnIcColour, List<String>? bwnIcExpiry, List<String>? bwnUpload, List<String>? cvCertifyUpload, String? driveLic, String? inducBrief, String? inducBriefUp, List<String>? loiUpload, String? myIcNo, List<String>? myIcUpload, required String nationality, String? nationalCat, String? otherNation, String? otherRace, String? otherReligion, List<String>? ppNo, List<String>? paafCvevUpload, List<String>? ppIssued, List<String>? ppExpiry, List<String>? ppUpload, List<String>? ppDestinate, String? preEmp, String? preEmpPeriod, required String race, required String religion, List<String>? supportDocUpload}) {
    return IDDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      applicationUpload: applicationUpload != null ? List<String>.unmodifiable(applicationUpload) : applicationUpload,
      bwnIcNo: bwnIcNo,
      bwnIcColour: bwnIcColour,
      bwnIcExpiry: bwnIcExpiry != null ? List<String>.unmodifiable(bwnIcExpiry) : bwnIcExpiry,
      bwnUpload: bwnUpload != null ? List<String>.unmodifiable(bwnUpload) : bwnUpload,
      cvCertifyUpload: cvCertifyUpload != null ? List<String>.unmodifiable(cvCertifyUpload) : cvCertifyUpload,
      driveLic: driveLic,
      inducBrief: inducBrief,
      inducBriefUp: inducBriefUp,
      loiUpload: loiUpload != null ? List<String>.unmodifiable(loiUpload) : loiUpload,
      myIcNo: myIcNo,
      myIcUpload: myIcUpload != null ? List<String>.unmodifiable(myIcUpload) : myIcUpload,
      nationality: nationality,
      nationalCat: nationalCat,
      otherNation: otherNation,
      otherRace: otherRace,
      otherReligion: otherReligion,
      ppNo: ppNo != null ? List<String>.unmodifiable(ppNo) : ppNo,
      paafCvevUpload: paafCvevUpload != null ? List<String>.unmodifiable(paafCvevUpload) : paafCvevUpload,
      ppIssued: ppIssued != null ? List<String>.unmodifiable(ppIssued) : ppIssued,
      ppExpiry: ppExpiry != null ? List<String>.unmodifiable(ppExpiry) : ppExpiry,
      ppUpload: ppUpload != null ? List<String>.unmodifiable(ppUpload) : ppUpload,
      ppDestinate: ppDestinate != null ? List<String>.unmodifiable(ppDestinate) : ppDestinate,
      preEmp: preEmp,
      preEmpPeriod: preEmpPeriod,
      race: race,
      religion: religion,
      supportDocUpload: supportDocUpload != null ? List<String>.unmodifiable(supportDocUpload) : supportDocUpload);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IDDetails &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_applicationUpload, other._applicationUpload) &&
      _bwnIcNo == other._bwnIcNo &&
      _bwnIcColour == other._bwnIcColour &&
      DeepCollectionEquality().equals(_bwnIcExpiry, other._bwnIcExpiry) &&
      DeepCollectionEquality().equals(_bwnUpload, other._bwnUpload) &&
      DeepCollectionEquality().equals(_cvCertifyUpload, other._cvCertifyUpload) &&
      _driveLic == other._driveLic &&
      _inducBrief == other._inducBrief &&
      _inducBriefUp == other._inducBriefUp &&
      DeepCollectionEquality().equals(_loiUpload, other._loiUpload) &&
      _myIcNo == other._myIcNo &&
      DeepCollectionEquality().equals(_myIcUpload, other._myIcUpload) &&
      _nationality == other._nationality &&
      _nationalCat == other._nationalCat &&
      _otherNation == other._otherNation &&
      _otherRace == other._otherRace &&
      _otherReligion == other._otherReligion &&
      DeepCollectionEquality().equals(_ppNo, other._ppNo) &&
      DeepCollectionEquality().equals(_paafCvevUpload, other._paafCvevUpload) &&
      DeepCollectionEquality().equals(_ppIssued, other._ppIssued) &&
      DeepCollectionEquality().equals(_ppExpiry, other._ppExpiry) &&
      DeepCollectionEquality().equals(_ppUpload, other._ppUpload) &&
      DeepCollectionEquality().equals(_ppDestinate, other._ppDestinate) &&
      _preEmp == other._preEmp &&
      _preEmpPeriod == other._preEmpPeriod &&
      _race == other._race &&
      _religion == other._religion &&
      DeepCollectionEquality().equals(_supportDocUpload, other._supportDocUpload);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("IDDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("applicationUpload=" + (_applicationUpload != null ? _applicationUpload!.toString() : "null") + ", ");
    buffer.write("bwnIcNo=" + "$_bwnIcNo" + ", ");
    buffer.write("bwnIcColour=" + "$_bwnIcColour" + ", ");
    buffer.write("bwnIcExpiry=" + (_bwnIcExpiry != null ? _bwnIcExpiry!.toString() : "null") + ", ");
    buffer.write("bwnUpload=" + (_bwnUpload != null ? _bwnUpload!.toString() : "null") + ", ");
    buffer.write("cvCertifyUpload=" + (_cvCertifyUpload != null ? _cvCertifyUpload!.toString() : "null") + ", ");
    buffer.write("driveLic=" + "$_driveLic" + ", ");
    buffer.write("inducBrief=" + "$_inducBrief" + ", ");
    buffer.write("inducBriefUp=" + "$_inducBriefUp" + ", ");
    buffer.write("loiUpload=" + (_loiUpload != null ? _loiUpload!.toString() : "null") + ", ");
    buffer.write("myIcNo=" + "$_myIcNo" + ", ");
    buffer.write("myIcUpload=" + (_myIcUpload != null ? _myIcUpload!.toString() : "null") + ", ");
    buffer.write("nationality=" + "$_nationality" + ", ");
    buffer.write("nationalCat=" + "$_nationalCat" + ", ");
    buffer.write("otherNation=" + "$_otherNation" + ", ");
    buffer.write("otherRace=" + "$_otherRace" + ", ");
    buffer.write("otherReligion=" + "$_otherReligion" + ", ");
    buffer.write("ppNo=" + (_ppNo != null ? _ppNo!.toString() : "null") + ", ");
    buffer.write("paafCvevUpload=" + (_paafCvevUpload != null ? _paafCvevUpload!.toString() : "null") + ", ");
    buffer.write("ppIssued=" + (_ppIssued != null ? _ppIssued!.toString() : "null") + ", ");
    buffer.write("ppExpiry=" + (_ppExpiry != null ? _ppExpiry!.toString() : "null") + ", ");
    buffer.write("ppUpload=" + (_ppUpload != null ? _ppUpload!.toString() : "null") + ", ");
    buffer.write("ppDestinate=" + (_ppDestinate != null ? _ppDestinate!.toString() : "null") + ", ");
    buffer.write("preEmp=" + "$_preEmp" + ", ");
    buffer.write("preEmpPeriod=" + "$_preEmpPeriod" + ", ");
    buffer.write("race=" + "$_race" + ", ");
    buffer.write("religion=" + "$_religion" + ", ");
    buffer.write("supportDocUpload=" + (_supportDocUpload != null ? _supportDocUpload!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  IDDetails copyWith({String? empID, List<String>? applicationUpload, String? bwnIcNo, String? bwnIcColour, List<String>? bwnIcExpiry, List<String>? bwnUpload, List<String>? cvCertifyUpload, String? driveLic, String? inducBrief, String? inducBriefUp, List<String>? loiUpload, String? myIcNo, List<String>? myIcUpload, String? nationality, String? nationalCat, String? otherNation, String? otherRace, String? otherReligion, List<String>? ppNo, List<String>? paafCvevUpload, List<String>? ppIssued, List<String>? ppExpiry, List<String>? ppUpload, List<String>? ppDestinate, String? preEmp, String? preEmpPeriod, String? race, String? religion, List<String>? supportDocUpload}) {
    return IDDetails._internal(
      id: id,
      empID: empID ?? this.empID,
      applicationUpload: applicationUpload ?? this.applicationUpload,
      bwnIcNo: bwnIcNo ?? this.bwnIcNo,
      bwnIcColour: bwnIcColour ?? this.bwnIcColour,
      bwnIcExpiry: bwnIcExpiry ?? this.bwnIcExpiry,
      bwnUpload: bwnUpload ?? this.bwnUpload,
      cvCertifyUpload: cvCertifyUpload ?? this.cvCertifyUpload,
      driveLic: driveLic ?? this.driveLic,
      inducBrief: inducBrief ?? this.inducBrief,
      inducBriefUp: inducBriefUp ?? this.inducBriefUp,
      loiUpload: loiUpload ?? this.loiUpload,
      myIcNo: myIcNo ?? this.myIcNo,
      myIcUpload: myIcUpload ?? this.myIcUpload,
      nationality: nationality ?? this.nationality,
      nationalCat: nationalCat ?? this.nationalCat,
      otherNation: otherNation ?? this.otherNation,
      otherRace: otherRace ?? this.otherRace,
      otherReligion: otherReligion ?? this.otherReligion,
      ppNo: ppNo ?? this.ppNo,
      paafCvevUpload: paafCvevUpload ?? this.paafCvevUpload,
      ppIssued: ppIssued ?? this.ppIssued,
      ppExpiry: ppExpiry ?? this.ppExpiry,
      ppUpload: ppUpload ?? this.ppUpload,
      ppDestinate: ppDestinate ?? this.ppDestinate,
      preEmp: preEmp ?? this.preEmp,
      preEmpPeriod: preEmpPeriod ?? this.preEmpPeriod,
      race: race ?? this.race,
      religion: religion ?? this.religion,
      supportDocUpload: supportDocUpload ?? this.supportDocUpload);
  }
  
  IDDetails copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? applicationUpload,
    ModelFieldValue<String?>? bwnIcNo,
    ModelFieldValue<String?>? bwnIcColour,
    ModelFieldValue<List<String>?>? bwnIcExpiry,
    ModelFieldValue<List<String>?>? bwnUpload,
    ModelFieldValue<List<String>?>? cvCertifyUpload,
    ModelFieldValue<String?>? driveLic,
    ModelFieldValue<String?>? inducBrief,
    ModelFieldValue<String?>? inducBriefUp,
    ModelFieldValue<List<String>?>? loiUpload,
    ModelFieldValue<String?>? myIcNo,
    ModelFieldValue<List<String>?>? myIcUpload,
    ModelFieldValue<String>? nationality,
    ModelFieldValue<String?>? nationalCat,
    ModelFieldValue<String?>? otherNation,
    ModelFieldValue<String?>? otherRace,
    ModelFieldValue<String?>? otherReligion,
    ModelFieldValue<List<String>?>? ppNo,
    ModelFieldValue<List<String>?>? paafCvevUpload,
    ModelFieldValue<List<String>?>? ppIssued,
    ModelFieldValue<List<String>?>? ppExpiry,
    ModelFieldValue<List<String>?>? ppUpload,
    ModelFieldValue<List<String>?>? ppDestinate,
    ModelFieldValue<String?>? preEmp,
    ModelFieldValue<String?>? preEmpPeriod,
    ModelFieldValue<String>? race,
    ModelFieldValue<String>? religion,
    ModelFieldValue<List<String>?>? supportDocUpload
  }) {
    return IDDetails._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      applicationUpload: applicationUpload == null ? this.applicationUpload : applicationUpload.value,
      bwnIcNo: bwnIcNo == null ? this.bwnIcNo : bwnIcNo.value,
      bwnIcColour: bwnIcColour == null ? this.bwnIcColour : bwnIcColour.value,
      bwnIcExpiry: bwnIcExpiry == null ? this.bwnIcExpiry : bwnIcExpiry.value,
      bwnUpload: bwnUpload == null ? this.bwnUpload : bwnUpload.value,
      cvCertifyUpload: cvCertifyUpload == null ? this.cvCertifyUpload : cvCertifyUpload.value,
      driveLic: driveLic == null ? this.driveLic : driveLic.value,
      inducBrief: inducBrief == null ? this.inducBrief : inducBrief.value,
      inducBriefUp: inducBriefUp == null ? this.inducBriefUp : inducBriefUp.value,
      loiUpload: loiUpload == null ? this.loiUpload : loiUpload.value,
      myIcNo: myIcNo == null ? this.myIcNo : myIcNo.value,
      myIcUpload: myIcUpload == null ? this.myIcUpload : myIcUpload.value,
      nationality: nationality == null ? this.nationality : nationality.value,
      nationalCat: nationalCat == null ? this.nationalCat : nationalCat.value,
      otherNation: otherNation == null ? this.otherNation : otherNation.value,
      otherRace: otherRace == null ? this.otherRace : otherRace.value,
      otherReligion: otherReligion == null ? this.otherReligion : otherReligion.value,
      ppNo: ppNo == null ? this.ppNo : ppNo.value,
      paafCvevUpload: paafCvevUpload == null ? this.paafCvevUpload : paafCvevUpload.value,
      ppIssued: ppIssued == null ? this.ppIssued : ppIssued.value,
      ppExpiry: ppExpiry == null ? this.ppExpiry : ppExpiry.value,
      ppUpload: ppUpload == null ? this.ppUpload : ppUpload.value,
      ppDestinate: ppDestinate == null ? this.ppDestinate : ppDestinate.value,
      preEmp: preEmp == null ? this.preEmp : preEmp.value,
      preEmpPeriod: preEmpPeriod == null ? this.preEmpPeriod : preEmpPeriod.value,
      race: race == null ? this.race : race.value,
      religion: religion == null ? this.religion : religion.value,
      supportDocUpload: supportDocUpload == null ? this.supportDocUpload : supportDocUpload.value
    );
  }
  
  IDDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _applicationUpload = json['applicationUpload']?.cast<String>(),
      _bwnIcNo = json['bwnIcNo'],
      _bwnIcColour = json['bwnIcColour'],
      _bwnIcExpiry = json['bwnIcExpiry']?.cast<String>(),
      _bwnUpload = json['bwnUpload']?.cast<String>(),
      _cvCertifyUpload = json['cvCertifyUpload']?.cast<String>(),
      _driveLic = json['driveLic'],
      _inducBrief = json['inducBrief'],
      _inducBriefUp = json['inducBriefUp'],
      _loiUpload = json['loiUpload']?.cast<String>(),
      _myIcNo = json['myIcNo'],
      _myIcUpload = json['myIcUpload']?.cast<String>(),
      _nationality = json['nationality'],
      _nationalCat = json['nationalCat'],
      _otherNation = json['otherNation'],
      _otherRace = json['otherRace'],
      _otherReligion = json['otherReligion'],
      _ppNo = json['ppNo']?.cast<String>(),
      _paafCvevUpload = json['paafCvevUpload']?.cast<String>(),
      _ppIssued = json['ppIssued']?.cast<String>(),
      _ppExpiry = json['ppExpiry']?.cast<String>(),
      _ppUpload = json['ppUpload']?.cast<String>(),
      _ppDestinate = json['ppDestinate']?.cast<String>(),
      _preEmp = json['preEmp'],
      _preEmpPeriod = json['preEmpPeriod'],
      _race = json['race'],
      _religion = json['religion'],
      _supportDocUpload = json['supportDocUpload']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'applicationUpload': _applicationUpload, 'bwnIcNo': _bwnIcNo, 'bwnIcColour': _bwnIcColour, 'bwnIcExpiry': _bwnIcExpiry, 'bwnUpload': _bwnUpload, 'cvCertifyUpload': _cvCertifyUpload, 'driveLic': _driveLic, 'inducBrief': _inducBrief, 'inducBriefUp': _inducBriefUp, 'loiUpload': _loiUpload, 'myIcNo': _myIcNo, 'myIcUpload': _myIcUpload, 'nationality': _nationality, 'nationalCat': _nationalCat, 'otherNation': _otherNation, 'otherRace': _otherRace, 'otherReligion': _otherReligion, 'ppNo': _ppNo, 'paafCvevUpload': _paafCvevUpload, 'ppIssued': _ppIssued, 'ppExpiry': _ppExpiry, 'ppUpload': _ppUpload, 'ppDestinate': _ppDestinate, 'preEmp': _preEmp, 'preEmpPeriod': _preEmpPeriod, 'race': _race, 'religion': _religion, 'supportDocUpload': _supportDocUpload, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'applicationUpload': _applicationUpload,
    'bwnIcNo': _bwnIcNo,
    'bwnIcColour': _bwnIcColour,
    'bwnIcExpiry': _bwnIcExpiry,
    'bwnUpload': _bwnUpload,
    'cvCertifyUpload': _cvCertifyUpload,
    'driveLic': _driveLic,
    'inducBrief': _inducBrief,
    'inducBriefUp': _inducBriefUp,
    'loiUpload': _loiUpload,
    'myIcNo': _myIcNo,
    'myIcUpload': _myIcUpload,
    'nationality': _nationality,
    'nationalCat': _nationalCat,
    'otherNation': _otherNation,
    'otherRace': _otherRace,
    'otherReligion': _otherReligion,
    'ppNo': _ppNo,
    'paafCvevUpload': _paafCvevUpload,
    'ppIssued': _ppIssued,
    'ppExpiry': _ppExpiry,
    'ppUpload': _ppUpload,
    'ppDestinate': _ppDestinate,
    'preEmp': _preEmp,
    'preEmpPeriod': _preEmpPeriod,
    'race': _race,
    'religion': _religion,
    'supportDocUpload': _supportDocUpload,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<IDDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<IDDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final APPLICATIONUPLOAD = amplify_core.QueryField(fieldName: "applicationUpload");
  static final BWNICNO = amplify_core.QueryField(fieldName: "bwnIcNo");
  static final BWNICCOLOUR = amplify_core.QueryField(fieldName: "bwnIcColour");
  static final BWNICEXPIRY = amplify_core.QueryField(fieldName: "bwnIcExpiry");
  static final BWNUPLOAD = amplify_core.QueryField(fieldName: "bwnUpload");
  static final CVCERTIFYUPLOAD = amplify_core.QueryField(fieldName: "cvCertifyUpload");
  static final DRIVELIC = amplify_core.QueryField(fieldName: "driveLic");
  static final INDUCBRIEF = amplify_core.QueryField(fieldName: "inducBrief");
  static final INDUCBRIEFUP = amplify_core.QueryField(fieldName: "inducBriefUp");
  static final LOIUPLOAD = amplify_core.QueryField(fieldName: "loiUpload");
  static final MYICNO = amplify_core.QueryField(fieldName: "myIcNo");
  static final MYICUPLOAD = amplify_core.QueryField(fieldName: "myIcUpload");
  static final NATIONALITY = amplify_core.QueryField(fieldName: "nationality");
  static final NATIONALCAT = amplify_core.QueryField(fieldName: "nationalCat");
  static final OTHERNATION = amplify_core.QueryField(fieldName: "otherNation");
  static final OTHERRACE = amplify_core.QueryField(fieldName: "otherRace");
  static final OTHERRELIGION = amplify_core.QueryField(fieldName: "otherReligion");
  static final PPNO = amplify_core.QueryField(fieldName: "ppNo");
  static final PAAFCVEVUPLOAD = amplify_core.QueryField(fieldName: "paafCvevUpload");
  static final PPISSUED = amplify_core.QueryField(fieldName: "ppIssued");
  static final PPEXPIRY = amplify_core.QueryField(fieldName: "ppExpiry");
  static final PPUPLOAD = amplify_core.QueryField(fieldName: "ppUpload");
  static final PPDESTINATE = amplify_core.QueryField(fieldName: "ppDestinate");
  static final PREEMP = amplify_core.QueryField(fieldName: "preEmp");
  static final PREEMPPERIOD = amplify_core.QueryField(fieldName: "preEmpPeriod");
  static final RACE = amplify_core.QueryField(fieldName: "race");
  static final RELIGION = amplify_core.QueryField(fieldName: "religion");
  static final SUPPORTDOCUPLOAD = amplify_core.QueryField(fieldName: "supportDocUpload");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "IDDetails";
    modelSchemaDefinition.pluralName = "IDDetails";
    
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
      key: IDDetails.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.APPLICATIONUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.BWNICNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.BWNICCOLOUR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.BWNICEXPIRY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.BWNUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.CVCERTIFYUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.DRIVELIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.INDUCBRIEF,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.INDUCBRIEFUP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.LOIUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.MYICNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.MYICUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.NATIONALITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.NATIONALCAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.OTHERNATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.OTHERRACE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.OTHERRELIGION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PPNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PAAFCVEVUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PPISSUED,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PPEXPIRY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PPUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PPDESTINATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PREEMP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.PREEMPPERIOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.RACE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.RELIGION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: IDDetails.SUPPORTDOCUPLOAD,
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

class _IDDetailsModelType extends amplify_core.ModelType<IDDetails> {
  const _IDDetailsModelType();
  
  @override
  IDDetails fromJson(Map<String, dynamic> jsonData) {
    return IDDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'IDDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [IDDetails] in your schema.
 */
class IDDetailsModelIdentifier implements amplify_core.ModelIdentifier<IDDetails> {
  final String id;

  /** Create an instance of IDDetailsModelIdentifier using [id] the primary key. */
  const IDDetailsModelIdentifier({
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
  String toString() => 'IDDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is IDDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}