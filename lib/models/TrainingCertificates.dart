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


/** This is an auto generated class representing the TrainingCertificates type in your schema. */
class TrainingCertificates extends amplify_core.Model {
  static const classType = const _TrainingCertificatesModelType();
  final String id;
  final String? _empID;
  final List<String>? _courseCode;
  final List<String>? _courseName;
  final List<String>? _company;
  final List<String>? _certifiExpiry;
  final List<String>? _eCertifiDate;
  final List<String>? _trainingUpCertifi;
  final List<String>? _orgiCertifiDate;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TrainingCertificatesModelIdentifier get modelIdentifier {
      return TrainingCertificatesModelIdentifier(
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
  
  List<String>? get courseCode {
    return _courseCode;
  }
  
  List<String>? get courseName {
    return _courseName;
  }
  
  List<String>? get company {
    return _company;
  }
  
  List<String>? get certifiExpiry {
    return _certifiExpiry;
  }
  
  List<String>? get eCertifiDate {
    return _eCertifiDate;
  }
  
  List<String>? get trainingUpCertifi {
    return _trainingUpCertifi;
  }
  
  List<String>? get orgiCertifiDate {
    return _orgiCertifiDate;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TrainingCertificates._internal({required this.id, required empID, courseCode, courseName, company, certifiExpiry, eCertifiDate, trainingUpCertifi, orgiCertifiDate, createdAt, updatedAt}): _empID = empID, _courseCode = courseCode, _courseName = courseName, _company = company, _certifiExpiry = certifiExpiry, _eCertifiDate = eCertifiDate, _trainingUpCertifi = trainingUpCertifi, _orgiCertifiDate = orgiCertifiDate, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TrainingCertificates({String? id, required String empID, List<String>? courseCode, List<String>? courseName, List<String>? company, List<String>? certifiExpiry, List<String>? eCertifiDate, List<String>? trainingUpCertifi, List<String>? orgiCertifiDate}) {
    return TrainingCertificates._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      courseCode: courseCode != null ? List<String>.unmodifiable(courseCode) : courseCode,
      courseName: courseName != null ? List<String>.unmodifiable(courseName) : courseName,
      company: company != null ? List<String>.unmodifiable(company) : company,
      certifiExpiry: certifiExpiry != null ? List<String>.unmodifiable(certifiExpiry) : certifiExpiry,
      eCertifiDate: eCertifiDate != null ? List<String>.unmodifiable(eCertifiDate) : eCertifiDate,
      trainingUpCertifi: trainingUpCertifi != null ? List<String>.unmodifiable(trainingUpCertifi) : trainingUpCertifi,
      orgiCertifiDate: orgiCertifiDate != null ? List<String>.unmodifiable(orgiCertifiDate) : orgiCertifiDate);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrainingCertificates &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_courseCode, other._courseCode) &&
      DeepCollectionEquality().equals(_courseName, other._courseName) &&
      DeepCollectionEquality().equals(_company, other._company) &&
      DeepCollectionEquality().equals(_certifiExpiry, other._certifiExpiry) &&
      DeepCollectionEquality().equals(_eCertifiDate, other._eCertifiDate) &&
      DeepCollectionEquality().equals(_trainingUpCertifi, other._trainingUpCertifi) &&
      DeepCollectionEquality().equals(_orgiCertifiDate, other._orgiCertifiDate);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TrainingCertificates {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("courseCode=" + (_courseCode != null ? _courseCode!.toString() : "null") + ", ");
    buffer.write("courseName=" + (_courseName != null ? _courseName!.toString() : "null") + ", ");
    buffer.write("company=" + (_company != null ? _company!.toString() : "null") + ", ");
    buffer.write("certifiExpiry=" + (_certifiExpiry != null ? _certifiExpiry!.toString() : "null") + ", ");
    buffer.write("eCertifiDate=" + (_eCertifiDate != null ? _eCertifiDate!.toString() : "null") + ", ");
    buffer.write("trainingUpCertifi=" + (_trainingUpCertifi != null ? _trainingUpCertifi!.toString() : "null") + ", ");
    buffer.write("orgiCertifiDate=" + (_orgiCertifiDate != null ? _orgiCertifiDate!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TrainingCertificates copyWith({String? empID, List<String>? courseCode, List<String>? courseName, List<String>? company, List<String>? certifiExpiry, List<String>? eCertifiDate, List<String>? trainingUpCertifi, List<String>? orgiCertifiDate}) {
    return TrainingCertificates._internal(
      id: id,
      empID: empID ?? this.empID,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      company: company ?? this.company,
      certifiExpiry: certifiExpiry ?? this.certifiExpiry,
      eCertifiDate: eCertifiDate ?? this.eCertifiDate,
      trainingUpCertifi: trainingUpCertifi ?? this.trainingUpCertifi,
      orgiCertifiDate: orgiCertifiDate ?? this.orgiCertifiDate);
  }
  
  TrainingCertificates copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? courseCode,
    ModelFieldValue<List<String>?>? courseName,
    ModelFieldValue<List<String>?>? company,
    ModelFieldValue<List<String>?>? certifiExpiry,
    ModelFieldValue<List<String>?>? eCertifiDate,
    ModelFieldValue<List<String>?>? trainingUpCertifi,
    ModelFieldValue<List<String>?>? orgiCertifiDate
  }) {
    return TrainingCertificates._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      courseCode: courseCode == null ? this.courseCode : courseCode.value,
      courseName: courseName == null ? this.courseName : courseName.value,
      company: company == null ? this.company : company.value,
      certifiExpiry: certifiExpiry == null ? this.certifiExpiry : certifiExpiry.value,
      eCertifiDate: eCertifiDate == null ? this.eCertifiDate : eCertifiDate.value,
      trainingUpCertifi: trainingUpCertifi == null ? this.trainingUpCertifi : trainingUpCertifi.value,
      orgiCertifiDate: orgiCertifiDate == null ? this.orgiCertifiDate : orgiCertifiDate.value
    );
  }
  
  TrainingCertificates.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _courseCode = json['courseCode']?.cast<String>(),
      _courseName = json['courseName']?.cast<String>(),
      _company = json['company']?.cast<String>(),
      _certifiExpiry = json['certifiExpiry']?.cast<String>(),
      _eCertifiDate = json['eCertifiDate']?.cast<String>(),
      _trainingUpCertifi = json['trainingUpCertifi']?.cast<String>(),
      _orgiCertifiDate = json['orgiCertifiDate']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'courseCode': _courseCode, 'courseName': _courseName, 'company': _company, 'certifiExpiry': _certifiExpiry, 'eCertifiDate': _eCertifiDate, 'trainingUpCertifi': _trainingUpCertifi, 'orgiCertifiDate': _orgiCertifiDate, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'courseCode': _courseCode,
    'courseName': _courseName,
    'company': _company,
    'certifiExpiry': _certifiExpiry,
    'eCertifiDate': _eCertifiDate,
    'trainingUpCertifi': _trainingUpCertifi,
    'orgiCertifiDate': _orgiCertifiDate,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TrainingCertificatesModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TrainingCertificatesModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final COURSECODE = amplify_core.QueryField(fieldName: "courseCode");
  static final COURSENAME = amplify_core.QueryField(fieldName: "courseName");
  static final COMPANY = amplify_core.QueryField(fieldName: "company");
  static final CERTIFIEXPIRY = amplify_core.QueryField(fieldName: "certifiExpiry");
  static final ECERTIFIDATE = amplify_core.QueryField(fieldName: "eCertifiDate");
  static final TRAININGUPCERTIFI = amplify_core.QueryField(fieldName: "trainingUpCertifi");
  static final ORGICERTIFIDATE = amplify_core.QueryField(fieldName: "orgiCertifiDate");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TrainingCertificates";
    modelSchemaDefinition.pluralName = "TrainingCertificates";
    
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
      key: TrainingCertificates.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.COURSECODE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.COURSENAME,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.COMPANY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.CERTIFIEXPIRY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.ECERTIFIDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.TRAININGUPCERTIFI,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TrainingCertificates.ORGICERTIFIDATE,
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

class _TrainingCertificatesModelType extends amplify_core.ModelType<TrainingCertificates> {
  const _TrainingCertificatesModelType();
  
  @override
  TrainingCertificates fromJson(Map<String, dynamic> jsonData) {
    return TrainingCertificates.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TrainingCertificates';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TrainingCertificates] in your schema.
 */
class TrainingCertificatesModelIdentifier implements amplify_core.ModelIdentifier<TrainingCertificates> {
  final String id;

  /** Create an instance of TrainingCertificatesModelIdentifier using [id] the primary key. */
  const TrainingCertificatesModelIdentifier({
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
  String toString() => 'TrainingCertificatesModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TrainingCertificatesModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}