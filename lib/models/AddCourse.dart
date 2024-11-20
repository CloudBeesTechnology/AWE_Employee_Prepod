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


/** This is an auto generated class representing the AddCourse type in your schema. */
class AddCourse extends amplify_core.Model {
  static const classType = const _AddCourseModelType();
  final String id;
  final List<String>? _courseSelect;
  final List<String>? _courseName;
  final List<String>? _company;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AddCourseModelIdentifier get modelIdentifier {
      return AddCourseModelIdentifier(
        id: id
      );
  }
  
  List<String>? get courseSelect {
    return _courseSelect;
  }
  
  List<String>? get courseName {
    return _courseName;
  }
  
  List<String>? get company {
    return _company;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AddCourse._internal({required this.id, courseSelect, courseName, company, createdAt, updatedAt}): _courseSelect = courseSelect, _courseName = courseName, _company = company, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AddCourse({String? id, List<String>? courseSelect, List<String>? courseName, List<String>? company}) {
    return AddCourse._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      courseSelect: courseSelect != null ? List<String>.unmodifiable(courseSelect) : courseSelect,
      courseName: courseName != null ? List<String>.unmodifiable(courseName) : courseName,
      company: company != null ? List<String>.unmodifiable(company) : company);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddCourse &&
      id == other.id &&
      DeepCollectionEquality().equals(_courseSelect, other._courseSelect) &&
      DeepCollectionEquality().equals(_courseName, other._courseName) &&
      DeepCollectionEquality().equals(_company, other._company);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AddCourse {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("courseSelect=" + (_courseSelect != null ? _courseSelect!.toString() : "null") + ", ");
    buffer.write("courseName=" + (_courseName != null ? _courseName!.toString() : "null") + ", ");
    buffer.write("company=" + (_company != null ? _company!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AddCourse copyWith({List<String>? courseSelect, List<String>? courseName, List<String>? company}) {
    return AddCourse._internal(
      id: id,
      courseSelect: courseSelect ?? this.courseSelect,
      courseName: courseName ?? this.courseName,
      company: company ?? this.company);
  }
  
  AddCourse copyWithModelFieldValues({
    ModelFieldValue<List<String>>? courseSelect,
    ModelFieldValue<List<String>>? courseName,
    ModelFieldValue<List<String>>? company
  }) {
    return AddCourse._internal(
      id: id,
      courseSelect: courseSelect == null ? this.courseSelect : courseSelect.value,
      courseName: courseName == null ? this.courseName : courseName.value,
      company: company == null ? this.company : company.value
    );
  }
  
  AddCourse.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _courseSelect = json['courseSelect']?.cast<String>(),
      _courseName = json['courseName']?.cast<String>(),
      _company = json['company']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'courseSelect': _courseSelect, 'courseName': _courseName, 'company': _company, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'courseSelect': _courseSelect,
    'courseName': _courseName,
    'company': _company,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AddCourseModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AddCourseModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final COURSESELECT = amplify_core.QueryField(fieldName: "courseSelect");
  static final COURSENAME = amplify_core.QueryField(fieldName: "courseName");
  static final COMPANY = amplify_core.QueryField(fieldName: "company");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AddCourse";
    modelSchemaDefinition.pluralName = "AddCourses";
    
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
      key: AddCourse.COURSESELECT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AddCourse.COURSENAME,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AddCourse.COMPANY,
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

class _AddCourseModelType extends amplify_core.ModelType<AddCourse> {
  const _AddCourseModelType();
  
  @override
  AddCourse fromJson(Map<String, dynamic> jsonData) {
    return AddCourse.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AddCourse';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AddCourse] in your schema.
 */
class AddCourseModelIdentifier implements amplify_core.ModelIdentifier<AddCourse> {
  final String id;

  /** Create an instance of AddCourseModelIdentifier using [id] the primary key. */
  const AddCourseModelIdentifier({
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
  String toString() => 'AddCourseModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AddCourseModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}