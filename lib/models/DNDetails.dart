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


/** This is an auto generated class representing the DNDetails type in your schema. */
class DNDetails extends amplify_core.Model {
  static const classType = const _DNDetailsModelType();
  final String id;
  final String? _empID;
  final List<String>? _doeEmpSubmit;
  final List<String>? _doeEmpApproval;
  final List<String>? _doeEmpValid;
  final List<String>? _doeEmpRefNo;
  final List<String>? _doeEmpUpload;
  final List<String>? _permitType;
  final List<String>? _nlmsEmpSubmit;
  final List<String>? _nlmsEmpSubmitRefNo;
  final List<String>? _nlmsEmpApproval;
  final List<String>? _nlmsRefNo;
  final List<String>? _nlmsEmpValid;
  final List<String>? _nlmsEmpUpload;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  DNDetailsModelIdentifier get modelIdentifier {
      return DNDetailsModelIdentifier(
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
  
  List<String>? get doeEmpSubmit {
    return _doeEmpSubmit;
  }
  
  List<String>? get doeEmpApproval {
    return _doeEmpApproval;
  }
  
  List<String>? get doeEmpValid {
    return _doeEmpValid;
  }
  
  List<String>? get doeEmpRefNo {
    return _doeEmpRefNo;
  }
  
  List<String>? get doeEmpUpload {
    return _doeEmpUpload;
  }
  
  List<String>? get permitType {
    return _permitType;
  }
  
  List<String>? get nlmsEmpSubmit {
    return _nlmsEmpSubmit;
  }
  
  List<String>? get nlmsEmpSubmitRefNo {
    return _nlmsEmpSubmitRefNo;
  }
  
  List<String>? get nlmsEmpApproval {
    return _nlmsEmpApproval;
  }
  
  List<String>? get nlmsRefNo {
    return _nlmsRefNo;
  }
  
  List<String>? get nlmsEmpValid {
    return _nlmsEmpValid;
  }
  
  List<String>? get nlmsEmpUpload {
    return _nlmsEmpUpload;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const DNDetails._internal({required this.id, required empID, doeEmpSubmit, doeEmpApproval, doeEmpValid, doeEmpRefNo, doeEmpUpload, permitType, nlmsEmpSubmit, nlmsEmpSubmitRefNo, nlmsEmpApproval, nlmsRefNo, nlmsEmpValid, nlmsEmpUpload, createdAt, updatedAt}): _empID = empID, _doeEmpSubmit = doeEmpSubmit, _doeEmpApproval = doeEmpApproval, _doeEmpValid = doeEmpValid, _doeEmpRefNo = doeEmpRefNo, _doeEmpUpload = doeEmpUpload, _permitType = permitType, _nlmsEmpSubmit = nlmsEmpSubmit, _nlmsEmpSubmitRefNo = nlmsEmpSubmitRefNo, _nlmsEmpApproval = nlmsEmpApproval, _nlmsRefNo = nlmsRefNo, _nlmsEmpValid = nlmsEmpValid, _nlmsEmpUpload = nlmsEmpUpload, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DNDetails({String? id, required String empID, List<String>? doeEmpSubmit, List<String>? doeEmpApproval, List<String>? doeEmpValid, List<String>? doeEmpRefNo, List<String>? doeEmpUpload, List<String>? permitType, List<String>? nlmsEmpSubmit, List<String>? nlmsEmpSubmitRefNo, List<String>? nlmsEmpApproval, List<String>? nlmsRefNo, List<String>? nlmsEmpValid, List<String>? nlmsEmpUpload}) {
    return DNDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      doeEmpSubmit: doeEmpSubmit != null ? List<String>.unmodifiable(doeEmpSubmit) : doeEmpSubmit,
      doeEmpApproval: doeEmpApproval != null ? List<String>.unmodifiable(doeEmpApproval) : doeEmpApproval,
      doeEmpValid: doeEmpValid != null ? List<String>.unmodifiable(doeEmpValid) : doeEmpValid,
      doeEmpRefNo: doeEmpRefNo != null ? List<String>.unmodifiable(doeEmpRefNo) : doeEmpRefNo,
      doeEmpUpload: doeEmpUpload != null ? List<String>.unmodifiable(doeEmpUpload) : doeEmpUpload,
      permitType: permitType != null ? List<String>.unmodifiable(permitType) : permitType,
      nlmsEmpSubmit: nlmsEmpSubmit != null ? List<String>.unmodifiable(nlmsEmpSubmit) : nlmsEmpSubmit,
      nlmsEmpSubmitRefNo: nlmsEmpSubmitRefNo != null ? List<String>.unmodifiable(nlmsEmpSubmitRefNo) : nlmsEmpSubmitRefNo,
      nlmsEmpApproval: nlmsEmpApproval != null ? List<String>.unmodifiable(nlmsEmpApproval) : nlmsEmpApproval,
      nlmsRefNo: nlmsRefNo != null ? List<String>.unmodifiable(nlmsRefNo) : nlmsRefNo,
      nlmsEmpValid: nlmsEmpValid != null ? List<String>.unmodifiable(nlmsEmpValid) : nlmsEmpValid,
      nlmsEmpUpload: nlmsEmpUpload != null ? List<String>.unmodifiable(nlmsEmpUpload) : nlmsEmpUpload);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DNDetails &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_doeEmpSubmit, other._doeEmpSubmit) &&
      DeepCollectionEquality().equals(_doeEmpApproval, other._doeEmpApproval) &&
      DeepCollectionEquality().equals(_doeEmpValid, other._doeEmpValid) &&
      DeepCollectionEquality().equals(_doeEmpRefNo, other._doeEmpRefNo) &&
      DeepCollectionEquality().equals(_doeEmpUpload, other._doeEmpUpload) &&
      DeepCollectionEquality().equals(_permitType, other._permitType) &&
      DeepCollectionEquality().equals(_nlmsEmpSubmit, other._nlmsEmpSubmit) &&
      DeepCollectionEquality().equals(_nlmsEmpSubmitRefNo, other._nlmsEmpSubmitRefNo) &&
      DeepCollectionEquality().equals(_nlmsEmpApproval, other._nlmsEmpApproval) &&
      DeepCollectionEquality().equals(_nlmsRefNo, other._nlmsRefNo) &&
      DeepCollectionEquality().equals(_nlmsEmpValid, other._nlmsEmpValid) &&
      DeepCollectionEquality().equals(_nlmsEmpUpload, other._nlmsEmpUpload);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DNDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("doeEmpSubmit=" + (_doeEmpSubmit != null ? _doeEmpSubmit!.toString() : "null") + ", ");
    buffer.write("doeEmpApproval=" + (_doeEmpApproval != null ? _doeEmpApproval!.toString() : "null") + ", ");
    buffer.write("doeEmpValid=" + (_doeEmpValid != null ? _doeEmpValid!.toString() : "null") + ", ");
    buffer.write("doeEmpRefNo=" + (_doeEmpRefNo != null ? _doeEmpRefNo!.toString() : "null") + ", ");
    buffer.write("doeEmpUpload=" + (_doeEmpUpload != null ? _doeEmpUpload!.toString() : "null") + ", ");
    buffer.write("permitType=" + (_permitType != null ? _permitType!.toString() : "null") + ", ");
    buffer.write("nlmsEmpSubmit=" + (_nlmsEmpSubmit != null ? _nlmsEmpSubmit!.toString() : "null") + ", ");
    buffer.write("nlmsEmpSubmitRefNo=" + (_nlmsEmpSubmitRefNo != null ? _nlmsEmpSubmitRefNo!.toString() : "null") + ", ");
    buffer.write("nlmsEmpApproval=" + (_nlmsEmpApproval != null ? _nlmsEmpApproval!.toString() : "null") + ", ");
    buffer.write("nlmsRefNo=" + (_nlmsRefNo != null ? _nlmsRefNo!.toString() : "null") + ", ");
    buffer.write("nlmsEmpValid=" + (_nlmsEmpValid != null ? _nlmsEmpValid!.toString() : "null") + ", ");
    buffer.write("nlmsEmpUpload=" + (_nlmsEmpUpload != null ? _nlmsEmpUpload!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DNDetails copyWith({String? empID, List<String>? doeEmpSubmit, List<String>? doeEmpApproval, List<String>? doeEmpValid, List<String>? doeEmpRefNo, List<String>? doeEmpUpload, List<String>? permitType, List<String>? nlmsEmpSubmit, List<String>? nlmsEmpSubmitRefNo, List<String>? nlmsEmpApproval, List<String>? nlmsRefNo, List<String>? nlmsEmpValid, List<String>? nlmsEmpUpload}) {
    return DNDetails._internal(
      id: id,
      empID: empID ?? this.empID,
      doeEmpSubmit: doeEmpSubmit ?? this.doeEmpSubmit,
      doeEmpApproval: doeEmpApproval ?? this.doeEmpApproval,
      doeEmpValid: doeEmpValid ?? this.doeEmpValid,
      doeEmpRefNo: doeEmpRefNo ?? this.doeEmpRefNo,
      doeEmpUpload: doeEmpUpload ?? this.doeEmpUpload,
      permitType: permitType ?? this.permitType,
      nlmsEmpSubmit: nlmsEmpSubmit ?? this.nlmsEmpSubmit,
      nlmsEmpSubmitRefNo: nlmsEmpSubmitRefNo ?? this.nlmsEmpSubmitRefNo,
      nlmsEmpApproval: nlmsEmpApproval ?? this.nlmsEmpApproval,
      nlmsRefNo: nlmsRefNo ?? this.nlmsRefNo,
      nlmsEmpValid: nlmsEmpValid ?? this.nlmsEmpValid,
      nlmsEmpUpload: nlmsEmpUpload ?? this.nlmsEmpUpload);
  }
  
  DNDetails copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? doeEmpSubmit,
    ModelFieldValue<List<String>?>? doeEmpApproval,
    ModelFieldValue<List<String>?>? doeEmpValid,
    ModelFieldValue<List<String>?>? doeEmpRefNo,
    ModelFieldValue<List<String>?>? doeEmpUpload,
    ModelFieldValue<List<String>?>? permitType,
    ModelFieldValue<List<String>?>? nlmsEmpSubmit,
    ModelFieldValue<List<String>?>? nlmsEmpSubmitRefNo,
    ModelFieldValue<List<String>?>? nlmsEmpApproval,
    ModelFieldValue<List<String>?>? nlmsRefNo,
    ModelFieldValue<List<String>?>? nlmsEmpValid,
    ModelFieldValue<List<String>?>? nlmsEmpUpload
  }) {
    return DNDetails._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      doeEmpSubmit: doeEmpSubmit == null ? this.doeEmpSubmit : doeEmpSubmit.value,
      doeEmpApproval: doeEmpApproval == null ? this.doeEmpApproval : doeEmpApproval.value,
      doeEmpValid: doeEmpValid == null ? this.doeEmpValid : doeEmpValid.value,
      doeEmpRefNo: doeEmpRefNo == null ? this.doeEmpRefNo : doeEmpRefNo.value,
      doeEmpUpload: doeEmpUpload == null ? this.doeEmpUpload : doeEmpUpload.value,
      permitType: permitType == null ? this.permitType : permitType.value,
      nlmsEmpSubmit: nlmsEmpSubmit == null ? this.nlmsEmpSubmit : nlmsEmpSubmit.value,
      nlmsEmpSubmitRefNo: nlmsEmpSubmitRefNo == null ? this.nlmsEmpSubmitRefNo : nlmsEmpSubmitRefNo.value,
      nlmsEmpApproval: nlmsEmpApproval == null ? this.nlmsEmpApproval : nlmsEmpApproval.value,
      nlmsRefNo: nlmsRefNo == null ? this.nlmsRefNo : nlmsRefNo.value,
      nlmsEmpValid: nlmsEmpValid == null ? this.nlmsEmpValid : nlmsEmpValid.value,
      nlmsEmpUpload: nlmsEmpUpload == null ? this.nlmsEmpUpload : nlmsEmpUpload.value
    );
  }
  
  DNDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _doeEmpSubmit = json['doeEmpSubmit']?.cast<String>(),
      _doeEmpApproval = json['doeEmpApproval']?.cast<String>(),
      _doeEmpValid = json['doeEmpValid']?.cast<String>(),
      _doeEmpRefNo = json['doeEmpRefNo']?.cast<String>(),
      _doeEmpUpload = json['doeEmpUpload']?.cast<String>(),
      _permitType = json['permitType']?.cast<String>(),
      _nlmsEmpSubmit = json['nlmsEmpSubmit']?.cast<String>(),
      _nlmsEmpSubmitRefNo = json['nlmsEmpSubmitRefNo']?.cast<String>(),
      _nlmsEmpApproval = json['nlmsEmpApproval']?.cast<String>(),
      _nlmsRefNo = json['nlmsRefNo']?.cast<String>(),
      _nlmsEmpValid = json['nlmsEmpValid']?.cast<String>(),
      _nlmsEmpUpload = json['nlmsEmpUpload']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'doeEmpSubmit': _doeEmpSubmit, 'doeEmpApproval': _doeEmpApproval, 'doeEmpValid': _doeEmpValid, 'doeEmpRefNo': _doeEmpRefNo, 'doeEmpUpload': _doeEmpUpload, 'permitType': _permitType, 'nlmsEmpSubmit': _nlmsEmpSubmit, 'nlmsEmpSubmitRefNo': _nlmsEmpSubmitRefNo, 'nlmsEmpApproval': _nlmsEmpApproval, 'nlmsRefNo': _nlmsRefNo, 'nlmsEmpValid': _nlmsEmpValid, 'nlmsEmpUpload': _nlmsEmpUpload, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'doeEmpSubmit': _doeEmpSubmit,
    'doeEmpApproval': _doeEmpApproval,
    'doeEmpValid': _doeEmpValid,
    'doeEmpRefNo': _doeEmpRefNo,
    'doeEmpUpload': _doeEmpUpload,
    'permitType': _permitType,
    'nlmsEmpSubmit': _nlmsEmpSubmit,
    'nlmsEmpSubmitRefNo': _nlmsEmpSubmitRefNo,
    'nlmsEmpApproval': _nlmsEmpApproval,
    'nlmsRefNo': _nlmsRefNo,
    'nlmsEmpValid': _nlmsEmpValid,
    'nlmsEmpUpload': _nlmsEmpUpload,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DNDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DNDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final DOEEMPSUBMIT = amplify_core.QueryField(fieldName: "doeEmpSubmit");
  static final DOEEMPAPPROVAL = amplify_core.QueryField(fieldName: "doeEmpApproval");
  static final DOEEMPVALID = amplify_core.QueryField(fieldName: "doeEmpValid");
  static final DOEEMPREFNO = amplify_core.QueryField(fieldName: "doeEmpRefNo");
  static final DOEEMPUPLOAD = amplify_core.QueryField(fieldName: "doeEmpUpload");
  static final PERMITTYPE = amplify_core.QueryField(fieldName: "permitType");
  static final NLMSEMPSUBMIT = amplify_core.QueryField(fieldName: "nlmsEmpSubmit");
  static final NLMSEMPSUBMITREFNO = amplify_core.QueryField(fieldName: "nlmsEmpSubmitRefNo");
  static final NLMSEMPAPPROVAL = amplify_core.QueryField(fieldName: "nlmsEmpApproval");
  static final NLMSREFNO = amplify_core.QueryField(fieldName: "nlmsRefNo");
  static final NLMSEMPVALID = amplify_core.QueryField(fieldName: "nlmsEmpValid");
  static final NLMSEMPUPLOAD = amplify_core.QueryField(fieldName: "nlmsEmpUpload");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DNDetails";
    modelSchemaDefinition.pluralName = "DNDetails";
    
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
      key: DNDetails.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.DOEEMPSUBMIT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.DOEEMPAPPROVAL,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.DOEEMPVALID,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.DOEEMPREFNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.DOEEMPUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.PERMITTYPE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.NLMSEMPSUBMIT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.NLMSEMPSUBMITREFNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.NLMSEMPAPPROVAL,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.NLMSREFNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.NLMSEMPVALID,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DNDetails.NLMSEMPUPLOAD,
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

class _DNDetailsModelType extends amplify_core.ModelType<DNDetails> {
  const _DNDetailsModelType();
  
  @override
  DNDetails fromJson(Map<String, dynamic> jsonData) {
    return DNDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'DNDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [DNDetails] in your schema.
 */
class DNDetailsModelIdentifier implements amplify_core.ModelIdentifier<DNDetails> {
  final String id;

  /** Create an instance of DNDetailsModelIdentifier using [id] the primary key. */
  const DNDetailsModelIdentifier({
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
  String toString() => 'DNDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DNDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}