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


/** This is an auto generated class representing the TrainingReq type in your schema. */
class TrainingReq extends amplify_core.Model {
  static const classType = const _TrainingReqModelType();
  final String id;
  final String? _empID;
  final String? _MRNo;
  final String? _medicalName;
  final String? _medicalExpiry;
  final String? _medicalAppointDate;
  final List<String>? _medicalReport;
  final String? _purchaseONo;
  final String? _traineeCourseCode;
  final String? _traineeCourseName;
  final String? _traineeCompany;
  final String? _traineeSD;
  final String? _traineeED;
  final String? _traineeStatus;
  final String? _traineeCourseFee;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TrainingReqModelIdentifier get modelIdentifier {
      return TrainingReqModelIdentifier(
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
  
  String get MRNo {
    try {
      return _MRNo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get medicalName {
    return _medicalName;
  }
  
  String? get medicalExpiry {
    return _medicalExpiry;
  }
  
  String? get medicalAppointDate {
    return _medicalAppointDate;
  }
  
  List<String>? get medicalReport {
    return _medicalReport;
  }
  
  String get purchaseONo {
    try {
      return _purchaseONo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeCourseCode {
    try {
      return _traineeCourseCode!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeCourseName {
    try {
      return _traineeCourseName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeCompany {
    try {
      return _traineeCompany!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeSD {
    try {
      return _traineeSD!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeED {
    try {
      return _traineeED!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeStatus {
    try {
      return _traineeStatus!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get traineeCourseFee {
    try {
      return _traineeCourseFee!;
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
  
  const TrainingReq._internal({required this.id, required empID, required MRNo, medicalName, medicalExpiry, medicalAppointDate, medicalReport, required purchaseONo, required traineeCourseCode, required traineeCourseName, required traineeCompany, required traineeSD, required traineeED, required traineeStatus, required traineeCourseFee, createdAt, updatedAt}): _empID = empID, _MRNo = MRNo, _medicalName = medicalName, _medicalExpiry = medicalExpiry, _medicalAppointDate = medicalAppointDate, _medicalReport = medicalReport, _purchaseONo = purchaseONo, _traineeCourseCode = traineeCourseCode, _traineeCourseName = traineeCourseName, _traineeCompany = traineeCompany, _traineeSD = traineeSD, _traineeED = traineeED, _traineeStatus = traineeStatus, _traineeCourseFee = traineeCourseFee, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TrainingReq({String? id, required String empID, required String MRNo, String? medicalName, String? medicalExpiry, String? medicalAppointDate, List<String>? medicalReport, required String purchaseONo, required String traineeCourseCode, required String traineeCourseName, required String traineeCompany, required String traineeSD, required String traineeED, required String traineeStatus, required String traineeCourseFee}) {
    return TrainingReq._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      MRNo: MRNo,
      medicalName: medicalName,
      medicalExpiry: medicalExpiry,
      medicalAppointDate: medicalAppointDate,
      medicalReport: medicalReport != null ? List<String>.unmodifiable(medicalReport) : medicalReport,
      purchaseONo: purchaseONo,
      traineeCourseCode: traineeCourseCode,
      traineeCourseName: traineeCourseName,
      traineeCompany: traineeCompany,
      traineeSD: traineeSD,
      traineeED: traineeED,
      traineeStatus: traineeStatus,
      traineeCourseFee: traineeCourseFee);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrainingReq &&
      id == other.id &&
      _empID == other._empID &&
      _MRNo == other._MRNo &&
      _medicalName == other._medicalName &&
      _medicalExpiry == other._medicalExpiry &&
      _medicalAppointDate == other._medicalAppointDate &&
      DeepCollectionEquality().equals(_medicalReport, other._medicalReport) &&
      _purchaseONo == other._purchaseONo &&
      _traineeCourseCode == other._traineeCourseCode &&
      _traineeCourseName == other._traineeCourseName &&
      _traineeCompany == other._traineeCompany &&
      _traineeSD == other._traineeSD &&
      _traineeED == other._traineeED &&
      _traineeStatus == other._traineeStatus &&
      _traineeCourseFee == other._traineeCourseFee;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TrainingReq {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("MRNo=" + "$_MRNo" + ", ");
    buffer.write("medicalName=" + "$_medicalName" + ", ");
    buffer.write("medicalExpiry=" + "$_medicalExpiry" + ", ");
    buffer.write("medicalAppointDate=" + "$_medicalAppointDate" + ", ");
    buffer.write("medicalReport=" + (_medicalReport != null ? _medicalReport!.toString() : "null") + ", ");
    buffer.write("purchaseONo=" + "$_purchaseONo" + ", ");
    buffer.write("traineeCourseCode=" + "$_traineeCourseCode" + ", ");
    buffer.write("traineeCourseName=" + "$_traineeCourseName" + ", ");
    buffer.write("traineeCompany=" + "$_traineeCompany" + ", ");
    buffer.write("traineeSD=" + "$_traineeSD" + ", ");
    buffer.write("traineeED=" + "$_traineeED" + ", ");
    buffer.write("traineeStatus=" + "$_traineeStatus" + ", ");
    buffer.write("traineeCourseFee=" + "$_traineeCourseFee" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TrainingReq copyWith({String? empID, String? MRNo, String? medicalName, String? medicalExpiry, String? medicalAppointDate, List<String>? medicalReport, String? purchaseONo, String? traineeCourseCode, String? traineeCourseName, String? traineeCompany, String? traineeSD, String? traineeED, String? traineeStatus, String? traineeCourseFee}) {
    return TrainingReq._internal(
      id: id,
      empID: empID ?? this.empID,
      MRNo: MRNo ?? this.MRNo,
      medicalName: medicalName ?? this.medicalName,
      medicalExpiry: medicalExpiry ?? this.medicalExpiry,
      medicalAppointDate: medicalAppointDate ?? this.medicalAppointDate,
      medicalReport: medicalReport ?? this.medicalReport,
      purchaseONo: purchaseONo ?? this.purchaseONo,
      traineeCourseCode: traineeCourseCode ?? this.traineeCourseCode,
      traineeCourseName: traineeCourseName ?? this.traineeCourseName,
      traineeCompany: traineeCompany ?? this.traineeCompany,
      traineeSD: traineeSD ?? this.traineeSD,
      traineeED: traineeED ?? this.traineeED,
      traineeStatus: traineeStatus ?? this.traineeStatus,
      traineeCourseFee: traineeCourseFee ?? this.traineeCourseFee);
  }
  
  TrainingReq copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String>? MRNo,
    ModelFieldValue<String?>? medicalName,
    ModelFieldValue<String?>? medicalExpiry,
    ModelFieldValue<String?>? medicalAppointDate,
    ModelFieldValue<List<String>?>? medicalReport,
    ModelFieldValue<String>? purchaseONo,
    ModelFieldValue<String>? traineeCourseCode,
    ModelFieldValue<String>? traineeCourseName,
    ModelFieldValue<String>? traineeCompany,
    ModelFieldValue<String>? traineeSD,
    ModelFieldValue<String>? traineeED,
    ModelFieldValue<String>? traineeStatus,
    ModelFieldValue<String>? traineeCourseFee
  }) {
    return TrainingReq._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      MRNo: MRNo == null ? this.MRNo : MRNo.value,
      medicalName: medicalName == null ? this.medicalName : medicalName.value,
      medicalExpiry: medicalExpiry == null ? this.medicalExpiry : medicalExpiry.value,
      medicalAppointDate: medicalAppointDate == null ? this.medicalAppointDate : medicalAppointDate.value,
      medicalReport: medicalReport == null ? this.medicalReport : medicalReport.value,
      purchaseONo: purchaseONo == null ? this.purchaseONo : purchaseONo.value,
      traineeCourseCode: traineeCourseCode == null ? this.traineeCourseCode : traineeCourseCode.value,
      traineeCourseName: traineeCourseName == null ? this.traineeCourseName : traineeCourseName.value,
      traineeCompany: traineeCompany == null ? this.traineeCompany : traineeCompany.value,
      traineeSD: traineeSD == null ? this.traineeSD : traineeSD.value,
      traineeED: traineeED == null ? this.traineeED : traineeED.value,
      traineeStatus: traineeStatus == null ? this.traineeStatus : traineeStatus.value,
      traineeCourseFee: traineeCourseFee == null ? this.traineeCourseFee : traineeCourseFee.value
    );
  }
  
  TrainingReq.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _MRNo = json['MRNo'],
      _medicalName = json['medicalName'],
      _medicalExpiry = json['medicalExpiry'],
      _medicalAppointDate = json['medicalAppointDate'],
      _medicalReport = json['medicalReport']?.cast<String>(),
      _purchaseONo = json['purchaseONo'],
      _traineeCourseCode = json['traineeCourseCode'],
      _traineeCourseName = json['traineeCourseName'],
      _traineeCompany = json['traineeCompany'],
      _traineeSD = json['traineeSD'],
      _traineeED = json['traineeED'],
      _traineeStatus = json['traineeStatus'],
      _traineeCourseFee = json['traineeCourseFee'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'MRNo': _MRNo, 'medicalName': _medicalName, 'medicalExpiry': _medicalExpiry, 'medicalAppointDate': _medicalAppointDate, 'medicalReport': _medicalReport, 'purchaseONo': _purchaseONo, 'traineeCourseCode': _traineeCourseCode, 'traineeCourseName': _traineeCourseName, 'traineeCompany': _traineeCompany, 'traineeSD': _traineeSD, 'traineeED': _traineeED, 'traineeStatus': _traineeStatus, 'traineeCourseFee': _traineeCourseFee, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'MRNo': _MRNo,
    'medicalName': _medicalName,
    'medicalExpiry': _medicalExpiry,
    'medicalAppointDate': _medicalAppointDate,
    'medicalReport': _medicalReport,
    'purchaseONo': _purchaseONo,
    'traineeCourseCode': _traineeCourseCode,
    'traineeCourseName': _traineeCourseName,
    'traineeCompany': _traineeCompany,
    'traineeSD': _traineeSD,
    'traineeED': _traineeED,
    'traineeStatus': _traineeStatus,
    'traineeCourseFee': _traineeCourseFee,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TrainingReqModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TrainingReqModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final MRNO = amplify_core.QueryField(fieldName: "MRNo");
  static final MEDICALNAME = amplify_core.QueryField(fieldName: "medicalName");
  static final MEDICALEXPIRY = amplify_core.QueryField(fieldName: "medicalExpiry");
  static final MEDICALAPPOINTDATE = amplify_core.QueryField(fieldName: "medicalAppointDate");
  static final MEDICALREPORT = amplify_core.QueryField(fieldName: "medicalReport");
  static final PURCHASEONO = amplify_core.QueryField(fieldName: "purchaseONo");
  static final TRAINEECOURSECODE = amplify_core.QueryField(fieldName: "traineeCourseCode");
  static final TRAINEECOURSENAME = amplify_core.QueryField(fieldName: "traineeCourseName");
  static final TRAINEECOMPANY = amplify_core.QueryField(fieldName: "traineeCompany");
  static final TRAINEESD = amplify_core.QueryField(fieldName: "traineeSD");
  static final TRAINEEED = amplify_core.QueryField(fieldName: "traineeED");
  static final TRAINEESTATUS = amplify_core.QueryField(fieldName: "traineeStatus");
  static final TRAINEECOURSEFEE = amplify_core.QueryField(fieldName: "traineeCourseFee");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TrainingReq";
    modelSchemaDefinition.pluralName = "TrainingReqs";
    
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
      key: TrainingReq.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.MRNO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.MEDICALNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.MEDICALEXPIRY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.MEDICALAPPOINTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.MEDICALREPORT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.PURCHASEONO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEECOURSECODE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEECOURSENAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEECOMPANY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEESD,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEEED,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEESTATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingReq.TRAINEECOURSEFEE,
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

class _TrainingReqModelType extends amplify_core.ModelType<TrainingReq> {
  const _TrainingReqModelType();
  
  @override
  TrainingReq fromJson(Map<String, dynamic> jsonData) {
    return TrainingReq.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TrainingReq';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TrainingReq] in your schema.
 */
class TrainingReqModelIdentifier implements amplify_core.ModelIdentifier<TrainingReq> {
  final String id;

  /** Create an instance of TrainingReqModelIdentifier using [id] the primary key. */
  const TrainingReqModelIdentifier({
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
  String toString() => 'TrainingReqModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TrainingReqModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}