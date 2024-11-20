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


/** This is an auto generated class representing the EmailNotifi type in your schema. */
class EmailNotifi extends amplify_core.Model {
  static const classType = const _EmailNotifiModelType();
  final String id;
  final String? _empID;
  final String? _leaveType;
  final String? _senderEmail;
  final List<String>? _receipentEmail;
  final String? _status;
  final String? _message;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmailNotifiModelIdentifier get modelIdentifier {
      return EmailNotifiModelIdentifier(
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
  
  String? get leaveType {
    return _leaveType;
  }
  
  String get senderEmail {
    try {
      return _senderEmail!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String>? get receipentEmail {
    return _receipentEmail;
  }
  
  String? get status {
    return _status;
  }
  
  String? get message {
    return _message;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EmailNotifi._internal({required this.id, required empID, leaveType, required senderEmail, receipentEmail, status, message, createdAt, updatedAt}): _empID = empID, _leaveType = leaveType, _senderEmail = senderEmail, _receipentEmail = receipentEmail, _status = status, _message = message, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmailNotifi({String? id, required String empID, String? leaveType, required String senderEmail, List<String>? receipentEmail, String? status, String? message}) {
    return EmailNotifi._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      leaveType: leaveType,
      senderEmail: senderEmail,
      receipentEmail: receipentEmail != null ? List<String>.unmodifiable(receipentEmail) : receipentEmail,
      status: status,
      message: message);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailNotifi &&
      id == other.id &&
      _empID == other._empID &&
      _leaveType == other._leaveType &&
      _senderEmail == other._senderEmail &&
      DeepCollectionEquality().equals(_receipentEmail, other._receipentEmail) &&
      _status == other._status &&
      _message == other._message;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmailNotifi {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("leaveType=" + "$_leaveType" + ", ");
    buffer.write("senderEmail=" + "$_senderEmail" + ", ");
    buffer.write("receipentEmail=" + (_receipentEmail != null ? _receipentEmail!.toString() : "null") + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmailNotifi copyWith({String? empID, String? leaveType, String? senderEmail, List<String>? receipentEmail, String? status, String? message}) {
    return EmailNotifi._internal(
      id: id,
      empID: empID ?? this.empID,
      leaveType: leaveType ?? this.leaveType,
      senderEmail: senderEmail ?? this.senderEmail,
      receipentEmail: receipentEmail ?? this.receipentEmail,
      status: status ?? this.status,
      message: message ?? this.message);
  }
  
  EmailNotifi copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<String?>? leaveType,
    ModelFieldValue<String>? senderEmail,
    ModelFieldValue<List<String>>? receipentEmail,
    ModelFieldValue<String?>? status,
    ModelFieldValue<String?>? message
  }) {
    return EmailNotifi._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      leaveType: leaveType == null ? this.leaveType : leaveType.value,
      senderEmail: senderEmail == null ? this.senderEmail : senderEmail.value,
      receipentEmail: receipentEmail == null ? this.receipentEmail : receipentEmail.value,
      status: status == null ? this.status : status.value,
      message: message == null ? this.message : message.value
    );
  }
  
  EmailNotifi.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _leaveType = json['leaveType'],
      _senderEmail = json['senderEmail'],
      _receipentEmail = json['receipentEmail']?.cast<String>(),
      _status = json['status'],
      _message = json['message'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'leaveType': _leaveType, 'senderEmail': _senderEmail, 'receipentEmail': _receipentEmail, 'status': _status, 'message': _message, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'leaveType': _leaveType,
    'senderEmail': _senderEmail,
    'receipentEmail': _receipentEmail,
    'status': _status,
    'message': _message,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmailNotifiModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmailNotifiModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final LEAVETYPE = amplify_core.QueryField(fieldName: "leaveType");
  static final SENDEREMAIL = amplify_core.QueryField(fieldName: "senderEmail");
  static final RECEIPENTEMAIL = amplify_core.QueryField(fieldName: "receipentEmail");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final MESSAGE = amplify_core.QueryField(fieldName: "message");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmailNotifi";
    modelSchemaDefinition.pluralName = "EmailNotifis";
    
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
      key: EmailNotifi.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmailNotifi.LEAVETYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmailNotifi.SENDEREMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmailNotifi.RECEIPENTEMAIL,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmailNotifi.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmailNotifi.MESSAGE,
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

class _EmailNotifiModelType extends amplify_core.ModelType<EmailNotifi> {
  const _EmailNotifiModelType();
  
  @override
  EmailNotifi fromJson(Map<String, dynamic> jsonData) {
    return EmailNotifi.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmailNotifi';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmailNotifi] in your schema.
 */
class EmailNotifiModelIdentifier implements amplify_core.ModelIdentifier<EmailNotifi> {
  final String id;

  /** Create an instance of EmailNotifiModelIdentifier using [id] the primary key. */
  const EmailNotifiModelIdentifier({
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
  String toString() => 'EmailNotifiModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmailNotifiModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}