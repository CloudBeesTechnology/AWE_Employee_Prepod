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


/** This is an auto generated class representing the SampleTest1 type in your schema. */
class SampleTest1 extends amplify_core.Model {
  static const classType = const _SampleTest1ModelType();
  final String id;
  final String? _name;
  final String? _email;
  final String? _gender;
  final String? _empID;
  final String? _password;
  final String? _tempID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SampleTest1ModelIdentifier get modelIdentifier {
      return SampleTest1ModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get email {
    return _email;
  }
  
  String? get gender {
    return _gender;
  }
  
  String? get empID {
    return _empID;
  }
  
  String? get password {
    return _password;
  }
  
  String? get tempID {
    return _tempID;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SampleTest1._internal({required this.id, name, email, gender, empID, password, tempID, createdAt, updatedAt}): _name = name, _email = email, _gender = gender, _empID = empID, _password = password, _tempID = tempID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SampleTest1({String? id, String? name, String? email, String? gender, String? empID, String? password, String? tempID}) {
    return SampleTest1._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      email: email,
      gender: gender,
      empID: empID,
      password: password,
      tempID: tempID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SampleTest1 &&
      id == other.id &&
      _name == other._name &&
      _email == other._email &&
      _gender == other._gender &&
      _empID == other._empID &&
      _password == other._password &&
      _tempID == other._tempID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SampleTest1 {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("password=" + "$_password" + ", ");
    buffer.write("tempID=" + "$_tempID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SampleTest1 copyWith({String? name, String? email, String? gender, String? empID, String? password, String? tempID}) {
    return SampleTest1._internal(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      empID: empID ?? this.empID,
      password: password ?? this.password,
      tempID: tempID ?? this.tempID);
  }
  
  SampleTest1 copyWithModelFieldValues({
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? email,
    ModelFieldValue<String?>? gender,
    ModelFieldValue<String?>? empID,
    ModelFieldValue<String?>? password,
    ModelFieldValue<String?>? tempID
  }) {
    return SampleTest1._internal(
      id: id,
      name: name == null ? this.name : name.value,
      email: email == null ? this.email : email.value,
      gender: gender == null ? this.gender : gender.value,
      empID: empID == null ? this.empID : empID.value,
      password: password == null ? this.password : password.value,
      tempID: tempID == null ? this.tempID : tempID.value
    );
  }
  
  SampleTest1.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _email = json['email'],
      _gender = json['gender'],
      _empID = json['empID'],
      _password = json['password'],
      _tempID = json['tempID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'email': _email, 'gender': _gender, 'empID': _empID, 'password': _password, 'tempID': _tempID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'email': _email,
    'gender': _gender,
    'empID': _empID,
    'password': _password,
    'tempID': _tempID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<SampleTest1ModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<SampleTest1ModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final PASSWORD = amplify_core.QueryField(fieldName: "password");
  static final TEMPID = amplify_core.QueryField(fieldName: "tempID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SampleTest1";
    modelSchemaDefinition.pluralName = "SampleTest1s";
    
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
      key: SampleTest1.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SampleTest1.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SampleTest1.GENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SampleTest1.EMPID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SampleTest1.PASSWORD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SampleTest1.TEMPID,
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

class _SampleTest1ModelType extends amplify_core.ModelType<SampleTest1> {
  const _SampleTest1ModelType();
  
  @override
  SampleTest1 fromJson(Map<String, dynamic> jsonData) {
    return SampleTest1.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SampleTest1';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SampleTest1] in your schema.
 */
class SampleTest1ModelIdentifier implements amplify_core.ModelIdentifier<SampleTest1> {
  final String id;

  /** Create an instance of SampleTest1ModelIdentifier using [id] the primary key. */
  const SampleTest1ModelIdentifier({
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
  String toString() => 'SampleTest1ModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SampleTest1ModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}