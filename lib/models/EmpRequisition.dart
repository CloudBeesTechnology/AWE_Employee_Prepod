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


/** This is an auto generated class representing the EmpRequisition type in your schema. */
class EmpRequisition extends amplify_core.Model {
  static const classType = const _EmpRequisitionModelType();
  final String id;
  final String? _department;
  final String? _justification;
  final String? _project;
  final String? _position;
  final int? _quantity;
  final String? _qualification;
  final String? _reasonForReq;
  final String? _replacementFor;
  final String? _tentativeDate;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmpRequisitionModelIdentifier get modelIdentifier {
      return EmpRequisitionModelIdentifier(
        id: id
      );
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
  
  String get justification {
    try {
      return _justification!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get project {
    try {
      return _project!;
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
  
  int get quantity {
    try {
      return _quantity!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get qualification {
    try {
      return _qualification!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get reasonForReq {
    try {
      return _reasonForReq!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get replacementFor {
    return _replacementFor;
  }
  
  String get tentativeDate {
    try {
      return _tentativeDate!;
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
  
  const EmpRequisition._internal({required this.id, required department, required justification, required project, required position, required quantity, required qualification, required reasonForReq, replacementFor, required tentativeDate, createdAt, updatedAt}): _department = department, _justification = justification, _project = project, _position = position, _quantity = quantity, _qualification = qualification, _reasonForReq = reasonForReq, _replacementFor = replacementFor, _tentativeDate = tentativeDate, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmpRequisition({String? id, required String department, required String justification, required String project, required String position, required int quantity, required String qualification, required String reasonForReq, String? replacementFor, required String tentativeDate}) {
    return EmpRequisition._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      department: department,
      justification: justification,
      project: project,
      position: position,
      quantity: quantity,
      qualification: qualification,
      reasonForReq: reasonForReq,
      replacementFor: replacementFor,
      tentativeDate: tentativeDate);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmpRequisition &&
      id == other.id &&
      _department == other._department &&
      _justification == other._justification &&
      _project == other._project &&
      _position == other._position &&
      _quantity == other._quantity &&
      _qualification == other._qualification &&
      _reasonForReq == other._reasonForReq &&
      _replacementFor == other._replacementFor &&
      _tentativeDate == other._tentativeDate;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmpRequisition {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("department=" + "$_department" + ", ");
    buffer.write("justification=" + "$_justification" + ", ");
    buffer.write("project=" + "$_project" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("quantity=" + (_quantity != null ? _quantity!.toString() : "null") + ", ");
    buffer.write("qualification=" + "$_qualification" + ", ");
    buffer.write("reasonForReq=" + "$_reasonForReq" + ", ");
    buffer.write("replacementFor=" + "$_replacementFor" + ", ");
    buffer.write("tentativeDate=" + "$_tentativeDate" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmpRequisition copyWith({String? department, String? justification, String? project, String? position, int? quantity, String? qualification, String? reasonForReq, String? replacementFor, String? tentativeDate}) {
    return EmpRequisition._internal(
      id: id,
      department: department ?? this.department,
      justification: justification ?? this.justification,
      project: project ?? this.project,
      position: position ?? this.position,
      quantity: quantity ?? this.quantity,
      qualification: qualification ?? this.qualification,
      reasonForReq: reasonForReq ?? this.reasonForReq,
      replacementFor: replacementFor ?? this.replacementFor,
      tentativeDate: tentativeDate ?? this.tentativeDate);
  }
  
  EmpRequisition copyWithModelFieldValues({
    ModelFieldValue<String>? department,
    ModelFieldValue<String>? justification,
    ModelFieldValue<String>? project,
    ModelFieldValue<String>? position,
    ModelFieldValue<int>? quantity,
    ModelFieldValue<String>? qualification,
    ModelFieldValue<String>? reasonForReq,
    ModelFieldValue<String?>? replacementFor,
    ModelFieldValue<String>? tentativeDate
  }) {
    return EmpRequisition._internal(
      id: id,
      department: department == null ? this.department : department.value,
      justification: justification == null ? this.justification : justification.value,
      project: project == null ? this.project : project.value,
      position: position == null ? this.position : position.value,
      quantity: quantity == null ? this.quantity : quantity.value,
      qualification: qualification == null ? this.qualification : qualification.value,
      reasonForReq: reasonForReq == null ? this.reasonForReq : reasonForReq.value,
      replacementFor: replacementFor == null ? this.replacementFor : replacementFor.value,
      tentativeDate: tentativeDate == null ? this.tentativeDate : tentativeDate.value
    );
  }
  
  EmpRequisition.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _department = json['department'],
      _justification = json['justification'],
      _project = json['project'],
      _position = json['position'],
      _quantity = (json['quantity'] as num?)?.toInt(),
      _qualification = json['qualification'],
      _reasonForReq = json['reasonForReq'],
      _replacementFor = json['replacementFor'],
      _tentativeDate = json['tentativeDate'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'department': _department, 'justification': _justification, 'project': _project, 'position': _position, 'quantity': _quantity, 'qualification': _qualification, 'reasonForReq': _reasonForReq, 'replacementFor': _replacementFor, 'tentativeDate': _tentativeDate, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'department': _department,
    'justification': _justification,
    'project': _project,
    'position': _position,
    'quantity': _quantity,
    'qualification': _qualification,
    'reasonForReq': _reasonForReq,
    'replacementFor': _replacementFor,
    'tentativeDate': _tentativeDate,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmpRequisitionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmpRequisitionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DEPARTMENT = amplify_core.QueryField(fieldName: "department");
  static final JUSTIFICATION = amplify_core.QueryField(fieldName: "justification");
  static final PROJECT = amplify_core.QueryField(fieldName: "project");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final QUANTITY = amplify_core.QueryField(fieldName: "quantity");
  static final QUALIFICATION = amplify_core.QueryField(fieldName: "qualification");
  static final REASONFORREQ = amplify_core.QueryField(fieldName: "reasonForReq");
  static final REPLACEMENTFOR = amplify_core.QueryField(fieldName: "replacementFor");
  static final TENTATIVEDATE = amplify_core.QueryField(fieldName: "tentativeDate");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmpRequisition";
    modelSchemaDefinition.pluralName = "EmpRequisitions";
    
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
      key: EmpRequisition.DEPARTMENT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.JUSTIFICATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.PROJECT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.POSITION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.QUANTITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.QUALIFICATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.REASONFORREQ,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.REPLACEMENTFOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpRequisition.TENTATIVEDATE,
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

class _EmpRequisitionModelType extends amplify_core.ModelType<EmpRequisition> {
  const _EmpRequisitionModelType();
  
  @override
  EmpRequisition fromJson(Map<String, dynamic> jsonData) {
    return EmpRequisition.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmpRequisition';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmpRequisition] in your schema.
 */
class EmpRequisitionModelIdentifier implements amplify_core.ModelIdentifier<EmpRequisition> {
  final String id;

  /** Create an instance of EmpRequisitionModelIdentifier using [id] the primary key. */
  const EmpRequisitionModelIdentifier({
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
  String toString() => 'EmpRequisitionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmpRequisitionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}