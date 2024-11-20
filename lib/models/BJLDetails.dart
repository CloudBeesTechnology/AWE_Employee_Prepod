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


/** This is an auto generated class representing the BJLDetails type in your schema. */
class BJLDetails extends amplify_core.Model {
  static const classType = const _BJLDetailsModelType();
  final String id;
  final String? _empID;
  final List<String>? _bankSubmit;
  final List<String>? _bankRece;
  final List<String>? _bankRefNo;
  final List<String>? _bankAmt;
  final List<String>? _bankValid;
  final List<String>? _bankEndorse;
  final List<String>? _bankEmpUpload;
  final List<String>? _tbaPurchase;
  final List<String>? _jitpaAmt;
  final List<String>? _jpValid;
  final List<String>? _jpEndorse;
  final List<String>? _jpEmpUpload;
  final List<String>? _lbrReceiptNo;
  final List<String>? _lbrDepoAmt;
  final List<String>? _lbrDepoSubmit;
  final List<String>? _lbrDepoUpload;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BJLDetailsModelIdentifier get modelIdentifier {
      return BJLDetailsModelIdentifier(
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
  
  List<String>? get bankSubmit {
    return _bankSubmit;
  }
  
  List<String>? get bankRece {
    return _bankRece;
  }
  
  List<String>? get bankRefNo {
    return _bankRefNo;
  }
  
  List<String>? get bankAmt {
    return _bankAmt;
  }
  
  List<String>? get bankValid {
    return _bankValid;
  }
  
  List<String>? get bankEndorse {
    return _bankEndorse;
  }
  
  List<String>? get bankEmpUpload {
    return _bankEmpUpload;
  }
  
  List<String>? get tbaPurchase {
    return _tbaPurchase;
  }
  
  List<String>? get jitpaAmt {
    return _jitpaAmt;
  }
  
  List<String>? get jpValid {
    return _jpValid;
  }
  
  List<String>? get jpEndorse {
    return _jpEndorse;
  }
  
  List<String>? get jpEmpUpload {
    return _jpEmpUpload;
  }
  
  List<String>? get lbrReceiptNo {
    return _lbrReceiptNo;
  }
  
  List<String>? get lbrDepoAmt {
    return _lbrDepoAmt;
  }
  
  List<String>? get lbrDepoSubmit {
    return _lbrDepoSubmit;
  }
  
  List<String>? get lbrDepoUpload {
    return _lbrDepoUpload;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const BJLDetails._internal({required this.id, required empID, bankSubmit, bankRece, bankRefNo, bankAmt, bankValid, bankEndorse, bankEmpUpload, tbaPurchase, jitpaAmt, jpValid, jpEndorse, jpEmpUpload, lbrReceiptNo, lbrDepoAmt, lbrDepoSubmit, lbrDepoUpload, createdAt, updatedAt}): _empID = empID, _bankSubmit = bankSubmit, _bankRece = bankRece, _bankRefNo = bankRefNo, _bankAmt = bankAmt, _bankValid = bankValid, _bankEndorse = bankEndorse, _bankEmpUpload = bankEmpUpload, _tbaPurchase = tbaPurchase, _jitpaAmt = jitpaAmt, _jpValid = jpValid, _jpEndorse = jpEndorse, _jpEmpUpload = jpEmpUpload, _lbrReceiptNo = lbrReceiptNo, _lbrDepoAmt = lbrDepoAmt, _lbrDepoSubmit = lbrDepoSubmit, _lbrDepoUpload = lbrDepoUpload, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory BJLDetails({String? id, required String empID, List<String>? bankSubmit, List<String>? bankRece, List<String>? bankRefNo, List<String>? bankAmt, List<String>? bankValid, List<String>? bankEndorse, List<String>? bankEmpUpload, List<String>? tbaPurchase, List<String>? jitpaAmt, List<String>? jpValid, List<String>? jpEndorse, List<String>? jpEmpUpload, List<String>? lbrReceiptNo, List<String>? lbrDepoAmt, List<String>? lbrDepoSubmit, List<String>? lbrDepoUpload}) {
    return BJLDetails._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      empID: empID,
      bankSubmit: bankSubmit != null ? List<String>.unmodifiable(bankSubmit) : bankSubmit,
      bankRece: bankRece != null ? List<String>.unmodifiable(bankRece) : bankRece,
      bankRefNo: bankRefNo != null ? List<String>.unmodifiable(bankRefNo) : bankRefNo,
      bankAmt: bankAmt != null ? List<String>.unmodifiable(bankAmt) : bankAmt,
      bankValid: bankValid != null ? List<String>.unmodifiable(bankValid) : bankValid,
      bankEndorse: bankEndorse != null ? List<String>.unmodifiable(bankEndorse) : bankEndorse,
      bankEmpUpload: bankEmpUpload != null ? List<String>.unmodifiable(bankEmpUpload) : bankEmpUpload,
      tbaPurchase: tbaPurchase != null ? List<String>.unmodifiable(tbaPurchase) : tbaPurchase,
      jitpaAmt: jitpaAmt != null ? List<String>.unmodifiable(jitpaAmt) : jitpaAmt,
      jpValid: jpValid != null ? List<String>.unmodifiable(jpValid) : jpValid,
      jpEndorse: jpEndorse != null ? List<String>.unmodifiable(jpEndorse) : jpEndorse,
      jpEmpUpload: jpEmpUpload != null ? List<String>.unmodifiable(jpEmpUpload) : jpEmpUpload,
      lbrReceiptNo: lbrReceiptNo != null ? List<String>.unmodifiable(lbrReceiptNo) : lbrReceiptNo,
      lbrDepoAmt: lbrDepoAmt != null ? List<String>.unmodifiable(lbrDepoAmt) : lbrDepoAmt,
      lbrDepoSubmit: lbrDepoSubmit != null ? List<String>.unmodifiable(lbrDepoSubmit) : lbrDepoSubmit,
      lbrDepoUpload: lbrDepoUpload != null ? List<String>.unmodifiable(lbrDepoUpload) : lbrDepoUpload);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BJLDetails &&
      id == other.id &&
      _empID == other._empID &&
      DeepCollectionEquality().equals(_bankSubmit, other._bankSubmit) &&
      DeepCollectionEquality().equals(_bankRece, other._bankRece) &&
      DeepCollectionEquality().equals(_bankRefNo, other._bankRefNo) &&
      DeepCollectionEquality().equals(_bankAmt, other._bankAmt) &&
      DeepCollectionEquality().equals(_bankValid, other._bankValid) &&
      DeepCollectionEquality().equals(_bankEndorse, other._bankEndorse) &&
      DeepCollectionEquality().equals(_bankEmpUpload, other._bankEmpUpload) &&
      DeepCollectionEquality().equals(_tbaPurchase, other._tbaPurchase) &&
      DeepCollectionEquality().equals(_jitpaAmt, other._jitpaAmt) &&
      DeepCollectionEquality().equals(_jpValid, other._jpValid) &&
      DeepCollectionEquality().equals(_jpEndorse, other._jpEndorse) &&
      DeepCollectionEquality().equals(_jpEmpUpload, other._jpEmpUpload) &&
      DeepCollectionEquality().equals(_lbrReceiptNo, other._lbrReceiptNo) &&
      DeepCollectionEquality().equals(_lbrDepoAmt, other._lbrDepoAmt) &&
      DeepCollectionEquality().equals(_lbrDepoSubmit, other._lbrDepoSubmit) &&
      DeepCollectionEquality().equals(_lbrDepoUpload, other._lbrDepoUpload);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("BJLDetails {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("empID=" + "$_empID" + ", ");
    buffer.write("bankSubmit=" + (_bankSubmit != null ? _bankSubmit!.toString() : "null") + ", ");
    buffer.write("bankRece=" + (_bankRece != null ? _bankRece!.toString() : "null") + ", ");
    buffer.write("bankRefNo=" + (_bankRefNo != null ? _bankRefNo!.toString() : "null") + ", ");
    buffer.write("bankAmt=" + (_bankAmt != null ? _bankAmt!.toString() : "null") + ", ");
    buffer.write("bankValid=" + (_bankValid != null ? _bankValid!.toString() : "null") + ", ");
    buffer.write("bankEndorse=" + (_bankEndorse != null ? _bankEndorse!.toString() : "null") + ", ");
    buffer.write("bankEmpUpload=" + (_bankEmpUpload != null ? _bankEmpUpload!.toString() : "null") + ", ");
    buffer.write("tbaPurchase=" + (_tbaPurchase != null ? _tbaPurchase!.toString() : "null") + ", ");
    buffer.write("jitpaAmt=" + (_jitpaAmt != null ? _jitpaAmt!.toString() : "null") + ", ");
    buffer.write("jpValid=" + (_jpValid != null ? _jpValid!.toString() : "null") + ", ");
    buffer.write("jpEndorse=" + (_jpEndorse != null ? _jpEndorse!.toString() : "null") + ", ");
    buffer.write("jpEmpUpload=" + (_jpEmpUpload != null ? _jpEmpUpload!.toString() : "null") + ", ");
    buffer.write("lbrReceiptNo=" + (_lbrReceiptNo != null ? _lbrReceiptNo!.toString() : "null") + ", ");
    buffer.write("lbrDepoAmt=" + (_lbrDepoAmt != null ? _lbrDepoAmt!.toString() : "null") + ", ");
    buffer.write("lbrDepoSubmit=" + (_lbrDepoSubmit != null ? _lbrDepoSubmit!.toString() : "null") + ", ");
    buffer.write("lbrDepoUpload=" + (_lbrDepoUpload != null ? _lbrDepoUpload!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  BJLDetails copyWith({String? empID, List<String>? bankSubmit, List<String>? bankRece, List<String>? bankRefNo, List<String>? bankAmt, List<String>? bankValid, List<String>? bankEndorse, List<String>? bankEmpUpload, List<String>? tbaPurchase, List<String>? jitpaAmt, List<String>? jpValid, List<String>? jpEndorse, List<String>? jpEmpUpload, List<String>? lbrReceiptNo, List<String>? lbrDepoAmt, List<String>? lbrDepoSubmit, List<String>? lbrDepoUpload}) {
    return BJLDetails._internal(
      id: id,
      empID: empID ?? this.empID,
      bankSubmit: bankSubmit ?? this.bankSubmit,
      bankRece: bankRece ?? this.bankRece,
      bankRefNo: bankRefNo ?? this.bankRefNo,
      bankAmt: bankAmt ?? this.bankAmt,
      bankValid: bankValid ?? this.bankValid,
      bankEndorse: bankEndorse ?? this.bankEndorse,
      bankEmpUpload: bankEmpUpload ?? this.bankEmpUpload,
      tbaPurchase: tbaPurchase ?? this.tbaPurchase,
      jitpaAmt: jitpaAmt ?? this.jitpaAmt,
      jpValid: jpValid ?? this.jpValid,
      jpEndorse: jpEndorse ?? this.jpEndorse,
      jpEmpUpload: jpEmpUpload ?? this.jpEmpUpload,
      lbrReceiptNo: lbrReceiptNo ?? this.lbrReceiptNo,
      lbrDepoAmt: lbrDepoAmt ?? this.lbrDepoAmt,
      lbrDepoSubmit: lbrDepoSubmit ?? this.lbrDepoSubmit,
      lbrDepoUpload: lbrDepoUpload ?? this.lbrDepoUpload);
  }
  
  BJLDetails copyWithModelFieldValues({
    ModelFieldValue<String>? empID,
    ModelFieldValue<List<String>?>? bankSubmit,
    ModelFieldValue<List<String>?>? bankRece,
    ModelFieldValue<List<String>?>? bankRefNo,
    ModelFieldValue<List<String>?>? bankAmt,
    ModelFieldValue<List<String>?>? bankValid,
    ModelFieldValue<List<String>?>? bankEndorse,
    ModelFieldValue<List<String>?>? bankEmpUpload,
    ModelFieldValue<List<String>?>? tbaPurchase,
    ModelFieldValue<List<String>?>? jitpaAmt,
    ModelFieldValue<List<String>?>? jpValid,
    ModelFieldValue<List<String>?>? jpEndorse,
    ModelFieldValue<List<String>?>? jpEmpUpload,
    ModelFieldValue<List<String>?>? lbrReceiptNo,
    ModelFieldValue<List<String>?>? lbrDepoAmt,
    ModelFieldValue<List<String>?>? lbrDepoSubmit,
    ModelFieldValue<List<String>?>? lbrDepoUpload
  }) {
    return BJLDetails._internal(
      id: id,
      empID: empID == null ? this.empID : empID.value,
      bankSubmit: bankSubmit == null ? this.bankSubmit : bankSubmit.value,
      bankRece: bankRece == null ? this.bankRece : bankRece.value,
      bankRefNo: bankRefNo == null ? this.bankRefNo : bankRefNo.value,
      bankAmt: bankAmt == null ? this.bankAmt : bankAmt.value,
      bankValid: bankValid == null ? this.bankValid : bankValid.value,
      bankEndorse: bankEndorse == null ? this.bankEndorse : bankEndorse.value,
      bankEmpUpload: bankEmpUpload == null ? this.bankEmpUpload : bankEmpUpload.value,
      tbaPurchase: tbaPurchase == null ? this.tbaPurchase : tbaPurchase.value,
      jitpaAmt: jitpaAmt == null ? this.jitpaAmt : jitpaAmt.value,
      jpValid: jpValid == null ? this.jpValid : jpValid.value,
      jpEndorse: jpEndorse == null ? this.jpEndorse : jpEndorse.value,
      jpEmpUpload: jpEmpUpload == null ? this.jpEmpUpload : jpEmpUpload.value,
      lbrReceiptNo: lbrReceiptNo == null ? this.lbrReceiptNo : lbrReceiptNo.value,
      lbrDepoAmt: lbrDepoAmt == null ? this.lbrDepoAmt : lbrDepoAmt.value,
      lbrDepoSubmit: lbrDepoSubmit == null ? this.lbrDepoSubmit : lbrDepoSubmit.value,
      lbrDepoUpload: lbrDepoUpload == null ? this.lbrDepoUpload : lbrDepoUpload.value
    );
  }
  
  BJLDetails.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _empID = json['empID'],
      _bankSubmit = json['bankSubmit']?.cast<String>(),
      _bankRece = json['bankRece']?.cast<String>(),
      _bankRefNo = json['bankRefNo']?.cast<String>(),
      _bankAmt = json['bankAmt']?.cast<String>(),
      _bankValid = json['bankValid']?.cast<String>(),
      _bankEndorse = json['bankEndorse']?.cast<String>(),
      _bankEmpUpload = json['bankEmpUpload']?.cast<String>(),
      _tbaPurchase = json['tbaPurchase']?.cast<String>(),
      _jitpaAmt = json['jitpaAmt']?.cast<String>(),
      _jpValid = json['jpValid']?.cast<String>(),
      _jpEndorse = json['jpEndorse']?.cast<String>(),
      _jpEmpUpload = json['jpEmpUpload']?.cast<String>(),
      _lbrReceiptNo = json['lbrReceiptNo']?.cast<String>(),
      _lbrDepoAmt = json['lbrDepoAmt']?.cast<String>(),
      _lbrDepoSubmit = json['lbrDepoSubmit']?.cast<String>(),
      _lbrDepoUpload = json['lbrDepoUpload']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'empID': _empID, 'bankSubmit': _bankSubmit, 'bankRece': _bankRece, 'bankRefNo': _bankRefNo, 'bankAmt': _bankAmt, 'bankValid': _bankValid, 'bankEndorse': _bankEndorse, 'bankEmpUpload': _bankEmpUpload, 'tbaPurchase': _tbaPurchase, 'jitpaAmt': _jitpaAmt, 'jpValid': _jpValid, 'jpEndorse': _jpEndorse, 'jpEmpUpload': _jpEmpUpload, 'lbrReceiptNo': _lbrReceiptNo, 'lbrDepoAmt': _lbrDepoAmt, 'lbrDepoSubmit': _lbrDepoSubmit, 'lbrDepoUpload': _lbrDepoUpload, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'empID': _empID,
    'bankSubmit': _bankSubmit,
    'bankRece': _bankRece,
    'bankRefNo': _bankRefNo,
    'bankAmt': _bankAmt,
    'bankValid': _bankValid,
    'bankEndorse': _bankEndorse,
    'bankEmpUpload': _bankEmpUpload,
    'tbaPurchase': _tbaPurchase,
    'jitpaAmt': _jitpaAmt,
    'jpValid': _jpValid,
    'jpEndorse': _jpEndorse,
    'jpEmpUpload': _jpEmpUpload,
    'lbrReceiptNo': _lbrReceiptNo,
    'lbrDepoAmt': _lbrDepoAmt,
    'lbrDepoSubmit': _lbrDepoSubmit,
    'lbrDepoUpload': _lbrDepoUpload,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<BJLDetailsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<BJLDetailsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMPID = amplify_core.QueryField(fieldName: "empID");
  static final BANKSUBMIT = amplify_core.QueryField(fieldName: "bankSubmit");
  static final BANKRECE = amplify_core.QueryField(fieldName: "bankRece");
  static final BANKREFNO = amplify_core.QueryField(fieldName: "bankRefNo");
  static final BANKAMT = amplify_core.QueryField(fieldName: "bankAmt");
  static final BANKVALID = amplify_core.QueryField(fieldName: "bankValid");
  static final BANKENDORSE = amplify_core.QueryField(fieldName: "bankEndorse");
  static final BANKEMPUPLOAD = amplify_core.QueryField(fieldName: "bankEmpUpload");
  static final TBAPURCHASE = amplify_core.QueryField(fieldName: "tbaPurchase");
  static final JITPAAMT = amplify_core.QueryField(fieldName: "jitpaAmt");
  static final JPVALID = amplify_core.QueryField(fieldName: "jpValid");
  static final JPENDORSE = amplify_core.QueryField(fieldName: "jpEndorse");
  static final JPEMPUPLOAD = amplify_core.QueryField(fieldName: "jpEmpUpload");
  static final LBRRECEIPTNO = amplify_core.QueryField(fieldName: "lbrReceiptNo");
  static final LBRDEPOAMT = amplify_core.QueryField(fieldName: "lbrDepoAmt");
  static final LBRDEPOSUBMIT = amplify_core.QueryField(fieldName: "lbrDepoSubmit");
  static final LBRDEPOUPLOAD = amplify_core.QueryField(fieldName: "lbrDepoUpload");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BJLDetails";
    modelSchemaDefinition.pluralName = "BJLDetails";
    
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
      key: BJLDetails.EMPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKSUBMIT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKRECE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKREFNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKAMT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKVALID,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKENDORSE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.BANKEMPUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.TBAPURCHASE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.JITPAAMT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.JPVALID,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.JPENDORSE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.JPEMPUPLOAD,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.LBRRECEIPTNO,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.LBRDEPOAMT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.LBRDEPOSUBMIT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BJLDetails.LBRDEPOUPLOAD,
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

class _BJLDetailsModelType extends amplify_core.ModelType<BJLDetails> {
  const _BJLDetailsModelType();
  
  @override
  BJLDetails fromJson(Map<String, dynamic> jsonData) {
    return BJLDetails.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'BJLDetails';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [BJLDetails] in your schema.
 */
class BJLDetailsModelIdentifier implements amplify_core.ModelIdentifier<BJLDetails> {
  final String id;

  /** Create an instance of BJLDetailsModelIdentifier using [id] the primary key. */
  const BJLDetailsModelIdentifier({
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
  String toString() => 'BJLDetailsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BJLDetailsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}