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


/** This is an auto generated class representing the PassportValid type in your schema. */
class PassportValid extends amplify_core.Model {
  static const classType = const _PassportValidModelType();
  final String id;
  final String? _empID;
  final List<String>? _ppLocation;
  final List<String>? _arrivStampUpload;
  final List<String>? _immigEmpUpload;
  final List<String>? _reEntryUpload;
  final List<String>? _arrivStampExp;
  final String? _immigRefNo;
  final List<String>? _ppSubmit;
  final List<String>? _empPassExp;
  final List<String>? _empPassStatus;
  final List<String>? _airTktStatus;
  final List<String>? _reEntryVisa;
  final List<String>? _immigApproval;
  final List<String>? _reEntryVisaExp;
  final List<String>? _remarkImmig;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PassportValidModelIdentifier get modelIdentifier {
      return PassportValidModelIdentifier(
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
  
  List<String>? get ppLocation {
    return _ppLocation;
  }
  
  List<String>? get arrivStampUpload {
    return _arrivStampUpload;
  }
  
  List<String>? get immigEmpUpload {
    return _immigEmpUpload;
  }
  
  List<String>? get reEntryUpload {
    return _reEntryUpload;
  }
  
  List<String>? get arrivStampExp {
    return _arrivStampExp;
  }
  
  String? get immigRefNo {
    return _immigRefNo;
  }
  
  List<String>? get ppSubmit {
    return _ppSubmit;
  }
  
  List<String>? get empPassExp {
    return _empPassExp;
  }
  
  List<String>? get empPassStatus {
    return _empPassStatus;
  }
  
  List<String>? get airTktStatus {
    return _airTktStatus;
  }
  
  List<String>? get reEntryVisa {
    return _reEntryVisa;
  }
  
  List<String>? get immigApproval {
    return _immigApproval;
  }
  
  List<String>? get reEntryVisaExp {
    return _reEntryVisaExp;
  }
  
  List<String>? get remarkImmig {
    return _remarkImmig;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const PassportValid._internal({required this.id, required empID, ppLocation, arrivStampUpload, immigEmpUpload, reEntryUpload, arrivStampExp, immigRefNo, ppSubmit, empPassExp, empPassStatus, airTktStatus, reEntryVisa, immigApproval, reEntryVisaExp, remarkImmig, createdAt, updatedAt}): _empID = empID, _ppLocation = ppLocation, _arrivStampUpload = arrivStampUpload, _immigEmpUpload = immigEmpUpload, _reEntryUpload = reEntryUpload, _arrivStampExp = arrivStampExp, _immigRefNo = immigRefNo, _ppSubmit = ppSubmit, _empPassExp = empPassExp, _empPassStatus = empPassStatus, _airTktStatus = airTktStatus, _reEntryVisa = reEntryVisa, _immigApproval = immigApproval, _reEntryVisaExp = reEntryVisaExp, _remarkImmig = remarkImmig, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PassportValid({String? id, required String empID, List<String>? ppLocation, List<String>? arrivStampUpload, List<String>? immigEmpUpload, List<String>? reEntryUpload, List<String>? arrivStampExp, String? immigRefNo, List<String>? ppSubmit, List<String>? empPassExp, List<String>? empPassStatus, List<String>? airTktStatus, List<String>? reEntryVisa, List<String>? immigApproval, List<String>? reEntryVisaExp, List<String>? remarkImmig}) {
    return PassportValid._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      ppLocation: ppLocation != null ? List<String>.unmodifiable(ppLocation) : ppLocation,
      arrivStampUpload: arrivStampUpload != null ? List<String>.unmodifiable(arrivStampUpload) : arrivStampUpload,
      immigEmpUpload: immigEmpUpload != null ? List<String>.unmodifiable(immigEmpUpload) : immigEmpUpload,
      reEntryUpload: reEntryUpload != null ? List<String>.unmodifiable(reEntryUpload) : reEntryUpload,
      arrivStampExp: arrivStampExp != null ? List<String>.unmodifiable(arrivStampExp) : arrivStampExp,
      immigRefNo: immigRefNo,
      ppSubmit: ppSubmit != null ? List<String>.unmodifiable(ppSubmit) : ppSubmit,
      empPassExp: empPassExp != null ? List<String>.unmodifiable(empPassExp) : empPassExp,
      empPassStatus: empPassStatus != null ? List<String>.unmodifiable(empPassStatus) : empPassStatus,
      airTktStatus: airTktStatus != null ? List<String>.unmodifiable(airTktStatus) : airTktStatus,
      reEntryVisa: reEntryVisa != null ? List<String>.unmodifiable(reEntryVisa) : reEntryVisa,
      immigApproval: immigApproval != null ? List<String>.unmodifiable(immigApproval) : immigApproval,
      reEntryVisaExp: reEntryVisaExp != null ? List<String>.unmodifiable(reEntryVisaExp) : reEntryVisaExp,
      remarkImmig: remarkImmig != null ? List<String>.unmodifiable(remarkImmig) : remarkImmig);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassportValid &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_ppLocation, other._ppLocation) &&
      DeepCollectionEquality().equals(_arrivStampUpload, other._arrivStampUpload) &&
      DeepCollectionEquality().equals(_immigEmpUpload, other._immigEmpUpload) &&
      DeepCollectionEquality().equals(_reEntryUpload, other._reEntryUpload) &&
      DeepCollectionEquality().equals(_arrivStampExp, other._arrivStampExp) &&
      _immigRefNo == other._immigRefNo &&
      DeepCollectionEquality().equals(_ppSubmit, other._ppSubmit) &&
      DeepCollectionEquality().equals(_empPassExp, other._empPassExp) &&
      DeepCollectionEquality().equals(_empPassStatus, other._empPassStatus) &&
      DeepCollectionEquality().equals(_airTktStatus, other._airTktStatus) &&
      DeepCollectionEquality().equals(_reEntryVisa, other._reEntryVisa) &&
      DeepCollectionEquality().equals(_immigApproval, other._immigApproval) &&
      DeepCollectionEquality().equals(_reEntryVisaExp, other._reEntryVisaExp) &&
      DeepCollectionEquality().equals(_remarkImmig, other._remarkImmig);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PassportValid {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("ppLocation=" + (_ppLocation != null ? _ppLocation!.toString() : "null") + ", ");
    buffer.write("arrivStampUpload=" + (_arrivStampUpload != null ? _arrivStampUpload!.toString() : "null") + ", ");
    buffer.write("immigEmpUpload=" + (_immigEmpUpload != null ? _immigEmpUpload!.toString() : "null") + ", ");
    buffer.write("reEntryUpload=" + (_reEntryUpload != null ? _reEntryUpload!.toString() : "null") + ", ");
    buffer.write("arrivStampExp=" + (_arrivStampExp != null ? _arrivStampExp!.toString() : "null") + ", ");
    buffer.write("immigRefNo=" + "$_immigRefNo" + ", ");
    buffer.write("ppSubmit=" + (_ppSubmit != null ? _ppSubmit!.toString() : "null") + ", ");
    buffer.write("empPassExp=" + (_empPassExp != null ? _empPassExp!.toString() : "null") + ", ");
    buffer.write("empPassStatus=" + (_empPassStatus != null ? _empPassStatus!.toString() : "null") + ", ");
    buffer.write("airTktStatus=" + (_airTktStatus != null ? _airTktStatus!.toString() : "null") + ", ");
    buffer.write("reEntryVisa=" + (_reEntryVisa != null ? _reEntryVisa!.toString() : "null") + ", ");
    buffer.write("immigApproval=" + (_immigApproval != null ? _immigApproval!.toString() : "null") + ", ");
    buffer.write("reEntryVisaExp=" + (_reEntryVisaExp != null ? _reEntryVisaExp!.toString() : "null") + ", ");
    buffer.write("remarkImmig=" + (_remarkImmig != null ? _remarkImmig!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PassportValid copyWith({String? empID, List<String>? ppLocation, List<String>? arrivStampUpload, List<String>? immigEmpUpload, List<String>? reEntryUpload, List<String>? arrivStampExp, String? immigRefNo, List<String>? ppSubmit, List<String>? empPassExp, List<String>? empPassStatus, List<String>? airTktStatus, List<String>? reEntryVisa, List<String>? immigApproval, List<String>? reEntryVisaExp, List<String>? remarkImmig}) {
    return PassportValid._internal(
      id: id,
      empID: empID ?? this.empID,
      ppLocation: ppLocation ?? this.ppLocation,
      arrivStampUpload: arrivStampUpload ?? this.arrivStampUpload,
      immigEmpUpload: immigEmpUpload ?? this.immigEmpUpload,
      reEntryUpload: reEntryUpload ?? this.reEntryUpload,
      arrivStampExp: arrivStampExp ?? this.arrivStampExp,
      immigRefNo: immigRefNo ?? this.immigRefNo,
      ppSubmit: ppSubmit ?? this.ppSubmit,
      empPassExp: empPassExp ?? this.empPassExp,
      empPassStatus: empPassStatus ?? this.empPassStatus,
      airTktStatus: airTktStatus ?? this.airTktStatus,
      reEntryVisa: reEntryVisa ?? this.reEntryVisa,
      immigApproval: immigApproval ?? this.immigApproval,
      reEntryVisaExp: reEntryVisaExp ?? this.reEntryVisaExp,
      remarkImmig: remarkImmig ?? this.remarkImmig);
  }
  
  PassportValid copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? ppLocation,
    ModelFieldValue<List<String>?>? arrivStampUpload,
    ModelFieldValue<List<String>?>? immigEmpUpload,
    ModelFieldValue<List<String>?>? reEntryUpload,
    ModelFieldValue<List<String>?>? arrivStampExp,
    ModelFieldValue<String?>? immigRefNo,
    ModelFieldValue<List<String>?>? ppSubmit,
    ModelFieldValue<List<String>?>? empPassExp,
    ModelFieldValue<List<String>?>? empPassStatus,
    ModelFieldValue<List<String>?>? airTktStatus,
    ModelFieldValue<List<String>?>? reEntryVisa,
    ModelFieldValue<List<String>?>? immigApproval,
    ModelFieldValue<List<String>?>? reEntryVisaExp,
    ModelFieldValue<List<String>?>? remarkImmig
  }) {
    return PassportValid._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      ppLocation: ppLocation == null ? this.ppLocation : ppLocation.value,
      arrivStampUpload: arrivStampUpload == null ? this.arrivStampUpload : arrivStampUpload.value,
      immigEmpUpload: immigEmpUpload == null ? this.immigEmpUpload : immigEmpUpload.value,
      reEntryUpload: reEntryUpload == null ? this.reEntryUpload : reEntryUpload.value,
      arrivStampExp: arrivStampExp == null ? this.arrivStampExp : arrivStampExp.value,
      immigRefNo: immigRefNo == null ? this.immigRefNo : immigRefNo.value,
      ppSubmit: ppSubmit == null ? this.ppSubmit : ppSubmit.value,
      empPassExp: empPassExp == null ? this.empPassExp : empPassExp.value,
      empPassStatus: empPassStatus == null ? this.empPassStatus : empPassStatus.value,
      airTktStatus: airTktStatus == null ? this.airTktStatus : airTktStatus.value,
      reEntryVisa: reEntryVisa == null ? this.reEntryVisa : reEntryVisa.value,
      immigApproval: immigApproval == null ? this.immigApproval : immigApproval.value,
      reEntryVisaExp: reEntryVisaExp == null ? this.reEntryVisaExp : reEntryVisaExp.value,
      remarkImmig: remarkImmig == null ? this.remarkImmig : remarkImmig.value
    );
  }
  
  PassportValid.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _ppLocation = json['ppLocation']?.cast<String>(),
      _arrivStampUpload = json['arrivStampUpload']?.cast<String>(),
      _immigEmpUpload = json['immigEmpUpload']?.cast<String>(),
      _reEntryUpload = json['reEntryUpload']?.cast<String>(),
      _arrivStampExp = json['arrivStampExp']?.cast<String>(),
      _immigRefNo = json['immigRefNo'],
      _ppSubmit = json['ppSubmit']?.cast<String>(),
      _empPassExp = json['empPassExp']?.cast<String>(),
      _empPassStatus = json['empPassStatus']?.cast<String>(),
      _airTktStatus = json['airTktStatus']?.cast<String>(),
      _reEntryVisa = json['reEntryVisa']?.cast<String>(),
      _immigApproval = json['immigApproval']?.cast<String>(),
      _reEntryVisaExp = json['reEntryVisaExp']?.cast<String>(),
      _remarkImmig = json['remarkImmig']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'ppLocation': _ppLocation, 'arrivStampUpload': _arrivStampUpload, 'immigEmpUpload': _immigEmpUpload, 'reEntryUpload': _reEntryUpload, 'arrivStampExp': _arrivStampExp, 'immigRefNo': _immigRefNo, 'ppSubmit': _ppSubmit, 'empPassExp': _empPassExp, 'empPassStatus': _empPassStatus, 'airTktStatus': _airTktStatus, 'reEntryVisa': _reEntryVisa, 'immigApproval': _immigApproval, 'reEntryVisaExp': _reEntryVisaExp, 'remarkImmig': _remarkImmig, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'ppLocation': _ppLocation,
    'arrivStampUpload': _arrivStampUpload,
    'immigEmpUpload': _immigEmpUpload,
    'reEntryUpload': _reEntryUpload,
    'arrivStampExp': _arrivStampExp,
    'immigRefNo': _immigRefNo,
    'ppSubmit': _ppSubmit,
    'empPassExp': _empPassExp,
    'empPassStatus': _empPassStatus,
    'airTktStatus': _airTktStatus,
    'reEntryVisa': _reEntryVisa,
    'immigApproval': _immigApproval,
    'reEntryVisaExp': _reEntryVisaExp,
    'remarkImmig': _remarkImmig,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PassportValidModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PassportValidModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final PPLOCATION = amplify_core.QueryField(fieldName: "ppLocation");
  static final ARRIVSTAMPUPLOAD = amplify_core.QueryField(fieldName: "arrivStampUpload");
  static final IMMIGEMPUPLOAD = amplify_core.QueryField(fieldName: "immigEmpUpload");
  static final REENTRYUPLOAD = amplify_core.QueryField(fieldName: "reEntryUpload");
  static final ARRIVSTAMPEXP = amplify_core.QueryField(fieldName: "arrivStampExp");
  static final IMMIGREFNO = amplify_core.QueryField(fieldName: "immigRefNo");
  static final PPSUBMIT = amplify_core.QueryField(fieldName: "ppSubmit");
  static final EMPPASSEXP = amplify_core.QueryField(fieldName: "empPassExp");
  static final EMPPASSSTATUS = amplify_core.QueryField(fieldName: "empPassStatus");
  static final AIRTKTSTATUS = amplify_core.QueryField(fieldName: "airTktStatus");
  static final REENTRYVISA = amplify_core.QueryField(fieldName: "reEntryVisa");
  static final IMMIGAPPROVAL = amplify_core.QueryField(fieldName: "immigApproval");
  static final REENTRYVISAEXP = amplify_core.QueryField(fieldName: "reEntryVisaExp");
  static final REMARKIMMIG = amplify_core.QueryField(fieldName: "remarkImmig");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PassportValid";
    modelSchemaDefinition.pluralName = "PassportValids";
    
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
      key: PassportValid.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.PPLOCATION,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.ARRIVSTAMPUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.IMMIGEMPUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.REENTRYUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.ARRIVSTAMPEXP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.IMMIGREFNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.PPSUBMIT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.EMPPASSEXP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.EMPPASSSTATUS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.AIRTKTSTATUS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.REENTRYVISA,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.IMMIGAPPROVAL,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.REENTRYVISAEXP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PassportValid.REMARKIMMIG,
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

class _PassportValidModelType extends amplify_core.ModelType<PassportValid> {
  const _PassportValidModelType();
  
  @override
  PassportValid fromJson(Map<String, dynamic> jsonData) {
    return PassportValid.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PassportValid';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PassportValid] in your schema.
 */
class PassportValidModelIdentifier implements amplify_core.ModelIdentifier<PassportValid> {
  final String id;

  /** Create an instance of PassportValidModelIdentifier using [id] the primary key. */
  const PassportValidModelIdentifier({
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
  String toString() => 'PassportValidModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PassportValidModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}