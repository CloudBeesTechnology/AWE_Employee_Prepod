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


/** This is an auto generated class representing the EmpLeaveDetails type in your schema. */
class EmpLeaveDetails extends amplify_core.Model {
  static const classType = const _EmpLeaveDetailsModelType();
  final String id;
  final String? _empID;
  final List<String>? _annualLeave;
  final List<String>? _annualLeaveDate;
  final String? _compasLeave;
  final String? _compasLeaveDate;
  final List<String>? _destinateLeavePass;
  final List<String>? _durLeavePass;
  final List<String>? _dateLeavePass;
  final List<String>? _leavePass;
  final List<String>? _materLeave;
  final List<String>? _materLeaveDate;
  final String? _mrageLeave;
  final String? _mrageLeaveDate;
  final List<String>? _paterLeave;
  final List<String>? _paterLeaveDate;
  final String? _sickLeave;
  final String? _sickLeaveDate;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmpLeaveDetailsModelIdentifier get modelIdentifier {
      return EmpLeaveDetailsModelIdentifier(
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
  
  List<String>? get annualLeave {
    return _annualLeave;
  }
  
  List<String>? get annualLeaveDate {
    return _annualLeaveDate;
  }
  
  String? get compasLeave {
    return _compasLeave;
  }
  
  String? get compasLeaveDate {
    return _compasLeaveDate;
  }
  
  List<String>? get destinateLeavePass {
    return _destinateLeavePass;
  }
  
  List<String>? get durLeavePass {
    return _durLeavePass;
  }
  
  List<String>? get dateLeavePass {
    return _dateLeavePass;
  }
  
  List<String>? get leavePass {
    return _leavePass;
  }
  
  List<String>? get materLeave {
    return _materLeave;
  }
  
  List<String>? get materLeaveDate {
    return _materLeaveDate;
  }
  
  String? get mrageLeave {
    return _mrageLeave;
  }
  
  String? get mrageLeaveDate {
    return _mrageLeaveDate;
  }
  
  List<String>? get paterLeave {
    return _paterLeave;
  }
  
  List<String>? get paterLeaveDate {
    return _paterLeaveDate;
  }
  
  String? get sickLeave {
    return _sickLeave;
  }
  
  String? get sickLeaveDate {
    return _sickLeaveDate;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EmpLeaveDetails._internal({required this.id, required empID, annualLeave, annualLeaveDate, compasLeave, compasLeaveDate, destinateLeavePass, durLeavePass, dateLeavePass, leavePass, materLeave, materLeaveDate, mrageLeave, mrageLeaveDate, paterLeave, paterLeaveDate, sickLeave, sickLeaveDate, createdAt, updatedAt}): _empID = empID, _annualLeave = annualLeave, _annualLeaveDate = annualLeaveDate, _compasLeave = compasLeave, _compasLeaveDate = compasLeaveDate, _destinateLeavePass = destinateLeavePass, _durLeavePass = durLeavePass, _dateLeavePass = dateLeavePass, _leavePass = leavePass, _materLeave = materLeave, _materLeaveDate = materLeaveDate, _mrageLeave = mrageLeave, _mrageLeaveDate = mrageLeaveDate, _paterLeave = paterLeave, _paterLeaveDate = paterLeaveDate, _sickLeave = sickLeave, _sickLeaveDate = sickLeaveDate, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EmpLeaveDetails({String? id, required String empID, List<String>? annualLeave, List<String>? annualLeaveDate, String? compasLeave, String? compasLeaveDate, List<String>? destinateLeavePass, List<String>? durLeavePass, List<String>? dateLeavePass, List<String>? leavePass, List<String>? materLeave, List<String>? materLeaveDate, String? mrageLeave, String? mrageLeaveDate, List<String>? paterLeave, List<String>? paterLeaveDate, String? sickLeave, String? sickLeaveDate}) {
    return EmpLeaveDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      annualLeave: annualLeave != null ? List<String>.unmodifiable(annualLeave) : annualLeave,
      annualLeaveDate: annualLeaveDate != null ? List<String>.unmodifiable(annualLeaveDate) : annualLeaveDate,
      compasLeave: compasLeave,
      compasLeaveDate: compasLeaveDate,
      destinateLeavePass: destinateLeavePass != null ? List<String>.unmodifiable(destinateLeavePass) : destinateLeavePass,
      durLeavePass: durLeavePass != null ? List<String>.unmodifiable(durLeavePass) : durLeavePass,
      dateLeavePass: dateLeavePass != null ? List<String>.unmodifiable(dateLeavePass) : dateLeavePass,
      leavePass: leavePass != null ? List<String>.unmodifiable(leavePass) : leavePass,
      materLeave: materLeave != null ? List<String>.unmodifiable(materLeave) : materLeave,
      materLeaveDate: materLeaveDate != null ? List<String>.unmodifiable(materLeaveDate) : materLeaveDate,
      mrageLeave: mrageLeave,
      mrageLeaveDate: mrageLeaveDate,
      paterLeave: paterLeave != null ? List<String>.unmodifiable(paterLeave) : paterLeave,
      paterLeaveDate: paterLeaveDate != null ? List<String>.unmodifiable(paterLeaveDate) : paterLeaveDate,
      sickLeave: sickLeave,
      sickLeaveDate: sickLeaveDate);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmpLeaveDetails &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_annualLeave, other._annualLeave) &&
      DeepCollectionEquality().equals(_annualLeaveDate, other._annualLeaveDate) &&
      _compasLeave == other._compasLeave &&
      _compasLeaveDate == other._compasLeaveDate &&
      DeepCollectionEquality().equals(_destinateLeavePass, other._destinateLeavePass) &&
      DeepCollectionEquality().equals(_durLeavePass, other._durLeavePass) &&
      DeepCollectionEquality().equals(_dateLeavePass, other._dateLeavePass) &&
      DeepCollectionEquality().equals(_leavePass, other._leavePass) &&
      DeepCollectionEquality().equals(_materLeave, other._materLeave) &&
      DeepCollectionEquality().equals(_materLeaveDate, other._materLeaveDate) &&
      _mrageLeave == other._mrageLeave &&
      _mrageLeaveDate == other._mrageLeaveDate &&
      DeepCollectionEquality().equals(_paterLeave, other._paterLeave) &&
      DeepCollectionEquality().equals(_paterLeaveDate, other._paterLeaveDate) &&
      _sickLeave == other._sickLeave &&
      _sickLeaveDate == other._sickLeaveDate;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EmpLeaveDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("annualLeave=" + (_annualLeave != null ? _annualLeave!.toString() : "null") + ", ");
    buffer.write("annualLeaveDate=" + (_annualLeaveDate != null ? _annualLeaveDate!.toString() : "null") + ", ");
    buffer.write("compasLeave=" + "$_compasLeave" + ", ");
    buffer.write("compasLeaveDate=" + "$_compasLeaveDate" + ", ");
    buffer.write("destinateLeavePass=" + (_destinateLeavePass != null ? _destinateLeavePass!.toString() : "null") + ", ");
    buffer.write("durLeavePass=" + (_durLeavePass != null ? _durLeavePass!.toString() : "null") + ", ");
    buffer.write("dateLeavePass=" + (_dateLeavePass != null ? _dateLeavePass!.toString() : "null") + ", ");
    buffer.write("leavePass=" + (_leavePass != null ? _leavePass!.toString() : "null") + ", ");
    buffer.write("materLeave=" + (_materLeave != null ? _materLeave!.toString() : "null") + ", ");
    buffer.write("materLeaveDate=" + (_materLeaveDate != null ? _materLeaveDate!.toString() : "null") + ", ");
    buffer.write("mrageLeave=" + "$_mrageLeave" + ", ");
    buffer.write("mrageLeaveDate=" + "$_mrageLeaveDate" + ", ");
    buffer.write("paterLeave=" + (_paterLeave != null ? _paterLeave!.toString() : "null") + ", ");
    buffer.write("paterLeaveDate=" + (_paterLeaveDate != null ? _paterLeaveDate!.toString() : "null") + ", ");
    buffer.write("sickLeave=" + "$_sickLeave" + ", ");
    buffer.write("sickLeaveDate=" + "$_sickLeaveDate" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EmpLeaveDetails copyWith({String? empID, List<String>? annualLeave, List<String>? annualLeaveDate, String? compasLeave, String? compasLeaveDate, List<String>? destinateLeavePass, List<String>? durLeavePass, List<String>? dateLeavePass, List<String>? leavePass, List<String>? materLeave, List<String>? materLeaveDate, String? mrageLeave, String? mrageLeaveDate, List<String>? paterLeave, List<String>? paterLeaveDate, String? sickLeave, String? sickLeaveDate}) {
    return EmpLeaveDetails._internal(
      id: id,
      empID: empID ?? this.empID,
      annualLeave: annualLeave ?? this.annualLeave,
      annualLeaveDate: annualLeaveDate ?? this.annualLeaveDate,
      compasLeave: compasLeave ?? this.compasLeave,
      compasLeaveDate: compasLeaveDate ?? this.compasLeaveDate,
      destinateLeavePass: destinateLeavePass ?? this.destinateLeavePass,
      durLeavePass: durLeavePass ?? this.durLeavePass,
      dateLeavePass: dateLeavePass ?? this.dateLeavePass,
      leavePass: leavePass ?? this.leavePass,
      materLeave: materLeave ?? this.materLeave,
      materLeaveDate: materLeaveDate ?? this.materLeaveDate,
      mrageLeave: mrageLeave ?? this.mrageLeave,
      mrageLeaveDate: mrageLeaveDate ?? this.mrageLeaveDate,
      paterLeave: paterLeave ?? this.paterLeave,
      paterLeaveDate: paterLeaveDate ?? this.paterLeaveDate,
      sickLeave: sickLeave ?? this.sickLeave,
      sickLeaveDate: sickLeaveDate ?? this.sickLeaveDate);
  }
  
  EmpLeaveDetails copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? annualLeave,
    ModelFieldValue<List<String>?>? annualLeaveDate,
    ModelFieldValue<String?>? compasLeave,
    ModelFieldValue<String?>? compasLeaveDate,
    ModelFieldValue<List<String>?>? destinateLeavePass,
    ModelFieldValue<List<String>?>? durLeavePass,
    ModelFieldValue<List<String>?>? dateLeavePass,
    ModelFieldValue<List<String>?>? leavePass,
    ModelFieldValue<List<String>?>? materLeave,
    ModelFieldValue<List<String>?>? materLeaveDate,
    ModelFieldValue<String?>? mrageLeave,
    ModelFieldValue<String?>? mrageLeaveDate,
    ModelFieldValue<List<String>?>? paterLeave,
    ModelFieldValue<List<String>?>? paterLeaveDate,
    ModelFieldValue<String?>? sickLeave,
    ModelFieldValue<String?>? sickLeaveDate
  }) {
    return EmpLeaveDetails._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      annualLeave: annualLeave == null ? this.annualLeave : annualLeave.value,
      annualLeaveDate: annualLeaveDate == null ? this.annualLeaveDate : annualLeaveDate.value,
      compasLeave: compasLeave == null ? this.compasLeave : compasLeave.value,
      compasLeaveDate: compasLeaveDate == null ? this.compasLeaveDate : compasLeaveDate.value,
      destinateLeavePass: destinateLeavePass == null ? this.destinateLeavePass : destinateLeavePass.value,
      durLeavePass: durLeavePass == null ? this.durLeavePass : durLeavePass.value,
      dateLeavePass: dateLeavePass == null ? this.dateLeavePass : dateLeavePass.value,
      leavePass: leavePass == null ? this.leavePass : leavePass.value,
      materLeave: materLeave == null ? this.materLeave : materLeave.value,
      materLeaveDate: materLeaveDate == null ? this.materLeaveDate : materLeaveDate.value,
      mrageLeave: mrageLeave == null ? this.mrageLeave : mrageLeave.value,
      mrageLeaveDate: mrageLeaveDate == null ? this.mrageLeaveDate : mrageLeaveDate.value,
      paterLeave: paterLeave == null ? this.paterLeave : paterLeave.value,
      paterLeaveDate: paterLeaveDate == null ? this.paterLeaveDate : paterLeaveDate.value,
      sickLeave: sickLeave == null ? this.sickLeave : sickLeave.value,
      sickLeaveDate: sickLeaveDate == null ? this.sickLeaveDate : sickLeaveDate.value
    );
  }
  
  EmpLeaveDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _annualLeave = json['annualLeave']?.cast<String>(),
      _annualLeaveDate = json['annualLeaveDate']?.cast<String>(),
      _compasLeave = json['compasLeave'],
      _compasLeaveDate = json['compasLeaveDate'],
      _destinateLeavePass = json['destinateLeavePass']?.cast<String>(),
      _durLeavePass = json['durLeavePass']?.cast<String>(),
      _dateLeavePass = json['dateLeavePass']?.cast<String>(),
      _leavePass = json['leavePass']?.cast<String>(),
      _materLeave = json['materLeave']?.cast<String>(),
      _materLeaveDate = json['materLeaveDate']?.cast<String>(),
      _mrageLeave = json['mrageLeave'],
      _mrageLeaveDate = json['mrageLeaveDate'],
      _paterLeave = json['paterLeave']?.cast<String>(),
      _paterLeaveDate = json['paterLeaveDate']?.cast<String>(),
      _sickLeave = json['sickLeave'],
      _sickLeaveDate = json['sickLeaveDate'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'annualLeave': _annualLeave, 'annualLeaveDate': _annualLeaveDate, 'compasLeave': _compasLeave, 'compasLeaveDate': _compasLeaveDate, 'destinateLeavePass': _destinateLeavePass, 'durLeavePass': _durLeavePass, 'dateLeavePass': _dateLeavePass, 'leavePass': _leavePass, 'materLeave': _materLeave, 'materLeaveDate': _materLeaveDate, 'mrageLeave': _mrageLeave, 'mrageLeaveDate': _mrageLeaveDate, 'paterLeave': _paterLeave, 'paterLeaveDate': _paterLeaveDate, 'sickLeave': _sickLeave, 'sickLeaveDate': _sickLeaveDate, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'annualLeave': _annualLeave,
    'annualLeaveDate': _annualLeaveDate,
    'compasLeave': _compasLeave,
    'compasLeaveDate': _compasLeaveDate,
    'destinateLeavePass': _destinateLeavePass,
    'durLeavePass': _durLeavePass,
    'dateLeavePass': _dateLeavePass,
    'leavePass': _leavePass,
    'materLeave': _materLeave,
    'materLeaveDate': _materLeaveDate,
    'mrageLeave': _mrageLeave,
    'mrageLeaveDate': _mrageLeaveDate,
    'paterLeave': _paterLeave,
    'paterLeaveDate': _paterLeaveDate,
    'sickLeave': _sickLeave,
    'sickLeaveDate': _sickLeaveDate,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmpLeaveDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmpLeaveDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final ANNUALLEAVE = amplify_core.QueryField(fieldName: "annualLeave");
  static final ANNUALLEAVEDATE = amplify_core.QueryField(fieldName: "annualLeaveDate");
  static final COMPASLEAVE = amplify_core.QueryField(fieldName: "compasLeave");
  static final COMPASLEAVEDATE = amplify_core.QueryField(fieldName: "compasLeaveDate");
  static final DESTINATELEAVEPASS = amplify_core.QueryField(fieldName: "destinateLeavePass");
  static final DURLEAVEPASS = amplify_core.QueryField(fieldName: "durLeavePass");
  static final DATELEAVEPASS = amplify_core.QueryField(fieldName: "dateLeavePass");
  static final LEAVEPASS = amplify_core.QueryField(fieldName: "leavePass");
  static final MATERLEAVE = amplify_core.QueryField(fieldName: "materLeave");
  static final MATERLEAVEDATE = amplify_core.QueryField(fieldName: "materLeaveDate");
  static final MRAGELEAVE = amplify_core.QueryField(fieldName: "mrageLeave");
  static final MRAGELEAVEDATE = amplify_core.QueryField(fieldName: "mrageLeaveDate");
  static final PATERLEAVE = amplify_core.QueryField(fieldName: "paterLeave");
  static final PATERLEAVEDATE = amplify_core.QueryField(fieldName: "paterLeaveDate");
  static final SICKLEAVE = amplify_core.QueryField(fieldName: "sickLeave");
  static final SICKLEAVEDATE = amplify_core.QueryField(fieldName: "sickLeaveDate");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EmpLeaveDetails";
    modelSchemaDefinition.pluralName = "EmpLeaveDetails";
    
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
      key: EmpLeaveDetails.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.ANNUALLEAVE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.ANNUALLEAVEDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.COMPASLEAVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.COMPASLEAVEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.DESTINATELEAVEPASS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.DURLEAVEPASS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.DATELEAVEPASS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.LEAVEPASS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.MATERLEAVE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.MATERLEAVEDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.MRAGELEAVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.MRAGELEAVEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.PATERLEAVE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.PATERLEAVEDATE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.SICKLEAVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EmpLeaveDetails.SICKLEAVEDATE,
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

class _EmpLeaveDetailsModelType extends amplify_core.ModelType<EmpLeaveDetails> {
  const _EmpLeaveDetailsModelType();
  
  @override
  EmpLeaveDetails fromJson(Map<String, dynamic> jsonData) {
    return EmpLeaveDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EmpLeaveDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EmpLeaveDetails] in your schema.
 */
class EmpLeaveDetailsModelIdentifier implements amplify_core.ModelIdentifier<EmpLeaveDetails> {
  final String id;

  /** Create an instance of EmpLeaveDetailsModelIdentifier using [id] the primary key. */
  const EmpLeaveDetailsModelIdentifier({
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
  String toString() => 'EmpLeaveDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmpLeaveDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}