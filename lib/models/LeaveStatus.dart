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


/** This is an auto generated class representing the LeaveStatus type in your schema. */
class LeaveStatus extends amplify_core.Model {
  static const classType = const _LeaveStatusModelType();
  final String id;
  final String? _empID;
  final String? _leaveType;
  final amplify_core.TemporalDateTime? _fromDate;
  final amplify_core.TemporalDateTime? _toDate;
  final double? _days;
  final List<String>? _applyTo;
  final String? _reason;
  final String? _medicalCertificate;
  final String? _supervisorName;
  final String? _supervisorStatus;
  final amplify_core.TemporalDateTime? _supervisorDate;
  final String? _supervisorRemarks;
  final String? _managerName;
  final String? _managerStatus;
  final amplify_core.TemporalDateTime? _managerDate;
  final String? _managerRemarks;
  final String? _empStatus;
  final amplify_core.TemporalDateTime? _empDate;
  final String? _empRemarks;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LeaveStatusModelIdentifier get modelIdentifier {
      return LeaveStatusModelIdentifier(
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
  
  String get leaveType {
    try {
      return _leaveType!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get fromDate {
    try {
      return _fromDate!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get toDate {
    try {
      return _toDate!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get days {
    try {
      return _days!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get applyTo {
    return _applyTo;
  }
  
  String get reason {
    try {
      return _reason!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get medicalCertificate {
    return _medicalCertificate;
  }
  
  String? get supervisorName {
    return _supervisorName;
  }
  
  String? get supervisorStatus {
    return _supervisorStatus;
  }
  
  amplify_core.TemporalDateTime? get supervisorDate {
    return _supervisorDate;
  }
  
  String? get supervisorRemarks {
    return _supervisorRemarks;
  }
  
  String? get managerName {
    return _managerName;
  }
  
  String? get managerStatus {
    return _managerStatus;
  }
  
  amplify_core.TemporalDateTime? get managerDate {
    return _managerDate;
  }
  
  String? get managerRemarks {
    return _managerRemarks;
  }
  
  String? get empStatus {
    return _empStatus;
  }
  
  amplify_core.TemporalDateTime? get empDate {
    return _empDate;
  }
  
  String? get empRemarks {
    return _empRemarks;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LeaveStatus._internal({required this.id, required empID, required leaveType, required fromDate, required toDate, required days, applyTo, required reason, medicalCertificate, supervisorName, supervisorStatus, supervisorDate, supervisorRemarks, managerName, managerStatus, managerDate, managerRemarks, empStatus, empDate, empRemarks, createdAt, updatedAt}): _empID = empID, _leaveType = leaveType, _fromDate = fromDate, _toDate = toDate, _days = days, _applyTo = applyTo, _reason = reason, _medicalCertificate = medicalCertificate, _supervisorName = supervisorName, _supervisorStatus = supervisorStatus, _supervisorDate = supervisorDate, _supervisorRemarks = supervisorRemarks, _managerName = managerName, _managerStatus = managerStatus, _managerDate = managerDate, _managerRemarks = managerRemarks, _empStatus = empStatus, _empDate = empDate, _empRemarks = empRemarks, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LeaveStatus({String? id, required String empID, required String leaveType, required amplify_core.TemporalDateTime fromDate, required amplify_core.TemporalDateTime toDate, required double days, List<String>? applyTo, required String reason, String? medicalCertificate, String? supervisorName, String? supervisorStatus, amplify_core.TemporalDateTime? supervisorDate, String? supervisorRemarks, String? managerName, String? managerStatus, amplify_core.TemporalDateTime? managerDate, String? managerRemarks, String? empStatus, amplify_core.TemporalDateTime? empDate, String? empRemarks}) {
    return LeaveStatus._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      leaveType: leaveType,
      fromDate: fromDate,
      toDate: toDate,
      days: days,
      applyTo: applyTo != null ? List<String>.unmodifiable(applyTo) : applyTo,
      reason: reason,
      medicalCertificate: medicalCertificate,
      supervisorName: supervisorName,
      supervisorStatus: supervisorStatus,
      supervisorDate: supervisorDate,
      supervisorRemarks: supervisorRemarks,
      managerName: managerName,
      managerStatus: managerStatus,
      managerDate: managerDate,
      managerRemarks: managerRemarks,
      empStatus: empStatus,
      empDate: empDate,
      empRemarks: empRemarks);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeaveStatus &&
      id == other.id &&
      _empID == other._empID &&
      _leaveType == other._leaveType &&
      _fromDate == other._fromDate &&
      _toDate == other._toDate &&
      _days == other._days &&
      DeepCollectionEquality().equals(_applyTo, other._applyTo) &&
      _reason == other._reason &&
      _medicalCertificate == other._medicalCertificate &&
      _supervisorName == other._supervisorName &&
      _supervisorStatus == other._supervisorStatus &&
      _supervisorDate == other._supervisorDate &&
      _supervisorRemarks == other._supervisorRemarks &&
      _managerName == other._managerName &&
      _managerStatus == other._managerStatus &&
      _managerDate == other._managerDate &&
      _managerRemarks == other._managerRemarks &&
      _empStatus == other._empStatus &&
      _empDate == other._empDate &&
      _empRemarks == other._empRemarks;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LeaveStatus {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("leaveType=" + "$_leaveType" + ", ");
    buffer.write("fromDate=" + (_fromDate != null ? _fromDate!.format() : "null") + ", ");
    buffer.write("toDate=" + (_toDate != null ? _toDate!.format() : "null") + ", ");
    buffer.write("days=" + (_days != null ? _days!.toString() : "null") + ", ");
    buffer.write("applyTo=" + (_applyTo != null ? _applyTo!.toString() : "null") + ", ");
    buffer.write("reason=" + "$_reason" + ", ");
    buffer.write("medicalCertificate=" + "$_medicalCertificate" + ", ");
    buffer.write("supervisorName=" + "$_supervisorName" + ", ");
    buffer.write("supervisorStatus=" + "$_supervisorStatus" + ", ");
    buffer.write("supervisorDate=" + (_supervisorDate != null ? _supervisorDate!.format() : "null") + ", ");
    buffer.write("supervisorRemarks=" + "$_supervisorRemarks" + ", ");
    buffer.write("managerName=" + "$_managerName" + ", ");
    buffer.write("managerStatus=" + "$_managerStatus" + ", ");
    buffer.write("managerDate=" + (_managerDate != null ? _managerDate!.format() : "null") + ", ");
    buffer.write("managerRemarks=" + "$_managerRemarks" + ", ");
    buffer.write("empStatus=" + "$_empStatus" + ", ");
    buffer.write("empDate=" + (_empDate != null ? _empDate!.format() : "null") + ", ");
    buffer.write("empRemarks=" + "$_empRemarks" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LeaveStatus copyWith({String? empID, String? leaveType, amplify_core.TemporalDateTime? fromDate, amplify_core.TemporalDateTime? toDate, double? days, List<String>? applyTo, String? reason, String? medicalCertificate, String? supervisorName, String? supervisorStatus, amplify_core.TemporalDateTime? supervisorDate, String? supervisorRemarks, String? managerName, String? managerStatus, amplify_core.TemporalDateTime? managerDate, String? managerRemarks, String? empStatus, amplify_core.TemporalDateTime? empDate, String? empRemarks}) {
    return LeaveStatus._internal(
      id: id,
      empID: empID ?? this.empID,
      leaveType: leaveType ?? this.leaveType,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      days: days ?? this.days,
      applyTo: applyTo ?? this.applyTo,
      reason: reason ?? this.reason,
      medicalCertificate: medicalCertificate ?? this.medicalCertificate,
      supervisorName: supervisorName ?? this.supervisorName,
      supervisorStatus: supervisorStatus ?? this.supervisorStatus,
      supervisorDate: supervisorDate ?? this.supervisorDate,
      supervisorRemarks: supervisorRemarks ?? this.supervisorRemarks,
      managerName: managerName ?? this.managerName,
      managerStatus: managerStatus ?? this.managerStatus,
      managerDate: managerDate ?? this.managerDate,
      managerRemarks: managerRemarks ?? this.managerRemarks,
      empStatus: empStatus ?? this.empStatus,
      empDate: empDate ?? this.empDate,
      empRemarks: empRemarks ?? this.empRemarks);
  }
  
  LeaveStatus copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String>? leaveType,
    ModelFieldValue<amplify_core.TemporalDateTime>? fromDate,
    ModelFieldValue<amplify_core.TemporalDateTime>? toDate,
    ModelFieldValue<double>? days,
    ModelFieldValue<List<String>>? applyTo,
    ModelFieldValue<String>? reason,
    ModelFieldValue<String?>? medicalCertificate,
    ModelFieldValue<String?>? supervisorName,
    ModelFieldValue<String?>? supervisorStatus,
    ModelFieldValue<amplify_core.TemporalDateTime?>? supervisorDate,
    ModelFieldValue<String?>? supervisorRemarks,
    ModelFieldValue<String?>? managerName,
    ModelFieldValue<String?>? managerStatus,
    ModelFieldValue<amplify_core.TemporalDateTime?>? managerDate,
    ModelFieldValue<String?>? managerRemarks,
    ModelFieldValue<String?>? empStatus,
    ModelFieldValue<amplify_core.TemporalDateTime?>? empDate,
    ModelFieldValue<String?>? empRemarks
  }) {
    return LeaveStatus._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      leaveType: leaveType == null ? this.leaveType : leaveType.value,
      fromDate: fromDate == null ? this.fromDate : fromDate.value,
      toDate: toDate == null ? this.toDate : toDate.value,
      days: days == null ? this.days : days.value,
      applyTo: applyTo == null ? this.applyTo : applyTo.value,
      reason: reason == null ? this.reason : reason.value,
      medicalCertificate: medicalCertificate == null ? this.medicalCertificate : medicalCertificate.value,
      supervisorName: supervisorName == null ? this.supervisorName : supervisorName.value,
      supervisorStatus: supervisorStatus == null ? this.supervisorStatus : supervisorStatus.value,
      supervisorDate: supervisorDate == null ? this.supervisorDate : supervisorDate.value,
      supervisorRemarks: supervisorRemarks == null ? this.supervisorRemarks : supervisorRemarks.value,
      managerName: managerName == null ? this.managerName : managerName.value,
      managerStatus: managerStatus == null ? this.managerStatus : managerStatus.value,
      managerDate: managerDate == null ? this.managerDate : managerDate.value,
      managerRemarks: managerRemarks == null ? this.managerRemarks : managerRemarks.value,
      empStatus: empStatus == null ? this.empStatus : empStatus.value,
      empDate: empDate == null ? this.empDate : empDate.value,
      empRemarks: empRemarks == null ? this.empRemarks : empRemarks.value
    );
  }
  
  LeaveStatus.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _leaveType = json['leaveType'],
      _fromDate = json['fromDate'] != null ? amplify_core.TemporalDateTime.fromString(json['fromDate']) : null,
      _toDate = json['toDate'] != null ? amplify_core.TemporalDateTime.fromString(json['toDate']) : null,
      _days = (json['days'] as num?)?.toDouble(),
      _applyTo = json['applyTo']?.cast<String>(),
      _reason = json['reason'],
      _medicalCertificate = json['medicalCertificate'],
      _supervisorName = json['supervisorName'],
      _supervisorStatus = json['supervisorStatus'],
      _supervisorDate = json['supervisorDate'] != null ? amplify_core.TemporalDateTime.fromString(json['supervisorDate']) : null,
      _supervisorRemarks = json['supervisorRemarks'],
      _managerName = json['managerName'],
      _managerStatus = json['managerStatus'],
      _managerDate = json['managerDate'] != null ? amplify_core.TemporalDateTime.fromString(json['managerDate']) : null,
      _managerRemarks = json['managerRemarks'],
      _empStatus = json['empStatus'],
      _empDate = json['empDate'] != null ? amplify_core.TemporalDateTime.fromString(json['empDate']) : null,
      _empRemarks = json['empRemarks'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'leaveType': _leaveType, 'fromDate': _fromDate?.format(), 'toDate': _toDate?.format(), 'days': _days, 'applyTo': _applyTo, 'reason': _reason, 'medicalCertificate': _medicalCertificate, 'supervisorName': _supervisorName, 'supervisorStatus': _supervisorStatus, 'supervisorDate': _supervisorDate?.format(), 'supervisorRemarks': _supervisorRemarks, 'managerName': _managerName, 'managerStatus': _managerStatus, 'managerDate': _managerDate?.format(), 'managerRemarks': _managerRemarks, 'empStatus': _empStatus, 'empDate': _empDate?.format(), 'empRemarks': _empRemarks, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'leaveType': _leaveType,
    'fromDate': _fromDate,
    'toDate': _toDate,
    'days': _days,
    'applyTo': _applyTo,
    'reason': _reason,
    'medicalCertificate': _medicalCertificate,
    'supervisorName': _supervisorName,
    'supervisorStatus': _supervisorStatus,
    'supervisorDate': _supervisorDate,
    'supervisorRemarks': _supervisorRemarks,
    'managerName': _managerName,
    'managerStatus': _managerStatus,
    'managerDate': _managerDate,
    'managerRemarks': _managerRemarks,
    'empStatus': _empStatus,
    'empDate': _empDate,
    'empRemarks': _empRemarks,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LeaveStatusModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LeaveStatusModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final LEAVETYPE = amplify_core.QueryField(fieldName: "leaveType");
  static final FROMDATE = amplify_core.QueryField(fieldName: "fromDate");
  static final TODATE = amplify_core.QueryField(fieldName: "toDate");
  static final DAYS = amplify_core.QueryField(fieldName: "days");
  static final APPLYTO = amplify_core.QueryField(fieldName: "applyTo");
  static final REASON = amplify_core.QueryField(fieldName: "reason");
  static final MEDICALCERTIFICATE = amplify_core.QueryField(fieldName: "medicalCertificate");
  static final SUPERVISORNAME = amplify_core.QueryField(fieldName: "supervisorName");
  static final SUPERVISORSTATUS = amplify_core.QueryField(fieldName: "supervisorStatus");
  static final SUPERVISORDATE = amplify_core.QueryField(fieldName: "supervisorDate");
  static final SUPERVISORREMARKS = amplify_core.QueryField(fieldName: "supervisorRemarks");
  static final MANAGERNAME = amplify_core.QueryField(fieldName: "managerName");
  static final MANAGERSTATUS = amplify_core.QueryField(fieldName: "managerStatus");
  static final MANAGERDATE = amplify_core.QueryField(fieldName: "managerDate");
  static final MANAGERREMARKS = amplify_core.QueryField(fieldName: "managerRemarks");
  static final EMPSTATUS = amplify_core.QueryField(fieldName: "empStatus");
  static final EMPDATE = amplify_core.QueryField(fieldName: "empDate");
  static final EMPREMARKS = amplify_core.QueryField(fieldName: "empRemarks");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LeaveStatus";
    modelSchemaDefinition.pluralName = "LeaveStatuses";
    
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
      key: LeaveStatus.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.LEAVETYPE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.FROMDATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.TODATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.DAYS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.APPLYTO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.REASON,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.MEDICALCERTIFICATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.SUPERVISORNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.SUPERVISORSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.SUPERVISORDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.SUPERVISORREMARKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.MANAGERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.MANAGERSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.MANAGERDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.MANAGERREMARKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.EMPSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.EMPDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LeaveStatus.EMPREMARKS,
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

class _LeaveStatusModelType extends amplify_core.ModelType<LeaveStatus> {
  const _LeaveStatusModelType();
  
  @override
  LeaveStatus fromJson(Map<String, dynamic> jsonData) {
    return LeaveStatus.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LeaveStatus';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LeaveStatus] in your schema.
 */
class LeaveStatusModelIdentifier implements amplify_core.ModelIdentifier<LeaveStatus> {
  final String id;

  /** Create an instance of LeaveStatusModelIdentifier using [id] the primary key. */
  const LeaveStatusModelIdentifier({
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
  String toString() => 'LeaveStatusModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LeaveStatusModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}