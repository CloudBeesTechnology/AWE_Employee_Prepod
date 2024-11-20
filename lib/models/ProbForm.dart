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


/** This is an auto generated class representing the ProbForm type in your schema. */
class ProbForm extends amplify_core.Model {
  static const classType = const _ProbFormModelType();
  final String id;
  final String? _empID;
  final String? _adaptability;
  final String? _additionalInfo;
  final String? _attention;
  final String? _attitude;
  final String? _commitment;
  final String? _communication;
  final String? _deadline;
  final String? _department;
  final String? _diligent;
  final String? _doj;
  final String? _empBadgeNo;
  final String? _extendedProbationEndDate;
  final String? _extensionPeriod;
  final bool? _gmApproved;
  final String? _gmDate;
  final String? _hrDate;
  final String? _hrName;
  final String? _initiative;
  final bool? _managerApproved;
  final String? _managerDate;
  final String? _managerName;
  final String? _name;
  final String? _pace;
  final String? _position;
  final String? _probationEnd;
  final String? _quality;
  final String? _recommendation;
  final String? _responsibility;
  final bool? _supervisorApproved;
  final String? _supervisorDate;
  final String? _supervisorName;
  final String? _teamwork;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProbFormModelIdentifier get modelIdentifier {
      return ProbFormModelIdentifier(
        id: id
      );
  }
  
  String? get empID {
    return _empID;
  }
  
  String? get adaptability {
    return _adaptability;
  }
  
  String? get additionalInfo {
    return _additionalInfo;
  }
  
  String? get attention {
    return _attention;
  }
  
  String? get attitude {
    return _attitude;
  }
  
  String? get commitment {
    return _commitment;
  }
  
  String? get communication {
    return _communication;
  }
  
  String? get deadline {
    return _deadline;
  }
  
  String? get department {
    return _department;
  }
  
  String? get diligent {
    return _diligent;
  }
  
  String? get doj {
    return _doj;
  }
  
  String? get empBadgeNo {
    return _empBadgeNo;
  }
  
  String? get extendedProbationEndDate {
    return _extendedProbationEndDate;
  }
  
  String? get extensionPeriod {
    return _extensionPeriod;
  }
  
  bool? get gmApproved {
    return _gmApproved;
  }
  
  String? get gmDate {
    return _gmDate;
  }
  
  String? get hrDate {
    return _hrDate;
  }
  
  String? get hrName {
    return _hrName;
  }
  
  String? get initiative {
    return _initiative;
  }
  
  bool? get managerApproved {
    return _managerApproved;
  }
  
  String? get managerDate {
    return _managerDate;
  }
  
  String? get managerName {
    return _managerName;
  }
  
  String? get name {
    return _name;
  }
  
  String? get pace {
    return _pace;
  }
  
  String? get position {
    return _position;
  }
  
  String? get probationEnd {
    return _probationEnd;
  }
  
  String? get quality {
    return _quality;
  }
  
  String? get recommendation {
    return _recommendation;
  }
  
  String? get responsibility {
    return _responsibility;
  }
  
  bool? get supervisorApproved {
    return _supervisorApproved;
  }
  
  String? get supervisorDate {
    return _supervisorDate;
  }
  
  String? get supervisorName {
    return _supervisorName;
  }
  
  String? get teamwork {
    return _teamwork;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ProbForm._internal({required this.id, empID, adaptability, additionalInfo, attention, attitude, commitment, communication, deadline, department, diligent, doj, empBadgeNo, extendedProbationEndDate, extensionPeriod, gmApproved, gmDate, hrDate, hrName, initiative, managerApproved, managerDate, managerName, name, pace, position, probationEnd, quality, recommendation, responsibility, supervisorApproved, supervisorDate, supervisorName, teamwork, createdAt, updatedAt}): _empID = empID, _adaptability = adaptability, _additionalInfo = additionalInfo, _attention = attention, _attitude = attitude, _commitment = commitment, _communication = communication, _deadline = deadline, _department = department, _diligent = diligent, _doj = doj, _empBadgeNo = empBadgeNo, _extendedProbationEndDate = extendedProbationEndDate, _extensionPeriod = extensionPeriod, _gmApproved = gmApproved, _gmDate = gmDate, _hrDate = hrDate, _hrName = hrName, _initiative = initiative, _managerApproved = managerApproved, _managerDate = managerDate, _managerName = managerName, _name = name, _pace = pace, _position = position, _probationEnd = probationEnd, _quality = quality, _recommendation = recommendation, _responsibility = responsibility, _supervisorApproved = supervisorApproved, _supervisorDate = supervisorDate, _supervisorName = supervisorName, _teamwork = teamwork, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProbForm({String? id, String? empID, String? adaptability, String? additionalInfo, String? attention, String? attitude, String? commitment, String? communication, String? deadline, String? department, String? diligent, String? doj, String? empBadgeNo, String? extendedProbationEndDate, String? extensionPeriod, bool? gmApproved, String? gmDate, String? hrDate, String? hrName, String? initiative, bool? managerApproved, String? managerDate, String? managerName, String? name, String? pace, String? position, String? probationEnd, String? quality, String? recommendation, String? responsibility, bool? supervisorApproved, String? supervisorDate, String? supervisorName, String? teamwork}) {
    return ProbForm._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      adaptability: adaptability,
      additionalInfo: additionalInfo,
      attention: attention,
      attitude: attitude,
      commitment: commitment,
      communication: communication,
      deadline: deadline,
      department: department,
      diligent: diligent,
      doj: doj,
      empBadgeNo: empBadgeNo,
      extendedProbationEndDate: extendedProbationEndDate,
      extensionPeriod: extensionPeriod,
      gmApproved: gmApproved,
      gmDate: gmDate,
      hrDate: hrDate,
      hrName: hrName,
      initiative: initiative,
      managerApproved: managerApproved,
      managerDate: managerDate,
      managerName: managerName,
      name: name,
      pace: pace,
      position: position,
      probationEnd: probationEnd,
      quality: quality,
      recommendation: recommendation,
      responsibility: responsibility,
      supervisorApproved: supervisorApproved,
      supervisorDate: supervisorDate,
      supervisorName: supervisorName,
      teamwork: teamwork);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProbForm &&
      id == other.id &&
      _empID == other._empID &&
      _adaptability == other._adaptability &&
      _additionalInfo == other._additionalInfo &&
      _attention == other._attention &&
      _attitude == other._attitude &&
      _commitment == other._commitment &&
      _communication == other._communication &&
      _deadline == other._deadline &&
      _department == other._department &&
      _diligent == other._diligent &&
      _doj == other._doj &&
      _empBadgeNo == other._empBadgeNo &&
      _extendedProbationEndDate == other._extendedProbationEndDate &&
      _extensionPeriod == other._extensionPeriod &&
      _gmApproved == other._gmApproved &&
      _gmDate == other._gmDate &&
      _hrDate == other._hrDate &&
      _hrName == other._hrName &&
      _initiative == other._initiative &&
      _managerApproved == other._managerApproved &&
      _managerDate == other._managerDate &&
      _managerName == other._managerName &&
      _name == other._name &&
      _pace == other._pace &&
      _position == other._position &&
      _probationEnd == other._probationEnd &&
      _quality == other._quality &&
      _recommendation == other._recommendation &&
      _responsibility == other._responsibility &&
      _supervisorApproved == other._supervisorApproved &&
      _supervisorDate == other._supervisorDate &&
      _supervisorName == other._supervisorName &&
      _teamwork == other._teamwork;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProbForm {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("adaptability=" + "$_adaptability" + ", ");
    buffer.write("additionalInfo=" + "$_additionalInfo" + ", ");
    buffer.write("attention=" + "$_attention" + ", ");
    buffer.write("attitude=" + "$_attitude" + ", ");
    buffer.write("commitment=" + "$_commitment" + ", ");
    buffer.write("communication=" + "$_communication" + ", ");
    buffer.write("deadline=" + "$_deadline" + ", ");
    buffer.write("department=" + "$_department" + ", ");
    buffer.write("diligent=" + "$_diligent" + ", ");
    buffer.write("doj=" + "$_doj" + ", ");
    buffer.write("empBadgeNo=" + "$_empBadgeNo" + ", ");
    buffer.write("extendedProbationEndDate=" + "$_extendedProbationEndDate" + ", ");
    buffer.write("extensionPeriod=" + "$_extensionPeriod" + ", ");
    buffer.write("gmApproved=" + (_gmApproved != null ? _gmApproved!.toString() : "null") + ", ");
    buffer.write("gmDate=" + "$_gmDate" + ", ");
    buffer.write("hrDate=" + "$_hrDate" + ", ");
    buffer.write("hrName=" + "$_hrName" + ", ");
    buffer.write("initiative=" + "$_initiative" + ", ");
    buffer.write("managerApproved=" + (_managerApproved != null ? _managerApproved!.toString() : "null") + ", ");
    buffer.write("managerDate=" + "$_managerDate" + ", ");
    buffer.write("managerName=" + "$_managerName" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("pace=" + "$_pace" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("probationEnd=" + "$_probationEnd" + ", ");
    buffer.write("quality=" + "$_quality" + ", ");
    buffer.write("recommendation=" + "$_recommendation" + ", ");
    buffer.write("responsibility=" + "$_responsibility" + ", ");
    buffer.write("supervisorApproved=" + (_supervisorApproved != null ? _supervisorApproved!.toString() : "null") + ", ");
    buffer.write("supervisorDate=" + "$_supervisorDate" + ", ");
    buffer.write("supervisorName=" + "$_supervisorName" + ", ");
    buffer.write("teamwork=" + "$_teamwork" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProbForm copyWith({String? empID, String? adaptability, String? additionalInfo, String? attention, String? attitude, String? commitment, String? communication, String? deadline, String? department, String? diligent, String? doj, String? empBadgeNo, String? extendedProbationEndDate, String? extensionPeriod, bool? gmApproved, String? gmDate, String? hrDate, String? hrName, String? initiative, bool? managerApproved, String? managerDate, String? managerName, String? name, String? pace, String? position, String? probationEnd, String? quality, String? recommendation, String? responsibility, bool? supervisorApproved, String? supervisorDate, String? supervisorName, String? teamwork}) {
    return ProbForm._internal(
      id: id,
      empID: empID ?? this.empID,
      adaptability: adaptability ?? this.adaptability,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      attention: attention ?? this.attention,
      attitude: attitude ?? this.attitude,
      commitment: commitment ?? this.commitment,
      communication: communication ?? this.communication,
      deadline: deadline ?? this.deadline,
      department: department ?? this.department,
      diligent: diligent ?? this.diligent,
      doj: doj ?? this.doj,
      empBadgeNo: empBadgeNo ?? this.empBadgeNo,
      extendedProbationEndDate: extendedProbationEndDate ?? this.extendedProbationEndDate,
      extensionPeriod: extensionPeriod ?? this.extensionPeriod,
      gmApproved: gmApproved ?? this.gmApproved,
      gmDate: gmDate ?? this.gmDate,
      hrDate: hrDate ?? this.hrDate,
      hrName: hrName ?? this.hrName,
      initiative: initiative ?? this.initiative,
      managerApproved: managerApproved ?? this.managerApproved,
      managerDate: managerDate ?? this.managerDate,
      managerName: managerName ?? this.managerName,
      name: name ?? this.name,
      pace: pace ?? this.pace,
      position: position ?? this.position,
      probationEnd: probationEnd ?? this.probationEnd,
      quality: quality ?? this.quality,
      recommendation: recommendation ?? this.recommendation,
      responsibility: responsibility ?? this.responsibility,
      supervisorApproved: supervisorApproved ?? this.supervisorApproved,
      supervisorDate: supervisorDate ?? this.supervisorDate,
      supervisorName: supervisorName ?? this.supervisorName,
      teamwork: teamwork ?? this.teamwork);
  }
  
  ProbForm copyWithModelFieldValues({
    ModelFieldValue<String?>? empID,
    ModelFieldValue<String?>? adaptability,
    ModelFieldValue<String?>? additionalInfo,
    ModelFieldValue<String?>? attention,
    ModelFieldValue<String?>? attitude,
    ModelFieldValue<String?>? commitment,
    ModelFieldValue<String?>? communication,
    ModelFieldValue<String?>? deadline,
    ModelFieldValue<String?>? department,
    ModelFieldValue<String?>? diligent,
    ModelFieldValue<String?>? doj,
    ModelFieldValue<String?>? empBadgeNo,
    ModelFieldValue<String?>? extendedProbationEndDate,
    ModelFieldValue<String?>? extensionPeriod,
    ModelFieldValue<bool?>? gmApproved,
    ModelFieldValue<String?>? gmDate,
    ModelFieldValue<String?>? hrDate,
    ModelFieldValue<String?>? hrName,
    ModelFieldValue<String?>? initiative,
    ModelFieldValue<bool?>? managerApproved,
    ModelFieldValue<String?>? managerDate,
    ModelFieldValue<String?>? managerName,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? pace,
    ModelFieldValue<String?>? position,
    ModelFieldValue<String?>? probationEnd,
    ModelFieldValue<String?>? quality,
    ModelFieldValue<String?>? recommendation,
    ModelFieldValue<String?>? responsibility,
    ModelFieldValue<bool?>? supervisorApproved,
    ModelFieldValue<String?>? supervisorDate,
    ModelFieldValue<String?>? supervisorName,
    ModelFieldValue<String?>? teamwork
  }) {
    return ProbForm._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      adaptability: adaptability == null ? this.adaptability : adaptability.value,
      additionalInfo: additionalInfo == null ? this.additionalInfo : additionalInfo.value,
      attention: attention == null ? this.attention : attention.value,
      attitude: attitude == null ? this.attitude : attitude.value,
      commitment: commitment == null ? this.commitment : commitment.value,
      communication: communication == null ? this.communication : communication.value,
      deadline: deadline == null ? this.deadline : deadline.value,
      department: department == null ? this.department : department.value,
      diligent: diligent == null ? this.diligent : diligent.value,
      doj: doj == null ? this.doj : doj.value,
      empBadgeNo: empBadgeNo == null ? this.empBadgeNo : empBadgeNo.value,
      extendedProbationEndDate: extendedProbationEndDate == null ? this.extendedProbationEndDate : extendedProbationEndDate.value,
      extensionPeriod: extensionPeriod == null ? this.extensionPeriod : extensionPeriod.value,
      gmApproved: gmApproved == null ? this.gmApproved : gmApproved.value,
      gmDate: gmDate == null ? this.gmDate : gmDate.value,
      hrDate: hrDate == null ? this.hrDate : hrDate.value,
      hrName: hrName == null ? this.hrName : hrName.value,
      initiative: initiative == null ? this.initiative : initiative.value,
      managerApproved: managerApproved == null ? this.managerApproved : managerApproved.value,
      managerDate: managerDate == null ? this.managerDate : managerDate.value,
      managerName: managerName == null ? this.managerName : managerName.value,
      name: name == null ? this.name : name.value,
      pace: pace == null ? this.pace : pace.value,
      position: position == null ? this.position : position.value,
      probationEnd: probationEnd == null ? this.probationEnd : probationEnd.value,
      quality: quality == null ? this.quality : quality.value,
      recommendation: recommendation == null ? this.recommendation : recommendation.value,
      responsibility: responsibility == null ? this.responsibility : responsibility.value,
      supervisorApproved: supervisorApproved == null ? this.supervisorApproved : supervisorApproved.value,
      supervisorDate: supervisorDate == null ? this.supervisorDate : supervisorDate.value,
      supervisorName: supervisorName == null ? this.supervisorName : supervisorName.value,
      teamwork: teamwork == null ? this.teamwork : teamwork.value
    );
  }
  
  ProbForm.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _adaptability = json['adaptability'],
      _additionalInfo = json['additionalInfo'],
      _attention = json['attention'],
      _attitude = json['attitude'],
      _commitment = json['commitment'],
      _communication = json['communication'],
      _deadline = json['deadline'],
      _department = json['department'],
      _diligent = json['diligent'],
      _doj = json['doj'],
      _empBadgeNo = json['empBadgeNo'],
      _extendedProbationEndDate = json['extendedProbationEndDate'],
      _extensionPeriod = json['extensionPeriod'],
      _gmApproved = json['gmApproved'],
      _gmDate = json['gmDate'],
      _hrDate = json['hrDate'],
      _hrName = json['hrName'],
      _initiative = json['initiative'],
      _managerApproved = json['managerApproved'],
      _managerDate = json['managerDate'],
      _managerName = json['managerName'],
      _name = json['name'],
      _pace = json['pace'],
      _position = json['position'],
      _probationEnd = json['probationEnd'],
      _quality = json['quality'],
      _recommendation = json['recommendation'],
      _responsibility = json['responsibility'],
      _supervisorApproved = json['supervisorApproved'],
      _supervisorDate = json['supervisorDate'],
      _supervisorName = json['supervisorName'],
      _teamwork = json['teamwork'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'adaptability': _adaptability, 'additionalInfo': _additionalInfo, 'attention': _attention, 'attitude': _attitude, 'commitment': _commitment, 'communication': _communication, 'deadline': _deadline, 'department': _department, 'diligent': _diligent, 'doj': _doj, 'empBadgeNo': _empBadgeNo, 'extendedProbationEndDate': _extendedProbationEndDate, 'extensionPeriod': _extensionPeriod, 'gmApproved': _gmApproved, 'gmDate': _gmDate, 'hrDate': _hrDate, 'hrName': _hrName, 'initiative': _initiative, 'managerApproved': _managerApproved, 'managerDate': _managerDate, 'managerName': _managerName, 'name': _name, 'pace': _pace, 'position': _position, 'probationEnd': _probationEnd, 'quality': _quality, 'recommendation': _recommendation, 'responsibility': _responsibility, 'supervisorApproved': _supervisorApproved, 'supervisorDate': _supervisorDate, 'supervisorName': _supervisorName, 'teamwork': _teamwork, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'adaptability': _adaptability,
    'additionalInfo': _additionalInfo,
    'attention': _attention,
    'attitude': _attitude,
    'commitment': _commitment,
    'communication': _communication,
    'deadline': _deadline,
    'department': _department,
    'diligent': _diligent,
    'doj': _doj,
    'empBadgeNo': _empBadgeNo,
    'extendedProbationEndDate': _extendedProbationEndDate,
    'extensionPeriod': _extensionPeriod,
    'gmApproved': _gmApproved,
    'gmDate': _gmDate,
    'hrDate': _hrDate,
    'hrName': _hrName,
    'initiative': _initiative,
    'managerApproved': _managerApproved,
    'managerDate': _managerDate,
    'managerName': _managerName,
    'name': _name,
    'pace': _pace,
    'position': _position,
    'probationEnd': _probationEnd,
    'quality': _quality,
    'recommendation': _recommendation,
    'responsibility': _responsibility,
    'supervisorApproved': _supervisorApproved,
    'supervisorDate': _supervisorDate,
    'supervisorName': _supervisorName,
    'teamwork': _teamwork,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProbFormModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProbFormModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final ADAPTABILITY = amplify_core.QueryField(fieldName: "adaptability");
  static final ADDITIONALINFO = amplify_core.QueryField(fieldName: "additionalInfo");
  static final ATTENTION = amplify_core.QueryField(fieldName: "attention");
  static final ATTITUDE = amplify_core.QueryField(fieldName: "attitude");
  static final COMMITMENT = amplify_core.QueryField(fieldName: "commitment");
  static final COMMUNICATION = amplify_core.QueryField(fieldName: "communication");
  static final DEADLINE = amplify_core.QueryField(fieldName: "deadline");
  static final DEPARTMENT = amplify_core.QueryField(fieldName: "department");
  static final DILIGENT = amplify_core.QueryField(fieldName: "diligent");
  static final DOJ = amplify_core.QueryField(fieldName: "doj");
  static final EMPBADGENO = amplify_core.QueryField(fieldName: "empBadgeNo");
  static final EXTENDEDPROBATIONENDDATE = amplify_core.QueryField(fieldName: "extendedProbationEndDate");
  static final EXTENSIONPERIOD = amplify_core.QueryField(fieldName: "extensionPeriod");
  static final GMAPPROVED = amplify_core.QueryField(fieldName: "gmApproved");
  static final GMDATE = amplify_core.QueryField(fieldName: "gmDate");
  static final HRDATE = amplify_core.QueryField(fieldName: "hrDate");
  static final HRNAME = amplify_core.QueryField(fieldName: "hrName");
  static final INITIATIVE = amplify_core.QueryField(fieldName: "initiative");
  static final MANAGERAPPROVED = amplify_core.QueryField(fieldName: "managerApproved");
  static final MANAGERDATE = amplify_core.QueryField(fieldName: "managerDate");
  static final MANAGERNAME = amplify_core.QueryField(fieldName: "managerName");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final PACE = amplify_core.QueryField(fieldName: "pace");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final PROBATIONEND = amplify_core.QueryField(fieldName: "probationEnd");
  static final QUALITY = amplify_core.QueryField(fieldName: "quality");
  static final RECOMMENDATION = amplify_core.QueryField(fieldName: "recommendation");
  static final RESPONSIBILITY = amplify_core.QueryField(fieldName: "responsibility");
  static final SUPERVISORAPPROVED = amplify_core.QueryField(fieldName: "supervisorApproved");
  static final SUPERVISORDATE = amplify_core.QueryField(fieldName: "supervisorDate");
  static final SUPERVISORNAME = amplify_core.QueryField(fieldName: "supervisorName");
  static final TEAMWORK = amplify_core.QueryField(fieldName: "teamwork");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProbForm";
    modelSchemaDefinition.pluralName = "ProbForms";
    
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
      key: ProbForm.EMPID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.ADAPTABILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.ADDITIONALINFO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.ATTENTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.ATTITUDE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.COMMITMENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.COMMUNICATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.DEADLINE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.DEPARTMENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.DILIGENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.DOJ,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.EMPBADGENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.EXTENDEDPROBATIONENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.EXTENSIONPERIOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.GMAPPROVED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.GMDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.HRDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.HRNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.INITIATIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.MANAGERAPPROVED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.MANAGERDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.MANAGERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.PACE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.POSITION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.PROBATIONEND,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.QUALITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.RECOMMENDATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.RESPONSIBILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.SUPERVISORAPPROVED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.SUPERVISORDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.SUPERVISORNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProbForm.TEAMWORK,
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

class _ProbFormModelType extends amplify_core.ModelType<ProbForm> {
  const _ProbFormModelType();
  
  @override
  ProbForm fromJson(Map<String, dynamic> jsonData) {
    return ProbForm.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProbForm';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProbForm] in your schema.
 */
class ProbFormModelIdentifier implements amplify_core.ModelIdentifier<ProbForm> {
  final String id;

  /** Create an instance of ProbFormModelIdentifier using [id] the primary key. */
  const ProbFormModelIdentifier({
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
  String toString() => 'ProbFormModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProbFormModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}