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


/** This is an auto generated class representing the ServiceRecord type in your schema. */
class ServiceRecord extends amplify_core.Model {
  static const classType = const _ServiceRecordModelType();
  final String id;
  final String? _empID;
  final List<String>? _depEmpDate;
  final List<String>? _depEmp;
  final List<String>? _positionRev;
  final List<String>? _positionRevDate;
  final List<String>? _revSalary;
  final List<String>? _revSalaryDate;
  final List<String>? _revLeavePass;
  final List<String>? _revLeaveDate;
  final List<String>? _revAnnualLeave;
  final List<String>? _revALD;
  final List<String>? _remarkWI;
  final List<String>? _uploadPR;
  final List<String>? _uploadSP;
  final List<String>? _uploadLP;
  final List<String>? _uploadAL;
  final List<String>? _uploadDep;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ServiceRecordModelIdentifier get modelIdentifier {
      return ServiceRecordModelIdentifier(
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
  
  List<String>? get depEmpDate {
    return _depEmpDate;
  }
  
  List<String>? get depEmp {
    return _depEmp;
  }
  
  List<String>? get positionRev {
    return _positionRev;
  }
  
  List<String>? get positionRevDate {
    return _positionRevDate;
  }
  
  List<String>? get revSalary {
    return _revSalary;
  }
  
  List<String>? get revSalaryDate {
    return _revSalaryDate;
  }
  
  List<String>? get revLeavePass {
    return _revLeavePass;
  }
  
  List<String>? get revLeaveDate {
    return _revLeaveDate;
  }
  
  List<String>? get revAnnualLeave {
    return _revAnnualLeave;
  }
  
  List<String>? get revALD {
    return _revALD;
  }
  
  List<String>? get remarkWI {
    return _remarkWI;
  }
  
  List<String>? get uploadPR {
    return _uploadPR;
  }
  
  List<String>? get uploadSP {
    return _uploadSP;
  }
  
  List<String>? get uploadLP {
    return _uploadLP;
  }
  
  List<String>? get uploadAL {
    return _uploadAL;
  }
  
  List<String>? get uploadDep {
    return _uploadDep;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ServiceRecord._internal({required this.id, required empID, depEmpDate, depEmp, positionRev, positionRevDate, revSalary, revSalaryDate, revLeavePass, revLeaveDate, revAnnualLeave, revALD, remarkWI, uploadPR, uploadSP, uploadLP, uploadAL, uploadDep, createdAt, updatedAt}): _empID = empID, _depEmpDate = depEmpDate, _depEmp = depEmp, _positionRev = positionRev, _positionRevDate = positionRevDate, _revSalary = revSalary, _revSalaryDate = revSalaryDate, _revLeavePass = revLeavePass, _revLeaveDate = revLeaveDate, _revAnnualLeave = revAnnualLeave, _revALD = revALD, _remarkWI = remarkWI, _uploadPR = uploadPR, _uploadSP = uploadSP, _uploadLP = uploadLP, _uploadAL = uploadAL, _uploadDep = uploadDep, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ServiceRecord({String? id, required String empID, List<String>? depEmpDate, List<String>? depEmp, List<String>? positionRev, List<String>? positionRevDate, List<String>? revSalary, List<String>? revSalaryDate, List<String>? revLeavePass, List<String>? revLeaveDate, List<String>? revAnnualLeave, List<String>? revALD, List<String>? remarkWI, List<String>? uploadPR, List<String>? uploadSP, List<String>? uploadLP, List<String>? uploadAL, List<String>? uploadDep}) {
    return ServiceRecord._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      depEmpDate: depEmpDate != null ? List<String>.unmodifiable(depEmpDate) : depEmpDate,
      depEmp: depEmp != null ? List<String>.unmodifiable(depEmp) : depEmp,
      positionRev: positionRev != null ? List<String>.unmodifiable(positionRev) : positionRev,
      positionRevDate: positionRevDate != null ? List<String>.unmodifiable(positionRevDate) : positionRevDate,
      revSalary: revSalary != null ? List<String>.unmodifiable(revSalary) : revSalary,
      revSalaryDate: revSalaryDate != null ? List<String>.unmodifiable(revSalaryDate) : revSalaryDate,
      revLeavePass: revLeavePass != null ? List<String>.unmodifiable(revLeavePass) : revLeavePass,
      revLeaveDate: revLeaveDate != null ? List<String>.unmodifiable(revLeaveDate) : revLeaveDate,
      revAnnualLeave: revAnnualLeave != null ? List<String>.unmodifiable(revAnnualLeave) : revAnnualLeave,
      revALD: revALD != null ? List<String>.unmodifiable(revALD) : revALD,
      remarkWI: remarkWI != null ? List<String>.unmodifiable(remarkWI) : remarkWI,
      uploadPR: uploadPR != null ? List<String>.unmodifiable(uploadPR) : uploadPR,
      uploadSP: uploadSP != null ? List<String>.unmodifiable(uploadSP) : uploadSP,
      uploadLP: uploadLP != null ? List<String>.unmodifiable(uploadLP) : uploadLP,
      uploadAL: uploadAL != null ? List<String>.unmodifiable(uploadAL) : uploadAL,
      uploadDep: uploadDep != null ? List<String>.unmodifiable(uploadDep) : uploadDep);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceRecord &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_depEmpDate, other._depEmpDate) &&
      DeepCollectionEquality().equals(_depEmp, other._depEmp) &&
      DeepCollectionEquality().equals(_positionRev, other._positionRev) &&
      DeepCollectionEquality().equals(_positionRevDate, other._positionRevDate) &&
      DeepCollectionEquality().equals(_revSalary, other._revSalary) &&
      DeepCollectionEquality().equals(_revSalaryDate, other._revSalaryDate) &&
      DeepCollectionEquality().equals(_revLeavePass, other._revLeavePass) &&
      DeepCollectionEquality().equals(_revLeaveDate, other._revLeaveDate) &&
      DeepCollectionEquality().equals(_revAnnualLeave, other._revAnnualLeave) &&
      DeepCollectionEquality().equals(_revALD, other._revALD) &&
      DeepCollectionEquality().equals(_remarkWI, other._remarkWI) &&
      DeepCollectionEquality().equals(_uploadPR, other._uploadPR) &&
      DeepCollectionEquality().equals(_uploadSP, other._uploadSP) &&
      DeepCollectionEquality().equals(_uploadLP, other._uploadLP) &&
      DeepCollectionEquality().equals(_uploadAL, other._uploadAL) &&
      DeepCollectionEquality().equals(_uploadDep, other._uploadDep);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServiceRecord {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("depEmpDate=" + (_depEmpDate != null ? _depEmpDate!.toString() : "null") + ", ");
    buffer.write("depEmp=" + (_depEmp != null ? _depEmp!.toString() : "null") + ", ");
    buffer.write("positionRev=" + (_positionRev != null ? _positionRev!.toString() : "null") + ", ");
    buffer.write("positionRevDate=" + (_positionRevDate != null ? _positionRevDate!.toString() : "null") + ", ");
    buffer.write("revSalary=" + (_revSalary != null ? _revSalary!.toString() : "null") + ", ");
    buffer.write("revSalaryDate=" + (_revSalaryDate != null ? _revSalaryDate!.toString() : "null") + ", ");
    buffer.write("revLeavePass=" + (_revLeavePass != null ? _revLeavePass!.toString() : "null") + ", ");
    buffer.write("revLeaveDate=" + (_revLeaveDate != null ? _revLeaveDate!.toString() : "null") + ", ");
    buffer.write("revAnnualLeave=" + (_revAnnualLeave != null ? _revAnnualLeave!.toString() : "null") + ", ");
    buffer.write("revALD=" + (_revALD != null ? _revALD!.toString() : "null") + ", ");
    buffer.write("remarkWI=" + (_remarkWI != null ? _remarkWI!.toString() : "null") + ", ");
    buffer.write("uploadPR=" + (_uploadPR != null ? _uploadPR!.toString() : "null") + ", ");
    buffer.write("uploadSP=" + (_uploadSP != null ? _uploadSP!.toString() : "null") + ", ");
    buffer.write("uploadLP=" + (_uploadLP != null ? _uploadLP!.toString() : "null") + ", ");
    buffer.write("uploadAL=" + (_uploadAL != null ? _uploadAL!.toString() : "null") + ", ");
    buffer.write("uploadDep=" + (_uploadDep != null ? _uploadDep!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServiceRecord copyWith({String? empID, List<String>? depEmpDate, List<String>? depEmp, List<String>? positionRev, List<String>? positionRevDate, List<String>? revSalary, List<String>? revSalaryDate, List<String>? revLeavePass, List<String>? revLeaveDate, List<String>? revAnnualLeave, List<String>? revALD, List<String>? remarkWI, List<String>? uploadPR, List<String>? uploadSP, List<String>? uploadLP, List<String>? uploadAL, List<String>? uploadDep}) {
    return ServiceRecord._internal(
      id: id,
      empID: empID ?? this.empID,
      depEmpDate: depEmpDate ?? this.depEmpDate,
      depEmp: depEmp ?? this.depEmp,
      positionRev: positionRev ?? this.positionRev,
      positionRevDate: positionRevDate ?? this.positionRevDate,
      revSalary: revSalary ?? this.revSalary,
      revSalaryDate: revSalaryDate ?? this.revSalaryDate,
      revLeavePass: revLeavePass ?? this.revLeavePass,
      revLeaveDate: revLeaveDate ?? this.revLeaveDate,
      revAnnualLeave: revAnnualLeave ?? this.revAnnualLeave,
      revALD: revALD ?? this.revALD,
      remarkWI: remarkWI ?? this.remarkWI,
      uploadPR: uploadPR ?? this.uploadPR,
      uploadSP: uploadSP ?? this.uploadSP,
      uploadLP: uploadLP ?? this.uploadLP,
      uploadAL: uploadAL ?? this.uploadAL,
      uploadDep: uploadDep ?? this.uploadDep);
  }
  
  ServiceRecord copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? depEmpDate,
    ModelFieldValue<List<String>?>? depEmp,
    ModelFieldValue<List<String>?>? positionRev,
    ModelFieldValue<List<String>?>? positionRevDate,
    ModelFieldValue<List<String>?>? revSalary,
    ModelFieldValue<List<String>?>? revSalaryDate,
    ModelFieldValue<List<String>?>? revLeavePass,
    ModelFieldValue<List<String>?>? revLeaveDate,
    ModelFieldValue<List<String>?>? revAnnualLeave,
    ModelFieldValue<List<String>?>? revALD,
    ModelFieldValue<List<String>?>? remarkWI,
    ModelFieldValue<List<String>?>? uploadPR,
    ModelFieldValue<List<String>?>? uploadSP,
    ModelFieldValue<List<String>?>? uploadLP,
    ModelFieldValue<List<String>?>? uploadAL,
    ModelFieldValue<List<String>?>? uploadDep
  }) {
    return ServiceRecord._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      depEmpDate: depEmpDate == null ? this.depEmpDate : depEmpDate.value,
      depEmp: depEmp == null ? this.depEmp : depEmp.value,
      positionRev: positionRev == null ? this.positionRev : positionRev.value,
      positionRevDate: positionRevDate == null ? this.positionRevDate : positionRevDate.value,
      revSalary: revSalary == null ? this.revSalary : revSalary.value,
      revSalaryDate: revSalaryDate == null ? this.revSalaryDate : revSalaryDate.value,
      revLeavePass: revLeavePass == null ? this.revLeavePass : revLeavePass.value,
      revLeaveDate: revLeaveDate == null ? this.revLeaveDate : revLeaveDate.value,
      revAnnualLeave: revAnnualLeave == null ? this.revAnnualLeave : revAnnualLeave.value,
      revALD: revALD == null ? this.revALD : revALD.value,
      remarkWI: remarkWI == null ? this.remarkWI : remarkWI.value,
      uploadPR: uploadPR == null ? this.uploadPR : uploadPR.value,
      uploadSP: uploadSP == null ? this.uploadSP : uploadSP.value,
      uploadLP: uploadLP == null ? this.uploadLP : uploadLP.value,
      uploadAL: uploadAL == null ? this.uploadAL : uploadAL.value,
      uploadDep: uploadDep == null ? this.uploadDep : uploadDep.value
    );
  }
  
  ServiceRecord.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _depEmpDate = json['depEmpDate']?.cast<String>(),
      _depEmp = json['depEmp']?.cast<String>(),
      _positionRev = json['positionRev']?.cast<String>(),
      _positionRevDate = json['positionRevDate']?.cast<String>(),
      _revSalary = json['revSalary']?.cast<String>(),
      _revSalaryDate = json['revSalaryDate']?.cast<String>(),
      _revLeavePass = json['revLeavePass']?.cast<String>(),
      _revLeaveDate = json['revLeaveDate']?.cast<String>(),
      _revAnnualLeave = json['revAnnualLeave']?.cast<String>(),
      _revALD = json['revALD']?.cast<String>(),
      _remarkWI = json['remarkWI']?.cast<String>(),
      _uploadPR = json['uploadPR']?.cast<String>(),
      _uploadSP = json['uploadSP']?.cast<String>(),
      _uploadLP = json['uploadLP']?.cast<String>(),
      _uploadAL = json['uploadAL']?.cast<String>(),
      _uploadDep = json['uploadDep']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'depEmpDate': _depEmpDate, 'depEmp': _depEmp, 'positionRev': _positionRev, 'positionRevDate': _positionRevDate, 'revSalary': _revSalary, 'revSalaryDate': _revSalaryDate, 'revLeavePass': _revLeavePass, 'revLeaveDate': _revLeaveDate, 'revAnnualLeave': _revAnnualLeave, 'revALD': _revALD, 'remarkWI': _remarkWI, 'uploadPR': _uploadPR, 'uploadSP': _uploadSP, 'uploadLP': _uploadLP, 'uploadAL': _uploadAL, 'uploadDep': _uploadDep, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'depEmpDate': _depEmpDate,
    'depEmp': _depEmp,
    'positionRev': _positionRev,
    'positionRevDate': _positionRevDate,
    'revSalary': _revSalary,
    'revSalaryDate': _revSalaryDate,
    'revLeavePass': _revLeavePass,
    'revLeaveDate': _revLeaveDate,
    'revAnnualLeave': _revAnnualLeave,
    'revALD': _revALD,
    'remarkWI': _remarkWI,
    'uploadPR': _uploadPR,
    'uploadSP': _uploadSP,
    'uploadLP': _uploadLP,
    'uploadAL': _uploadAL,
    'uploadDep': _uploadDep,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ServiceRecordModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ServiceRecordModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final DEPEMPDATE = amplify_core.QueryField(fieldName: "depEmpDate");
  static final DEPEMP = amplify_core.QueryField(fieldName: "depEmp");
  static final POSITIONREV = amplify_core.QueryField(fieldName: "positionRev");
  static final POSITIONREVDATE = amplify_core.QueryField(fieldName: "positionRevDate");
  static final REVSALARY = amplify_core.QueryField(fieldName: "revSalary");
  static final REVSALARYDATE = amplify_core.QueryField(fieldName: "revSalaryDate");
  static final REVLEAVEPASS = amplify_core.QueryField(fieldName: "revLeavePass");
  static final REVLEAVEDATE = amplify_core.QueryField(fieldName: "revLeaveDate");
  static final REVANNUALLEAVE = amplify_core.QueryField(fieldName: "revAnnualLeave");
  static final REVALD = amplify_core.QueryField(fieldName: "revALD");
  static final REMARKWI = amplify_core.QueryField(fieldName: "remarkWI");
  static final UPLOADPR = amplify_core.QueryField(fieldName: "uploadPR");
  static final UPLOADSP = amplify_core.QueryField(fieldName: "uploadSP");
  static final UPLOADLP = amplify_core.QueryField(fieldName: "uploadLP");
  static final UPLOADAL = amplify_core.QueryField(fieldName: "uploadAL");
  static final UPLOADDEP = amplify_core.QueryField(fieldName: "uploadDep");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServiceRecord";
    modelSchemaDefinition.pluralName = "ServiceRecords";
    
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
      key: ServiceRecord.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.DEPEMPDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.DEPEMP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.POSITIONREV,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.POSITIONREVDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REVSALARY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REVSALARYDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REVLEAVEPASS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REVLEAVEDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REVANNUALLEAVE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REVALD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.REMARKWI,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.UPLOADPR,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.UPLOADSP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.UPLOADLP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.UPLOADAL,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ServiceRecord.UPLOADDEP,
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

class _ServiceRecordModelType extends amplify_core.ModelType<ServiceRecord> {
  const _ServiceRecordModelType();
  
  @override
  ServiceRecord fromJson(Map<String, dynamic> jsonData) {
    return ServiceRecord.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ServiceRecord';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ServiceRecord] in your schema.
 */
class ServiceRecordModelIdentifier implements amplify_core.ModelIdentifier<ServiceRecord> {
  final String id;

  /** Create an instance of ServiceRecordModelIdentifier using [id] the primary key. */
  const ServiceRecordModelIdentifier({
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
  String toString() => 'ServiceRecordModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ServiceRecordModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}