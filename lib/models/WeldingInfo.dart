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


/** This is an auto generated class representing the WeldingInfo type in your schema. */
class WeldingInfo extends amplify_core.Model {
  static const classType = const _WeldingInfoModelType();
  final String id;
  final String? _empID;
  final String? _department;
  final String? _diameterRange;
  final String? _empBadgeNo;
  final String? _empName;
  final String? _fillerMetal;
  final String? _position;
  final String? _thicknessRange;
  final String? _weldingStampNor;
  final String? _wpsNumber;
  final String? _weldingProcess;
  final String? _weldingPosition;
  final String? _WQExpiry;
  final String? _WQRemarks;
  final List<String>? _weldingUpload;
  final String? _WQRNo;
  final String? _weldingCode;
  final String? _weldingMaterial;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  WeldingInfoModelIdentifier get modelIdentifier {
      return WeldingInfoModelIdentifier(
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
  
  String get department {
    try {
      return _department!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get diameterRange {
    try {
      return _diameterRange!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get empBadgeNo {
    try {
      return _empBadgeNo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get empName {
    try {
      return _empName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get fillerMetal {
    try {
      return _fillerMetal!;
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
  
  String get thicknessRange {
    try {
      return _thicknessRange!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get weldingStampNor {
    try {
      return _weldingStampNor!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get wpsNumber {
    try {
      return _wpsNumber!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get weldingProcess {
    try {
      return _weldingProcess!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get weldingPosition {
    try {
      return _weldingPosition!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get WQExpiry {
    try {
      return _WQExpiry!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get WQRemarks {
    return _WQRemarks;
  }
  
  List<String>? get weldingUpload {
    return _weldingUpload;
  }
  
  String get WQRNo {
    try {
      return _WQRNo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get weldingCode {
    try {
      return _weldingCode!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get weldingMaterial {
    try {
      return _weldingMaterial!;
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
  
  const WeldingInfo._internal({required this.id, required empID, required department, required diameterRange, required empBadgeNo, required empName, required fillerMetal, required position, required thicknessRange, required weldingStampNor, required wpsNumber, required weldingProcess, required weldingPosition, required WQExpiry, WQRemarks, weldingUpload, required WQRNo, required weldingCode, required weldingMaterial, createdAt, updatedAt}): _empID = empID, _department = department, _diameterRange = diameterRange, _empBadgeNo = empBadgeNo, _empName = empName, _fillerMetal = fillerMetal, _position = position, _thicknessRange = thicknessRange, _weldingStampNor = weldingStampNor, _wpsNumber = wpsNumber, _weldingProcess = weldingProcess, _weldingPosition = weldingPosition, _WQExpiry = WQExpiry, _WQRemarks = WQRemarks, _weldingUpload = weldingUpload, _WQRNo = WQRNo, _weldingCode = weldingCode, _weldingMaterial = weldingMaterial, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory WeldingInfo({String? id, required String empID, required String department, required String diameterRange, required String empBadgeNo, required String empName, required String fillerMetal, required String position, required String thicknessRange, required String weldingStampNor, required String wpsNumber, required String weldingProcess, required String weldingPosition, required String WQExpiry, String? WQRemarks, List<String>? weldingUpload, required String WQRNo, required String weldingCode, required String weldingMaterial}) {
    return WeldingInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      department: department,
      diameterRange: diameterRange,
      empBadgeNo: empBadgeNo,
      empName: empName,
      fillerMetal: fillerMetal,
      position: position,
      thicknessRange: thicknessRange,
      weldingStampNor: weldingStampNor,
      wpsNumber: wpsNumber,
      weldingProcess: weldingProcess,
      weldingPosition: weldingPosition,
      WQExpiry: WQExpiry,
      WQRemarks: WQRemarks,
      weldingUpload: weldingUpload != null ? List<String>.unmodifiable(weldingUpload) : weldingUpload,
      WQRNo: WQRNo,
      weldingCode: weldingCode,
      weldingMaterial: weldingMaterial);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeldingInfo &&
      id == other.id &&
      _empID == other._empID &&
      _department == other._department &&
      _diameterRange == other._diameterRange &&
      _empBadgeNo == other._empBadgeNo &&
      _empName == other._empName &&
      _fillerMetal == other._fillerMetal &&
      _position == other._position &&
      _thicknessRange == other._thicknessRange &&
      _weldingStampNor == other._weldingStampNor &&
      _wpsNumber == other._wpsNumber &&
      _weldingProcess == other._weldingProcess &&
      _weldingPosition == other._weldingPosition &&
      _WQExpiry == other._WQExpiry &&
      _WQRemarks == other._WQRemarks &&
      DeepCollectionEquality().equals(_weldingUpload, other._weldingUpload) &&
      _WQRNo == other._WQRNo &&
      _weldingCode == other._weldingCode &&
      _weldingMaterial == other._weldingMaterial;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("WeldingInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("department=" + "$_department" + ", ");
    buffer.write("diameterRange=" + "$_diameterRange" + ", ");
    buffer.write("empBadgeNo=" + "$_empBadgeNo" + ", ");
    buffer.write("empName=" + "$_empName" + ", ");
    buffer.write("fillerMetal=" + "$_fillerMetal" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("thicknessRange=" + "$_thicknessRange" + ", ");
    buffer.write("weldingStampNor=" + "$_weldingStampNor" + ", ");
    buffer.write("wpsNumber=" + "$_wpsNumber" + ", ");
    buffer.write("weldingProcess=" + "$_weldingProcess" + ", ");
    buffer.write("weldingPosition=" + "$_weldingPosition" + ", ");
    buffer.write("WQExpiry=" + "$_WQExpiry" + ", ");
    buffer.write("WQRemarks=" + "$_WQRemarks" + ", ");
    buffer.write("weldingUpload=" + (_weldingUpload != null ? _weldingUpload!.toString() : "null") + ", ");
    buffer.write("WQRNo=" + "$_WQRNo" + ", ");
    buffer.write("weldingCode=" + "$_weldingCode" + ", ");
    buffer.write("weldingMaterial=" + "$_weldingMaterial" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  WeldingInfo copyWith({String? empID, String? department, String? diameterRange, String? empBadgeNo, String? empName, String? fillerMetal, String? position, String? thicknessRange, String? weldingStampNor, String? wpsNumber, String? weldingProcess, String? weldingPosition, String? WQExpiry, String? WQRemarks, List<String>? weldingUpload, String? WQRNo, String? weldingCode, String? weldingMaterial}) {
    return WeldingInfo._internal(
      id: id,
      empID: empID ?? this.empID,
      department: department ?? this.department,
      diameterRange: diameterRange ?? this.diameterRange,
      empBadgeNo: empBadgeNo ?? this.empBadgeNo,
      empName: empName ?? this.empName,
      fillerMetal: fillerMetal ?? this.fillerMetal,
      position: position ?? this.position,
      thicknessRange: thicknessRange ?? this.thicknessRange,
      weldingStampNor: weldingStampNor ?? this.weldingStampNor,
      wpsNumber: wpsNumber ?? this.wpsNumber,
      weldingProcess: weldingProcess ?? this.weldingProcess,
      weldingPosition: weldingPosition ?? this.weldingPosition,
      WQExpiry: WQExpiry ?? this.WQExpiry,
      WQRemarks: WQRemarks ?? this.WQRemarks,
      weldingUpload: weldingUpload ?? this.weldingUpload,
      WQRNo: WQRNo ?? this.WQRNo,
      weldingCode: weldingCode ?? this.weldingCode,
      weldingMaterial: weldingMaterial ?? this.weldingMaterial);
  }
  
  WeldingInfo copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String>? department,
    ModelFieldValue<String>? diameterRange,
    ModelFieldValue<String>? empBadgeNo,
    ModelFieldValue<String>? empName,
    ModelFieldValue<String>? fillerMetal,
    ModelFieldValue<String>? position,
    ModelFieldValue<String>? thicknessRange,
    ModelFieldValue<String>? weldingStampNor,
    ModelFieldValue<String>? wpsNumber,
    ModelFieldValue<String>? weldingProcess,
    ModelFieldValue<String>? weldingPosition,
    ModelFieldValue<String>? WQExpiry,
    ModelFieldValue<String?>? WQRemarks,
    ModelFieldValue<List<String>?>? weldingUpload,
    ModelFieldValue<String>? WQRNo,
    ModelFieldValue<String>? weldingCode,
    ModelFieldValue<String>? weldingMaterial
  }) {
    return WeldingInfo._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      department: department == null ? this.department : department.value,
      diameterRange: diameterRange == null ? this.diameterRange : diameterRange.value,
      empBadgeNo: empBadgeNo == null ? this.empBadgeNo : empBadgeNo.value,
      empName: empName == null ? this.empName : empName.value,
      fillerMetal: fillerMetal == null ? this.fillerMetal : fillerMetal.value,
      position: position == null ? this.position : position.value,
      thicknessRange: thicknessRange == null ? this.thicknessRange : thicknessRange.value,
      weldingStampNor: weldingStampNor == null ? this.weldingStampNor : weldingStampNor.value,
      wpsNumber: wpsNumber == null ? this.wpsNumber : wpsNumber.value,
      weldingProcess: weldingProcess == null ? this.weldingProcess : weldingProcess.value,
      weldingPosition: weldingPosition == null ? this.weldingPosition : weldingPosition.value,
      WQExpiry: WQExpiry == null ? this.WQExpiry : WQExpiry.value,
      WQRemarks: WQRemarks == null ? this.WQRemarks : WQRemarks.value,
      weldingUpload: weldingUpload == null ? this.weldingUpload : weldingUpload.value,
      WQRNo: WQRNo == null ? this.WQRNo : WQRNo.value,
      weldingCode: weldingCode == null ? this.weldingCode : weldingCode.value,
      weldingMaterial: weldingMaterial == null ? this.weldingMaterial : weldingMaterial.value
    );
  }
  
  WeldingInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _department = json['department'],
      _diameterRange = json['diameterRange'],
      _empBadgeNo = json['empBadgeNo'],
      _empName = json['empName'],
      _fillerMetal = json['fillerMetal'],
      _position = json['position'],
      _thicknessRange = json['thicknessRange'],
      _weldingStampNor = json['weldingStampNor'],
      _wpsNumber = json['wpsNumber'],
      _weldingProcess = json['weldingProcess'],
      _weldingPosition = json['weldingPosition'],
      _WQExpiry = json['WQExpiry'],
      _WQRemarks = json['WQRemarks'],
      _weldingUpload = json['weldingUpload']?.cast<String>(),
      _WQRNo = json['WQRNo'],
      _weldingCode = json['weldingCode'],
      _weldingMaterial = json['weldingMaterial'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'department': _department, 'diameterRange': _diameterRange, 'empBadgeNo': _empBadgeNo, 'empName': _empName, 'fillerMetal': _fillerMetal, 'position': _position, 'thicknessRange': _thicknessRange, 'weldingStampNor': _weldingStampNor, 'wpsNumber': _wpsNumber, 'weldingProcess': _weldingProcess, 'weldingPosition': _weldingPosition, 'WQExpiry': _WQExpiry, 'WQRemarks': _WQRemarks, 'weldingUpload': _weldingUpload, 'WQRNo': _WQRNo, 'weldingCode': _weldingCode, 'weldingMaterial': _weldingMaterial, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'department': _department,
    'diameterRange': _diameterRange,
    'empBadgeNo': _empBadgeNo,
    'empName': _empName,
    'fillerMetal': _fillerMetal,
    'position': _position,
    'thicknessRange': _thicknessRange,
    'weldingStampNor': _weldingStampNor,
    'wpsNumber': _wpsNumber,
    'weldingProcess': _weldingProcess,
    'weldingPosition': _weldingPosition,
    'WQExpiry': _WQExpiry,
    'WQRemarks': _WQRemarks,
    'weldingUpload': _weldingUpload,
    'WQRNo': _WQRNo,
    'weldingCode': _weldingCode,
    'weldingMaterial': _weldingMaterial,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<WeldingInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<WeldingInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final DEPARTMENT = amplify_core.QueryField(fieldName: "department");
  static final DIAMETERRANGE = amplify_core.QueryField(fieldName: "diameterRange");
  static final EMPBADGENO = amplify_core.QueryField(fieldName: "empBadgeNo");
  static final EMPNAME = amplify_core.QueryField(fieldName: "empName");
  static final FILLERMETAL = amplify_core.QueryField(fieldName: "fillerMetal");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final THICKNESSRANGE = amplify_core.QueryField(fieldName: "thicknessRange");
  static final WELDINGSTAMPNOR = amplify_core.QueryField(fieldName: "weldingStampNor");
  static final WPSNUMBER = amplify_core.QueryField(fieldName: "wpsNumber");
  static final WELDINGPROCESS = amplify_core.QueryField(fieldName: "weldingProcess");
  static final WELDINGPOSITION = amplify_core.QueryField(fieldName: "weldingPosition");
  static final WQEXPIRY = amplify_core.QueryField(fieldName: "WQExpiry");
  static final WQREMARKS = amplify_core.QueryField(fieldName: "WQRemarks");
  static final WELDINGUPLOAD = amplify_core.QueryField(fieldName: "weldingUpload");
  static final WQRNO = amplify_core.QueryField(fieldName: "WQRNo");
  static final WELDINGCODE = amplify_core.QueryField(fieldName: "weldingCode");
  static final WELDINGMATERIAL = amplify_core.QueryField(fieldName: "weldingMaterial");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "WeldingInfo";
    modelSchemaDefinition.pluralName = "WeldingInfos";
    
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
      key: WeldingInfo.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.DEPARTMENT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.DIAMETERRANGE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.EMPBADGENO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.EMPNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.FILLERMETAL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.POSITION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.THICKNESSRANGE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WELDINGSTAMPNOR,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WPSNUMBER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WELDINGPROCESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WELDINGPOSITION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WQEXPIRY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WQREMARKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WELDINGUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WQRNO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WELDINGCODE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: WeldingInfo.WELDINGMATERIAL,
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

class _WeldingInfoModelType extends amplify_core.ModelType<WeldingInfo> {
  const _WeldingInfoModelType();
  
  @override
  WeldingInfo fromJson(Map<String, dynamic> jsonData) {
    return WeldingInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'WeldingInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [WeldingInfo] in your schema.
 */
class WeldingInfoModelIdentifier implements amplify_core.ModelIdentifier<WeldingInfo> {
  final String id;

  /** Create an instance of WeldingInfoModelIdentifier using [id] the primary key. */
  const WeldingInfoModelIdentifier({
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
  String toString() => 'WeldingInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is WeldingInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}