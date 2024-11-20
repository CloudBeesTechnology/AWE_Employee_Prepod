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


/** This is an auto generated class representing the EmpWorkInfo type in your schema. */
class EmpWorkInfo extends amplify_core.Model {
  static const classType = const _EmpWorkInfoModelType();
  final String id;
  final String? _empID;
  final List<String>? _contractStart;
  final List<String>? _contractEnd;
  final List<String>? _contractPeriod;
  final String? _doj;
  final List<String>? _department;
  final List<String>? _hr;
  final List<String>? _jobCat;
  final List<String>? _jobDesc;
  final List<String>? _manager;
  final List<String>? _otherJobCat;
  final List<String>? _otherDepartment;
  final List<String>? _otherPosition;
  final String? _probationStart;
  final String? _probationEnd;
  final List<String>? _position;
  final List<String>? _relationship;
  final List<String>? _supervisor;
  final String? _skillPool;
  final List<String>? _salaryType;
  final String? _sapNo;
  final List<String>? _upgradeDate;
  final List<String>? _upgradePosition;
  final List<String>? _workStatus;
  final List<String>? _workHrs;
  final List<String>? _workWeek;
  final List<String>? _workMonth;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmpWorkInfoModelIdentifier get modelIdentifier {
      return EmpWorkInfoModelIdentifier(
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
  
  List<String>? get contractStart {
    return _contractStart;
  }
  
  List<String>? get contractEnd {
    return _contractEnd;
  }
  
  List<String>? get contractPeriod {
    return _contractPeriod;
  }
  
  String get doj {
    try {
      return _doj!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get department {
    return _department;
  }
  
  List<String>? get hr {
    return _hr;
  }
  
  List<String>? get jobCat {
    return _jobCat;
  }
  
  List<String>? get jobDesc {
    return _jobDesc;
  }
  
  List<String>? get manager {
    return _manager;
  }
  
  List<String>? get otherJobCat {
    return _otherJobCat;
  }
  
  List<String>? get otherDepartment {
    return _otherDepartment;
  }
  
  List<String>? get otherPosition {
    return _otherPosition;
  }
  
  String? get probationStart {
    return _probationStart;
  }
  
  String? get probationEnd {
    return _probationEnd;
  }
  
  List<String>? get position {
    return _position;
  }
  
  List<String>? get relationship {
    return _relationship;
  }
  
  List<String>? get supervisor {
    return _supervisor;
  }
  
  String get skillPool {
    try {
      return _skillPool!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get salaryType {
    return _salaryType;
  }
  
  String get sapNo {
    try {
      return _sapNo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get upgradeDate {
    return _upgradeDate;
  }
  
  List<String>? get upgradePosition {
    return _upgradePosition;
  }
  
  List<String>? get workStatus {
    return _workStatus;
  }
  
  List<String>? get workHrs {
    return _workHrs;
  }
  
  List<String>? get workWeek {
    return _workWeek;
  }
  
  List<String>? get workMonth {
    return _workMonth;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EmpWorkInfo._internal({required this.id, required empID, contractStart, contractEnd, contractPeriod, required doj, department, hr, jobCat, jobDesc, manager, otherJobCat, otherDepartment, otherPosition, probationStart, probationEnd, position, relationship, supervisor, required skillPool, salaryType, required sapNo, upgradeDate, upgradePosition, workStatus, workHrs, workWeek, workMonth, createdAt, updatedAt}): _empID = empID, _contractStart = contractStart, _contractEnd = contractEnd, _contractPeriod = contractPeriod, _doj = doj, _department = department, _hr = hr, _jobCat = jobCat, _jobDesc = jobDesc, _manager = manager, _otherJobCat = otherJobCat, _otherDepartment = otherDepartment, _otherPosition = otherPosition, _probationStart = probationStart, _probationEnd = probationEnd, _position = position, _relationship = relationship, _supervisor = supervisor, _skillPool = skillPool, _salaryType = salaryType, _sapNo = sapNo, _upgradeDate = upgradeDate, _upgradePosition = upgradePosition, _workStatus = workStatus, _workHrs = workHrs, _workWeek = workWeek, _workMonth = workMonth, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmpWorkInfo({String? id, required String empID, List<String>? contractStart, List<String>? contractEnd, List<String>? contractPeriod, required String doj, List<String>? department, List<String>? hr, List<String>? jobCat, List<String>? jobDesc, List<String>? manager, List<String>? otherJobCat, List<String>? otherDepartment, List<String>? otherPosition, String? probationStart, String? probationEnd, List<String>? position, List<String>? relationship, List<String>? supervisor, required String skillPool, List<String>? salaryType, required String sapNo, List<String>? upgradeDate, List<String>? upgradePosition, List<String>? workStatus, List<String>? workHrs, List<String>? workWeek, List<String>? workMonth}) {
    return EmpWorkInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      contractStart: contractStart != null ? List<String>.unmodifiable(contractStart) : contractStart,
      contractEnd: contractEnd != null ? List<String>.unmodifiable(contractEnd) : contractEnd,
      contractPeriod: contractPeriod != null ? List<String>.unmodifiable(contractPeriod) : contractPeriod,
      doj: doj,
      department: department != null ? List<String>.unmodifiable(department) : department,
      hr: hr != null ? List<String>.unmodifiable(hr) : hr,
      jobCat: jobCat != null ? List<String>.unmodifiable(jobCat) : jobCat,
      jobDesc: jobDesc != null ? List<String>.unmodifiable(jobDesc) : jobDesc,
      manager: manager != null ? List<String>.unmodifiable(manager) : manager,
      otherJobCat: otherJobCat != null ? List<String>.unmodifiable(otherJobCat) : otherJobCat,
      otherDepartment: otherDepartment != null ? List<String>.unmodifiable(otherDepartment) : otherDepartment,
      otherPosition: otherPosition != null ? List<String>.unmodifiable(otherPosition) : otherPosition,
      probationStart: probationStart,
      probationEnd: probationEnd,
      position: position != null ? List<String>.unmodifiable(position) : position,
      relationship: relationship != null ? List<String>.unmodifiable(relationship) : relationship,
      supervisor: supervisor != null ? List<String>.unmodifiable(supervisor) : supervisor,
      skillPool: skillPool,
      salaryType: salaryType != null ? List<String>.unmodifiable(salaryType) : salaryType,
      sapNo: sapNo,
      upgradeDate: upgradeDate != null ? List<String>.unmodifiable(upgradeDate) : upgradeDate,
      upgradePosition: upgradePosition != null ? List<String>.unmodifiable(upgradePosition) : upgradePosition,
      workStatus: workStatus != null ? List<String>.unmodifiable(workStatus) : workStatus,
      workHrs: workHrs != null ? List<String>.unmodifiable(workHrs) : workHrs,
      workWeek: workWeek != null ? List<String>.unmodifiable(workWeek) : workWeek,
      workMonth: workMonth != null ? List<String>.unmodifiable(workMonth) : workMonth);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmpWorkInfo &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_contractStart, other._contractStart) &&
      DeepCollectionEquality().equals(_contractEnd, other._contractEnd) &&
      DeepCollectionEquality().equals(_contractPeriod, other._contractPeriod) &&
      _doj == other._doj &&
      DeepCollectionEquality().equals(_department, other._department) &&
      DeepCollectionEquality().equals(_hr, other._hr) &&
      DeepCollectionEquality().equals(_jobCat, other._jobCat) &&
      DeepCollectionEquality().equals(_jobDesc, other._jobDesc) &&
      DeepCollectionEquality().equals(_manager, other._manager) &&
      DeepCollectionEquality().equals(_otherJobCat, other._otherJobCat) &&
      DeepCollectionEquality().equals(_otherDepartment, other._otherDepartment) &&
      DeepCollectionEquality().equals(_otherPosition, other._otherPosition) &&
      _probationStart == other._probationStart &&
      _probationEnd == other._probationEnd &&
      DeepCollectionEquality().equals(_position, other._position) &&
      DeepCollectionEquality().equals(_relationship, other._relationship) &&
      DeepCollectionEquality().equals(_supervisor, other._supervisor) &&
      _skillPool == other._skillPool &&
      DeepCollectionEquality().equals(_salaryType, other._salaryType) &&
      _sapNo == other._sapNo &&
      DeepCollectionEquality().equals(_upgradeDate, other._upgradeDate) &&
      DeepCollectionEquality().equals(_upgradePosition, other._upgradePosition) &&
      DeepCollectionEquality().equals(_workStatus, other._workStatus) &&
      DeepCollectionEquality().equals(_workHrs, other._workHrs) &&
      DeepCollectionEquality().equals(_workWeek, other._workWeek) &&
      DeepCollectionEquality().equals(_workMonth, other._workMonth);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmpWorkInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("contractStart=" + (_contractStart != null ? _contractStart!.toString() : "null") + ", ");
    buffer.write("contractEnd=" + (_contractEnd != null ? _contractEnd!.toString() : "null") + ", ");
    buffer.write("contractPeriod=" + (_contractPeriod != null ? _contractPeriod!.toString() : "null") + ", ");
    buffer.write("doj=" + "$_doj" + ", ");
    buffer.write("department=" + (_department != null ? _department!.toString() : "null") + ", ");
    buffer.write("hr=" + (_hr != null ? _hr!.toString() : "null") + ", ");
    buffer.write("jobCat=" + (_jobCat != null ? _jobCat!.toString() : "null") + ", ");
    buffer.write("jobDesc=" + (_jobDesc != null ? _jobDesc!.toString() : "null") + ", ");
    buffer.write("manager=" + (_manager != null ? _manager!.toString() : "null") + ", ");
    buffer.write("otherJobCat=" + (_otherJobCat != null ? _otherJobCat!.toString() : "null") + ", ");
    buffer.write("otherDepartment=" + (_otherDepartment != null ? _otherDepartment!.toString() : "null") + ", ");
    buffer.write("otherPosition=" + (_otherPosition != null ? _otherPosition!.toString() : "null") + ", ");
    buffer.write("probationStart=" + "$_probationStart" + ", ");
    buffer.write("probationEnd=" + "$_probationEnd" + ", ");
    buffer.write("position=" + (_position != null ? _position!.toString() : "null") + ", ");
    buffer.write("relationship=" + (_relationship != null ? _relationship!.toString() : "null") + ", ");
    buffer.write("supervisor=" + (_supervisor != null ? _supervisor!.toString() : "null") + ", ");
    buffer.write("skillPool=" + "$_skillPool" + ", ");
    buffer.write("salaryType=" + (_salaryType != null ? _salaryType!.toString() : "null") + ", ");
    buffer.write("sapNo=" + "$_sapNo" + ", ");
    buffer.write("upgradeDate=" + (_upgradeDate != null ? _upgradeDate!.toString() : "null") + ", ");
    buffer.write("upgradePosition=" + (_upgradePosition != null ? _upgradePosition!.toString() : "null") + ", ");
    buffer.write("workStatus=" + (_workStatus != null ? _workStatus!.toString() : "null") + ", ");
    buffer.write("workHrs=" + (_workHrs != null ? _workHrs!.toString() : "null") + ", ");
    buffer.write("workWeek=" + (_workWeek != null ? _workWeek!.toString() : "null") + ", ");
    buffer.write("workMonth=" + (_workMonth != null ? _workMonth!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmpWorkInfo copyWith({String? empID, List<String>? contractStart, List<String>? contractEnd, List<String>? contractPeriod, String? doj, List<String>? department, List<String>? hr, List<String>? jobCat, List<String>? jobDesc, List<String>? manager, List<String>? otherJobCat, List<String>? otherDepartment, List<String>? otherPosition, String? probationStart, String? probationEnd, List<String>? position, List<String>? relationship, List<String>? supervisor, String? skillPool, List<String>? salaryType, String? sapNo, List<String>? upgradeDate, List<String>? upgradePosition, List<String>? workStatus, List<String>? workHrs, List<String>? workWeek, List<String>? workMonth}) {
    return EmpWorkInfo._internal(
      id: id,
      empID: empID ?? this.empID,
      contractStart: contractStart ?? this.contractStart,
      contractEnd: contractEnd ?? this.contractEnd,
      contractPeriod: contractPeriod ?? this.contractPeriod,
      doj: doj ?? this.doj,
      department: department ?? this.department,
      hr: hr ?? this.hr,
      jobCat: jobCat ?? this.jobCat,
      jobDesc: jobDesc ?? this.jobDesc,
      manager: manager ?? this.manager,
      otherJobCat: otherJobCat ?? this.otherJobCat,
      otherDepartment: otherDepartment ?? this.otherDepartment,
      otherPosition: otherPosition ?? this.otherPosition,
      probationStart: probationStart ?? this.probationStart,
      probationEnd: probationEnd ?? this.probationEnd,
      position: position ?? this.position,
      relationship: relationship ?? this.relationship,
      supervisor: supervisor ?? this.supervisor,
      skillPool: skillPool ?? this.skillPool,
      salaryType: salaryType ?? this.salaryType,
      sapNo: sapNo ?? this.sapNo,
      upgradeDate: upgradeDate ?? this.upgradeDate,
      upgradePosition: upgradePosition ?? this.upgradePosition,
      workStatus: workStatus ?? this.workStatus,
      workHrs: workHrs ?? this.workHrs,
      workWeek: workWeek ?? this.workWeek,
      workMonth: workMonth ?? this.workMonth);
  }
  
  EmpWorkInfo copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>>? contractStart,
    ModelFieldValue<List<String>>? contractEnd,
    ModelFieldValue<List<String>?>? contractPeriod,
    ModelFieldValue<String>? doj,
    ModelFieldValue<List<String>>? department,
    ModelFieldValue<List<String>?>? hr,
    ModelFieldValue<List<String>>? jobCat,
    ModelFieldValue<List<String>>? jobDesc,
    ModelFieldValue<List<String>>? manager,
    ModelFieldValue<List<String>?>? otherJobCat,
    ModelFieldValue<List<String>?>? otherDepartment,
    ModelFieldValue<List<String>?>? otherPosition,
    ModelFieldValue<String?>? probationStart,
    ModelFieldValue<String?>? probationEnd,
    ModelFieldValue<List<String>>? position,
    ModelFieldValue<List<String>>? relationship,
    ModelFieldValue<List<String>?>? supervisor,
    ModelFieldValue<String>? skillPool,
    ModelFieldValue<List<String>>? salaryType,
    ModelFieldValue<String>? sapNo,
    ModelFieldValue<List<String>?>? upgradeDate,
    ModelFieldValue<List<String>?>? upgradePosition,
    ModelFieldValue<List<String>>? workStatus,
    ModelFieldValue<List<String>>? workHrs,
    ModelFieldValue<List<String>>? workWeek,
    ModelFieldValue<List<String>>? workMonth
  }) {
    return EmpWorkInfo._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      contractStart: contractStart == null ? this.contractStart : contractStart.value,
      contractEnd: contractEnd == null ? this.contractEnd : contractEnd.value,
      contractPeriod: contractPeriod == null ? this.contractPeriod : contractPeriod.value,
      doj: doj == null ? this.doj : doj.value,
      department: department == null ? this.department : department.value,
      hr: hr == null ? this.hr : hr.value,
      jobCat: jobCat == null ? this.jobCat : jobCat.value,
      jobDesc: jobDesc == null ? this.jobDesc : jobDesc.value,
      manager: manager == null ? this.manager : manager.value,
      otherJobCat: otherJobCat == null ? this.otherJobCat : otherJobCat.value,
      otherDepartment: otherDepartment == null ? this.otherDepartment : otherDepartment.value,
      otherPosition: otherPosition == null ? this.otherPosition : otherPosition.value,
      probationStart: probationStart == null ? this.probationStart : probationStart.value,
      probationEnd: probationEnd == null ? this.probationEnd : probationEnd.value,
      position: position == null ? this.position : position.value,
      relationship: relationship == null ? this.relationship : relationship.value,
      supervisor: supervisor == null ? this.supervisor : supervisor.value,
      skillPool: skillPool == null ? this.skillPool : skillPool.value,
      salaryType: salaryType == null ? this.salaryType : salaryType.value,
      sapNo: sapNo == null ? this.sapNo : sapNo.value,
      upgradeDate: upgradeDate == null ? this.upgradeDate : upgradeDate.value,
      upgradePosition: upgradePosition == null ? this.upgradePosition : upgradePosition.value,
      workStatus: workStatus == null ? this.workStatus : workStatus.value,
      workHrs: workHrs == null ? this.workHrs : workHrs.value,
      workWeek: workWeek == null ? this.workWeek : workWeek.value,
      workMonth: workMonth == null ? this.workMonth : workMonth.value
    );
  }
  
  EmpWorkInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _contractStart = json['contractStart']?.cast<String>(),
      _contractEnd = json['contractEnd']?.cast<String>(),
      _contractPeriod = json['contractPeriod']?.cast<String>(),
      _doj = json['doj'],
      _department = json['department']?.cast<String>(),
      _hr = json['hr']?.cast<String>(),
      _jobCat = json['jobCat']?.cast<String>(),
      _jobDesc = json['jobDesc']?.cast<String>(),
      _manager = json['manager']?.cast<String>(),
      _otherJobCat = json['otherJobCat']?.cast<String>(),
      _otherDepartment = json['otherDepartment']?.cast<String>(),
      _otherPosition = json['otherPosition']?.cast<String>(),
      _probationStart = json['probationStart'],
      _probationEnd = json['probationEnd'],
      _position = json['position']?.cast<String>(),
      _relationship = json['relationship']?.cast<String>(),
      _supervisor = json['supervisor']?.cast<String>(),
      _skillPool = json['skillPool'],
      _salaryType = json['salaryType']?.cast<String>(),
      _sapNo = json['sapNo'],
      _upgradeDate = json['upgradeDate']?.cast<String>(),
      _upgradePosition = json['upgradePosition']?.cast<String>(),
      _workStatus = json['workStatus']?.cast<String>(),
      _workHrs = json['workHrs']?.cast<String>(),
      _workWeek = json['workWeek']?.cast<String>(),
      _workMonth = json['workMonth']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'contractStart': _contractStart, 'contractEnd': _contractEnd, 'contractPeriod': _contractPeriod, 'doj': _doj, 'department': _department, 'hr': _hr, 'jobCat': _jobCat, 'jobDesc': _jobDesc, 'manager': _manager, 'otherJobCat': _otherJobCat, 'otherDepartment': _otherDepartment, 'otherPosition': _otherPosition, 'probationStart': _probationStart, 'probationEnd': _probationEnd, 'position': _position, 'relationship': _relationship, 'supervisor': _supervisor, 'skillPool': _skillPool, 'salaryType': _salaryType, 'sapNo': _sapNo, 'upgradeDate': _upgradeDate, 'upgradePosition': _upgradePosition, 'workStatus': _workStatus, 'workHrs': _workHrs, 'workWeek': _workWeek, 'workMonth': _workMonth, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'contractStart': _contractStart,
    'contractEnd': _contractEnd,
    'contractPeriod': _contractPeriod,
    'doj': _doj,
    'department': _department,
    'hr': _hr,
    'jobCat': _jobCat,
    'jobDesc': _jobDesc,
    'manager': _manager,
    'otherJobCat': _otherJobCat,
    'otherDepartment': _otherDepartment,
    'otherPosition': _otherPosition,
    'probationStart': _probationStart,
    'probationEnd': _probationEnd,
    'position': _position,
    'relationship': _relationship,
    'supervisor': _supervisor,
    'skillPool': _skillPool,
    'salaryType': _salaryType,
    'sapNo': _sapNo,
    'upgradeDate': _upgradeDate,
    'upgradePosition': _upgradePosition,
    'workStatus': _workStatus,
    'workHrs': _workHrs,
    'workWeek': _workWeek,
    'workMonth': _workMonth,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmpWorkInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmpWorkInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final CONTRACTSTART = amplify_core.QueryField(fieldName: "contractStart");
  static final CONTRACTEND = amplify_core.QueryField(fieldName: "contractEnd");
  static final CONTRACTPERIOD = amplify_core.QueryField(fieldName: "contractPeriod");
  static final DOJ = amplify_core.QueryField(fieldName: "doj");
  static final DEPARTMENT = amplify_core.QueryField(fieldName: "department");
  static final HR = amplify_core.QueryField(fieldName: "hr");
  static final JOBCAT = amplify_core.QueryField(fieldName: "jobCat");
  static final JOBDESC = amplify_core.QueryField(fieldName: "jobDesc");
  static final MANAGER = amplify_core.QueryField(fieldName: "manager");
  static final OTHERJOBCAT = amplify_core.QueryField(fieldName: "otherJobCat");
  static final OTHERDEPARTMENT = amplify_core.QueryField(fieldName: "otherDepartment");
  static final OTHERPOSITION = amplify_core.QueryField(fieldName: "otherPosition");
  static final PROBATIONSTART = amplify_core.QueryField(fieldName: "probationStart");
  static final PROBATIONEND = amplify_core.QueryField(fieldName: "probationEnd");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final RELATIONSHIP = amplify_core.QueryField(fieldName: "relationship");
  static final SUPERVISOR = amplify_core.QueryField(fieldName: "supervisor");
  static final SKILLPOOL = amplify_core.QueryField(fieldName: "skillPool");
  static final SALARYTYPE = amplify_core.QueryField(fieldName: "salaryType");
  static final SAPNO = amplify_core.QueryField(fieldName: "sapNo");
  static final UPGRADEDATE = amplify_core.QueryField(fieldName: "upgradeDate");
  static final UPGRADEPOSITION = amplify_core.QueryField(fieldName: "upgradePosition");
  static final WORKSTATUS = amplify_core.QueryField(fieldName: "workStatus");
  static final WORKHRS = amplify_core.QueryField(fieldName: "workHrs");
  static final WORKWEEK = amplify_core.QueryField(fieldName: "workWeek");
  static final WORKMONTH = amplify_core.QueryField(fieldName: "workMonth");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmpWorkInfo";
    modelSchemaDefinition.pluralName = "EmpWorkInfos";
    
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
      key: EmpWorkInfo.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.CONTRACTSTART,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.CONTRACTEND,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.CONTRACTPERIOD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.DOJ,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.DEPARTMENT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.HR,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.JOBCAT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.JOBDESC,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.MANAGER,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.OTHERJOBCAT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.OTHERDEPARTMENT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.OTHERPOSITION,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.PROBATIONSTART,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.PROBATIONEND,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.POSITION,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.RELATIONSHIP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.SUPERVISOR,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.SKILLPOOL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.SALARYTYPE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.SAPNO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.UPGRADEDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.UPGRADEPOSITION,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.WORKSTATUS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.WORKHRS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.WORKWEEK,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpWorkInfo.WORKMONTH,
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

class _EmpWorkInfoModelType extends amplify_core.ModelType<EmpWorkInfo> {
  const _EmpWorkInfoModelType();
  
  @override
  EmpWorkInfo fromJson(Map<String, dynamic> jsonData) {
    return EmpWorkInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmpWorkInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmpWorkInfo] in your schema.
 */
class EmpWorkInfoModelIdentifier implements amplify_core.ModelIdentifier<EmpWorkInfo> {
  final String id;

  /** Create an instance of EmpWorkInfoModelIdentifier using [id] the primary key. */
  const EmpWorkInfoModelIdentifier({
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
  String toString() => 'EmpWorkInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmpWorkInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}