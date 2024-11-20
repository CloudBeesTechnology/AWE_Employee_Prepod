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


/** This is an auto generated class representing the SawpDetails type in your schema. */
class SawpDetails extends amplify_core.Model {
  static const classType = const _SawpDetailsModelType();
  final String id;
  final String? _empID;
  final List<String>? _sawpEmpLtrReq;
  final List<String>? _sawpEmpLtrReci;
  final List<String>? _sawpEmpUpload;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SawpDetailsModelIdentifier get modelIdentifier {
      return SawpDetailsModelIdentifier(
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
  
  List<String>? get sawpEmpLtrReq {
    return _sawpEmpLtrReq;
  }
  
  List<String>? get sawpEmpLtrReci {
    return _sawpEmpLtrReci;
  }
  
  List<String>? get sawpEmpUpload {
    return _sawpEmpUpload;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SawpDetails._internal({required this.id, required empID, sawpEmpLtrReq, sawpEmpLtrReci, sawpEmpUpload, createdAt, updatedAt}): _empID = empID, _sawpEmpLtrReq = sawpEmpLtrReq, _sawpEmpLtrReci = sawpEmpLtrReci, _sawpEmpUpload = sawpEmpUpload, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SawpDetails({String? id, required String empID, List<String>? sawpEmpLtrReq, List<String>? sawpEmpLtrReci, List<String>? sawpEmpUpload}) {
    return SawpDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      sawpEmpLtrReq: sawpEmpLtrReq != null ? List<String>.unmodifiable(sawpEmpLtrReq) : sawpEmpLtrReq,
      sawpEmpLtrReci: sawpEmpLtrReci != null ? List<String>.unmodifiable(sawpEmpLtrReci) : sawpEmpLtrReci,
      sawpEmpUpload: sawpEmpUpload != null ? List<String>.unmodifiable(sawpEmpUpload) : sawpEmpUpload);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SawpDetails &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_sawpEmpLtrReq, other._sawpEmpLtrReq) &&
      DeepCollectionEquality().equals(_sawpEmpLtrReci, other._sawpEmpLtrReci) &&
      DeepCollectionEquality().equals(_sawpEmpUpload, other._sawpEmpUpload);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SawpDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("sawpEmpLtrReq=" + (_sawpEmpLtrReq != null ? _sawpEmpLtrReq!.toString() : "null") + ", ");
    buffer.write("sawpEmpLtrReci=" + (_sawpEmpLtrReci != null ? _sawpEmpLtrReci!.toString() : "null") + ", ");
    buffer.write("sawpEmpUpload=" + (_sawpEmpUpload != null ? _sawpEmpUpload!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SawpDetails copyWith({String? empID, List<String>? sawpEmpLtrReq, List<String>? sawpEmpLtrReci, List<String>? sawpEmpUpload}) {
    return SawpDetails._internal(
      id: id,
      empID: empID ?? this.empID,
      sawpEmpLtrReq: sawpEmpLtrReq ?? this.sawpEmpLtrReq,
      sawpEmpLtrReci: sawpEmpLtrReci ?? this.sawpEmpLtrReci,
      sawpEmpUpload: sawpEmpUpload ?? this.sawpEmpUpload);
  }
  
  SawpDetails copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? sawpEmpLtrReq,
    ModelFieldValue<List<String>?>? sawpEmpLtrReci,
    ModelFieldValue<List<String>?>? sawpEmpUpload
  }) {
    return SawpDetails._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      sawpEmpLtrReq: sawpEmpLtrReq == null ? this.sawpEmpLtrReq : sawpEmpLtrReq.value,
      sawpEmpLtrReci: sawpEmpLtrReci == null ? this.sawpEmpLtrReci : sawpEmpLtrReci.value,
      sawpEmpUpload: sawpEmpUpload == null ? this.sawpEmpUpload : sawpEmpUpload.value
    );
  }
  
  SawpDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _sawpEmpLtrReq = json['sawpEmpLtrReq']?.cast<String>(),
      _sawpEmpLtrReci = json['sawpEmpLtrReci']?.cast<String>(),
      _sawpEmpUpload = json['sawpEmpUpload']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'sawpEmpLtrReq': _sawpEmpLtrReq, 'sawpEmpLtrReci': _sawpEmpLtrReci, 'sawpEmpUpload': _sawpEmpUpload, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'sawpEmpLtrReq': _sawpEmpLtrReq,
    'sawpEmpLtrReci': _sawpEmpLtrReci,
    'sawpEmpUpload': _sawpEmpUpload,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<SawpDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<SawpDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final SAWPEMPLTRREQ = amplify_core.QueryField(fieldName: "sawpEmpLtrReq");
  static final SAWPEMPLTRRECI = amplify_core.QueryField(fieldName: "sawpEmpLtrReci");
  static final SAWPEMPUPLOAD = amplify_core.QueryField(fieldName: "sawpEmpUpload");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SawpDetails";
    modelSchemaDefinition.pluralName = "SawpDetails";
    
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
      key: SawpDetails.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SawpDetails.SAWPEMPLTRREQ,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SawpDetails.SAWPEMPLTRRECI,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SawpDetails.SAWPEMPUPLOAD,
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

class _SawpDetailsModelType extends amplify_core.ModelType<SawpDetails> {
  const _SawpDetailsModelType();
  
  @override
  SawpDetails fromJson(Map<String, dynamic> jsonData) {
    return SawpDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SawpDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SawpDetails] in your schema.
 */
class SawpDetailsModelIdentifier implements amplify_core.ModelIdentifier<SawpDetails> {
  final String id;

  /** Create an instance of SawpDetailsModelIdentifier using [id] the primary key. */
  const SawpDetailsModelIdentifier({
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
  String toString() => 'SawpDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SawpDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}