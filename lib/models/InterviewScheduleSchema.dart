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


/** This is an auto generated class representing the InterviewScheduleSchema type in your schema. */
class InterviewScheduleSchema extends amplify_core.Model {
  static const classType = const _InterviewScheduleSchemaModelType();
  final String id;
  final String? _date;
  final String? _time;
  final String? _venue;
  final String? _interviewType;
  final String? _interviewer;
  final String? _message;
  final String? _tempID;
  final String? _candidateStatus;
  final String? _department;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  InterviewScheduleSchemaModelIdentifier get modelIdentifier {
      return InterviewScheduleSchemaModelIdentifier(
        id: id
      );
  }
  
  String get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get time {
    try {
      return _time!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get venue {
    try {
      return _venue!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get interviewType {
    try {
      return _interviewType!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get interviewer {
    try {
      return _interviewer!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get message {
    return _message;
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
  
  String? get candidateStatus {
    return _candidateStatus;
  }
  
  String? get department {
    return _department;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const InterviewScheduleSchema._internal({required this.id, required date, required time, required venue, required interviewType, required interviewer, message, required tempID, candidateStatus, department, createdAt, updatedAt}): _date = date, _time = time, _venue = venue, _interviewType = interviewType, _interviewer = interviewer, _message = message, _tempID = tempID, _candidateStatus = candidateStatus, _department = department, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory InterviewScheduleSchema({String? id, required String date, required String time, required String venue, required String interviewType, required String interviewer, String? message, required String tempID, String? candidateStatus, String? department}) {
    return InterviewScheduleSchema._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      date: date,
      time: time,
      venue: venue,
      interviewType: interviewType,
      interviewer: interviewer,
      message: message,
      tempID: tempID,
      candidateStatus: candidateStatus,
      department: department);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterviewScheduleSchema &&
      id == other.id &&
      _date == other._date &&
      _time == other._time &&
      _venue == other._venue &&
      _interviewType == other._interviewType &&
      _interviewer == other._interviewer &&
      _message == other._message &&
      _tempID == other._tempID &&
      _candidateStatus == other._candidateStatus &&
      _department == other._department;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("InterviewScheduleSchema {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("time=" + "$_time" + ", ");
    buffer.write("venue=" + "$_venue" + ", ");
    buffer.write("interviewType=" + "$_interviewType" + ", ");
    buffer.write("interviewer=" + "$_interviewer" + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("tempID=" + "$_tempID" + ", ");
    buffer.write("candidateStatus=" + "$_candidateStatus" + ", ");
    buffer.write("department=" + "$_department" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  InterviewScheduleSchema copyWith({String? date, String? time, String? venue, String? interviewType, String? interviewer, String? message, String? tempID, String? candidateStatus, String? department}) {
    return InterviewScheduleSchema._internal(
      id: id,
      date: date ?? this.date,
      time: time ?? this.time,
      venue: venue ?? this.venue,
      interviewType: interviewType ?? this.interviewType,
      interviewer: interviewer ?? this.interviewer,
      message: message ?? this.message,
      tempID: tempID ?? this.tempID,
      candidateStatus: candidateStatus ?? this.candidateStatus,
      department: department ?? this.department);
  }
  
  InterviewScheduleSchema copyWithModelFieldValues({
    ModelFieldValue<String>? date,
    ModelFieldValue<String>? time,
    ModelFieldValue<String>? venue,
    ModelFieldValue<String>? interviewType,
    ModelFieldValue<String>? interviewer,
    ModelFieldValue<String?>? message,
    ModelFieldValue<String>? tempID,
    ModelFieldValue<String?>? candidateStatus,
    ModelFieldValue<String?>? department
  }) {
    return InterviewScheduleSchema._internal(
      id: id,
      date: date == null ? this.date : date.value,
      time: time == null ? this.time : time.value,
      venue: venue == null ? this.venue : venue.value,
      interviewType: interviewType == null ? this.interviewType : interviewType.value,
      interviewer: interviewer == null ? this.interviewer : interviewer.value,
      message: message == null ? this.message : message.value,
      tempID: tempID == null ? this.tempID : tempID.value,
      candidateStatus: candidateStatus == null ? this.candidateStatus : candidateStatus.value,
      department: department == null ? this.department : department.value
    );
  }
  
  InterviewScheduleSchema.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'],
      _time = json['time'],
      _venue = json['venue'],
      _interviewType = json['interviewType'],
      _interviewer = json['interviewer'],
      _message = json['message'],
      _tempID = json['tempID'],
      _candidateStatus = json['candidateStatus'],
      _department = json['department'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date, 'time': _time, 'venue': _venue, 'interviewType': _interviewType, 'interviewer': _interviewer, 'message': _message, 'tempID': _tempID, 'candidateStatus': _candidateStatus, 'department': _department, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'date': _date,
    'time': _time,
    'venue': _venue,
    'interviewType': _interviewType,
    'interviewer': _interviewer,
    'message': _message,
    'tempID': _tempID,
    'candidateStatus': _candidateStatus,
    'department': _department,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<InterviewScheduleSchemaModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<InterviewScheduleSchemaModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final TIME = amplify_core.QueryField(fieldName: "time");
  static final VENUE = amplify_core.QueryField(fieldName: "venue");
  static final INTERVIEWTYPE = amplify_core.QueryField(fieldName: "interviewType");
  static final INTERVIEWER = amplify_core.QueryField(fieldName: "interviewer");
  static final MESSAGE = amplify_core.QueryField(fieldName: "message");
  static final TEMPID = amplify_core.QueryField(fieldName: "tempID");
  static final CANDIDATESTATUS = amplify_core.QueryField(fieldName: "candidateStatus");
  static final DEPARTMENT = amplify_core.QueryField(fieldName: "department");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InterviewScheduleSchema";
    modelSchemaDefinition.pluralName = "InterviewScheduleSchemas";
    
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
      key: InterviewScheduleSchema.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.TIME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.VENUE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.INTERVIEWTYPE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.INTERVIEWER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.MESSAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.TEMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.CANDIDATESTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InterviewScheduleSchema.DEPARTMENT,
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

class _InterviewScheduleSchemaModelType extends amplify_core.ModelType<InterviewScheduleSchema> {
  const _InterviewScheduleSchemaModelType();
  
  @override
  InterviewScheduleSchema fromJson(Map<String, dynamic> jsonData) {
    return InterviewScheduleSchema.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'InterviewScheduleSchema';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [InterviewScheduleSchema] in your schema.
 */
class InterviewScheduleSchemaModelIdentifier implements amplify_core.ModelIdentifier<InterviewScheduleSchema> {
  final String id;

  /** Create an instance of InterviewScheduleSchemaModelIdentifier using [id] the primary key. */
  const InterviewScheduleSchemaModelIdentifier({
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
  String toString() => 'InterviewScheduleSchemaModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is InterviewScheduleSchemaModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}