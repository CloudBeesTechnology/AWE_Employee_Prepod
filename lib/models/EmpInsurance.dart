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


/** This is an auto generated class representing the EmpInsurance type in your schema. */
class EmpInsurance extends amplify_core.Model {
  static const classType = const _EmpInsuranceModelType();
  final String id;
  final String? _empID;
  final List<String>? _groupIns;
  final List<String>? _groupInsEffectDate;
  final List<String>? _groupInsEndDate;
  final List<String>? _workmenComp;
  final List<String>? _workmePolicyNo;
  final List<String>? _travelIns;
  final List<String>? _accidentIns;
  final List<String>? _empInsUpload;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmpInsuranceModelIdentifier get modelIdentifier {
      return EmpInsuranceModelIdentifier(
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
  
  List<String>? get groupIns {
    return _groupIns;
  }
  
  List<String>? get groupInsEffectDate {
    return _groupInsEffectDate;
  }
  
  List<String>? get groupInsEndDate {
    return _groupInsEndDate;
  }
  
  List<String>? get workmenComp {
    return _workmenComp;
  }
  
  List<String>? get workmePolicyNo {
    return _workmePolicyNo;
  }
  
  List<String>? get travelIns {
    return _travelIns;
  }
  
  List<String>? get accidentIns {
    return _accidentIns;
  }
  
  List<String>? get empInsUpload {
    return _empInsUpload;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EmpInsurance._internal({required this.id, required empID, groupIns, groupInsEffectDate, groupInsEndDate, workmenComp, workmePolicyNo, travelIns, accidentIns, empInsUpload, createdAt, updatedAt}): _empID = empID, _groupIns = groupIns, _groupInsEffectDate = groupInsEffectDate, _groupInsEndDate = groupInsEndDate, _workmenComp = workmenComp, _workmePolicyNo = workmePolicyNo, _travelIns = travelIns, _accidentIns = accidentIns, _empInsUpload = empInsUpload, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmpInsurance({String? id, required String empID, List<String>? groupIns, List<String>? groupInsEffectDate, List<String>? groupInsEndDate, List<String>? workmenComp, List<String>? workmePolicyNo, List<String>? travelIns, List<String>? accidentIns, List<String>? empInsUpload}) {
    return EmpInsurance._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      groupIns: groupIns != null ? List<String>.unmodifiable(groupIns) : groupIns,
      groupInsEffectDate: groupInsEffectDate != null ? List<String>.unmodifiable(groupInsEffectDate) : groupInsEffectDate,
      groupInsEndDate: groupInsEndDate != null ? List<String>.unmodifiable(groupInsEndDate) : groupInsEndDate,
      workmenComp: workmenComp != null ? List<String>.unmodifiable(workmenComp) : workmenComp,
      workmePolicyNo: workmePolicyNo != null ? List<String>.unmodifiable(workmePolicyNo) : workmePolicyNo,
      travelIns: travelIns != null ? List<String>.unmodifiable(travelIns) : travelIns,
      accidentIns: accidentIns != null ? List<String>.unmodifiable(accidentIns) : accidentIns,
      empInsUpload: empInsUpload != null ? List<String>.unmodifiable(empInsUpload) : empInsUpload);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmpInsurance &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_groupIns, other._groupIns) &&
      DeepCollectionEquality().equals(_groupInsEffectDate, other._groupInsEffectDate) &&
      DeepCollectionEquality().equals(_groupInsEndDate, other._groupInsEndDate) &&
      DeepCollectionEquality().equals(_workmenComp, other._workmenComp) &&
      DeepCollectionEquality().equals(_workmePolicyNo, other._workmePolicyNo) &&
      DeepCollectionEquality().equals(_travelIns, other._travelIns) &&
      DeepCollectionEquality().equals(_accidentIns, other._accidentIns) &&
      DeepCollectionEquality().equals(_empInsUpload, other._empInsUpload);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmpInsurance {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("groupIns=" + (_groupIns != null ? _groupIns!.toString() : "null") + ", ");
    buffer.write("groupInsEffectDate=" + (_groupInsEffectDate != null ? _groupInsEffectDate!.toString() : "null") + ", ");
    buffer.write("groupInsEndDate=" + (_groupInsEndDate != null ? _groupInsEndDate!.toString() : "null") + ", ");
    buffer.write("workmenComp=" + (_workmenComp != null ? _workmenComp!.toString() : "null") + ", ");
    buffer.write("workmePolicyNo=" + (_workmePolicyNo != null ? _workmePolicyNo!.toString() : "null") + ", ");
    buffer.write("travelIns=" + (_travelIns != null ? _travelIns!.toString() : "null") + ", ");
    buffer.write("accidentIns=" + (_accidentIns != null ? _accidentIns!.toString() : "null") + ", ");
    buffer.write("empInsUpload=" + (_empInsUpload != null ? _empInsUpload!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmpInsurance copyWith({String? empID, List<String>? groupIns, List<String>? groupInsEffectDate, List<String>? groupInsEndDate, List<String>? workmenComp, List<String>? workmePolicyNo, List<String>? travelIns, List<String>? accidentIns, List<String>? empInsUpload}) {
    return EmpInsurance._internal(
      id: id,
      empID: empID ?? this.empID,
      groupIns: groupIns ?? this.groupIns,
      groupInsEffectDate: groupInsEffectDate ?? this.groupInsEffectDate,
      groupInsEndDate: groupInsEndDate ?? this.groupInsEndDate,
      workmenComp: workmenComp ?? this.workmenComp,
      workmePolicyNo: workmePolicyNo ?? this.workmePolicyNo,
      travelIns: travelIns ?? this.travelIns,
      accidentIns: accidentIns ?? this.accidentIns,
      empInsUpload: empInsUpload ?? this.empInsUpload);
  }
  
  EmpInsurance copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>>? groupIns,
    ModelFieldValue<List<String>>? groupInsEffectDate,
    ModelFieldValue<List<String>>? groupInsEndDate,
    ModelFieldValue<List<String>>? workmenComp,
    ModelFieldValue<List<String>?>? workmePolicyNo,
    ModelFieldValue<List<String>?>? travelIns,
    ModelFieldValue<List<String>?>? accidentIns,
    ModelFieldValue<List<String>?>? empInsUpload
  }) {
    return EmpInsurance._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      groupIns: groupIns == null ? this.groupIns : groupIns.value,
      groupInsEffectDate: groupInsEffectDate == null ? this.groupInsEffectDate : groupInsEffectDate.value,
      groupInsEndDate: groupInsEndDate == null ? this.groupInsEndDate : groupInsEndDate.value,
      workmenComp: workmenComp == null ? this.workmenComp : workmenComp.value,
      workmePolicyNo: workmePolicyNo == null ? this.workmePolicyNo : workmePolicyNo.value,
      travelIns: travelIns == null ? this.travelIns : travelIns.value,
      accidentIns: accidentIns == null ? this.accidentIns : accidentIns.value,
      empInsUpload: empInsUpload == null ? this.empInsUpload : empInsUpload.value
    );
  }
  
  EmpInsurance.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _groupIns = json['groupIns']?.cast<String>(),
      _groupInsEffectDate = json['groupInsEffectDate']?.cast<String>(),
      _groupInsEndDate = json['groupInsEndDate']?.cast<String>(),
      _workmenComp = json['workmenComp']?.cast<String>(),
      _workmePolicyNo = json['workmePolicyNo']?.cast<String>(),
      _travelIns = json['travelIns']?.cast<String>(),
      _accidentIns = json['accidentIns']?.cast<String>(),
      _empInsUpload = json['empInsUpload']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'groupIns': _groupIns, 'groupInsEffectDate': _groupInsEffectDate, 'groupInsEndDate': _groupInsEndDate, 'workmenComp': _workmenComp, 'workmePolicyNo': _workmePolicyNo, 'travelIns': _travelIns, 'accidentIns': _accidentIns, 'empInsUpload': _empInsUpload, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'groupIns': _groupIns,
    'groupInsEffectDate': _groupInsEffectDate,
    'groupInsEndDate': _groupInsEndDate,
    'workmenComp': _workmenComp,
    'workmePolicyNo': _workmePolicyNo,
    'travelIns': _travelIns,
    'accidentIns': _accidentIns,
    'empInsUpload': _empInsUpload,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmpInsuranceModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmpInsuranceModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final GROUPINS = amplify_core.QueryField(fieldName: "groupIns");
  static final GROUPINSEFFECTDATE = amplify_core.QueryField(fieldName: "groupInsEffectDate");
  static final GROUPINSENDDATE = amplify_core.QueryField(fieldName: "groupInsEndDate");
  static final WORKMENCOMP = amplify_core.QueryField(fieldName: "workmenComp");
  static final WORKMEPOLICYNO = amplify_core.QueryField(fieldName: "workmePolicyNo");
  static final TRAVELINS = amplify_core.QueryField(fieldName: "travelIns");
  static final ACCIDENTINS = amplify_core.QueryField(fieldName: "accidentIns");
  static final EMPINSUPLOAD = amplify_core.QueryField(fieldName: "empInsUpload");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmpInsurance";
    modelSchemaDefinition.pluralName = "EmpInsurances";
    
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
      key: EmpInsurance.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.GROUPINS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.GROUPINSEFFECTDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.GROUPINSENDDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.WORKMENCOMP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.WORKMEPOLICYNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.TRAVELINS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.ACCIDENTINS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpInsurance.EMPINSUPLOAD,
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

class _EmpInsuranceModelType extends amplify_core.ModelType<EmpInsurance> {
  const _EmpInsuranceModelType();
  
  @override
  EmpInsurance fromJson(Map<String, dynamic> jsonData) {
    return EmpInsurance.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmpInsurance';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmpInsurance] in your schema.
 */
class EmpInsuranceModelIdentifier implements amplify_core.ModelIdentifier<EmpInsurance> {
  final String id;

  /** Create an instance of EmpInsuranceModelIdentifier using [id] the primary key. */
  const EmpInsuranceModelIdentifier({
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
  String toString() => 'EmpInsuranceModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmpInsuranceModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}