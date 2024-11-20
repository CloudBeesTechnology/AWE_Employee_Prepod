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

import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'AddCourse.dart';
import 'BJLDetails.dart';
import 'Blng.dart';
import 'CandIToEMP.dart';
import 'DNDetails.dart';
import 'EducationDetails.dart';
import 'EmailNotifi.dart';
import 'EmpDepInsurance.dart';
import 'EmpInsurance.dart';
import 'EmpLeaveDetails.dart';
import 'EmpPersonalInfo.dart';
import 'EmpRequisition.dart';
import 'EmpWorkInfo.dart';
import 'EmployeeNonLocalAcco.dart';
import 'HeadOffice.dart';
import 'IDDetails.dart';
import 'InterviewScheduleSchema.dart';
import 'LabourMedicalInfo.dart';
import 'LeaveStatus.dart';
import 'LocalMobilization.dart';
import 'ORMCSheet.dart';
import 'OffshoreSheet.dart';
import 'PassportValid.dart';
import 'PersonalDetails.dart';
import 'ProbForm.dart';
import 'SBWSheet.dart';
import 'SampleTest1.dart';
import 'SawpDetails.dart';
import 'ServiceRecord.dart';
import 'TerminationInfo.dart';
import 'TicketRequest.dart';
import 'TrainingCertificates.dart';
import 'TrainingReq.dart';
import 'User.dart';
import 'WPTracking.dart';
import 'WeldingInfo.dart';

export 'AddCourse.dart';
export 'BJLDetails.dart';
export 'Blng.dart';
export 'CandIToEMP.dart';
export 'DNDetails.dart';
export 'EducationDetails.dart';
export 'EmailNotifi.dart';
export 'EmpDepInsurance.dart';
export 'EmpInsurance.dart';
export 'EmpLeaveDetails.dart';
export 'EmpPersonalInfo.dart';
export 'EmpRequisition.dart';
export 'EmpWorkInfo.dart';
export 'EmployeeNonLocalAcco.dart';
export 'HeadOffice.dart';
export 'IDDetails.dart';
export 'InterviewScheduleSchema.dart';
export 'LabourMedicalInfo.dart';
export 'LeaveStatus.dart';
export 'LocalMobilization.dart';
export 'ORMCSheet.dart';
export 'OffshoreSheet.dart';
export 'PassportValid.dart';
export 'PersonalDetails.dart';
export 'ProbForm.dart';
export 'SBWSheet.dart';
export 'SampleTest1.dart';
export 'SawpDetails.dart';
export 'ServiceRecord.dart';
export 'TerminationInfo.dart';
export 'TicketRequest.dart';
export 'TrainingCertificates.dart';
export 'TrainingReq.dart';
export 'User.dart';
export 'WPTracking.dart';
export 'WeldingInfo.dart';

class ModelProvider implements amplify_core.ModelProviderInterface {
  @override
  String version = "a09cd035d44d0c8353d6020cc06db7d7";
  @override
  List<amplify_core.ModelSchema> modelSchemas = [AddCourse.schema, BJLDetails.schema, Blng.schema, CandIToEMP.schema, DNDetails.schema, EducationDetails.schema, EmailNotifi.schema, EmpDepInsurance.schema, EmpInsurance.schema, EmpLeaveDetails.schema, EmpPersonalInfo.schema, EmpRequisition.schema, EmpWorkInfo.schema, EmployeeNonLocalAcco.schema, HeadOffice.schema, IDDetails.schema, InterviewScheduleSchema.schema, LabourMedicalInfo.schema, LeaveStatus.schema, LocalMobilization.schema, ORMCSheet.schema, OffshoreSheet.schema, PassportValid.schema, PersonalDetails.schema, ProbForm.schema, SBWSheet.schema, SampleTest1.schema, SawpDetails.schema, ServiceRecord.schema, TerminationInfo.schema, TicketRequest.schema, TrainingCertificates.schema, TrainingReq.schema, User.schema, WPTracking.schema, WeldingInfo.schema];
  @override
  List<amplify_core.ModelSchema> customTypeSchemas = [];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  amplify_core.ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "AddCourse":
        return AddCourse.classType;
      case "BJLDetails":
        return BJLDetails.classType;
      case "Blng":
        return Blng.classType;
      case "CandIToEMP":
        return CandIToEMP.classType;
      case "DNDetails":
        return DNDetails.classType;
      case "EducationDetails":
        return EducationDetails.classType;
      case "EmailNotifi":
        return EmailNotifi.classType;
      case "EmpDepInsurance":
        return EmpDepInsurance.classType;
      case "EmpInsurance":
        return EmpInsurance.classType;
      case "EmpLeaveDetails":
        return EmpLeaveDetails.classType;
      case "EmpPersonalInfo":
        return EmpPersonalInfo.classType;
      case "EmpRequisition":
        return EmpRequisition.classType;
      case "EmpWorkInfo":
        return EmpWorkInfo.classType;
      case "EmployeeNonLocalAcco":
        return EmployeeNonLocalAcco.classType;
      case "HeadOffice":
        return HeadOffice.classType;
      case "IDDetails":
        return IDDetails.classType;
      case "InterviewScheduleSchema":
        return InterviewScheduleSchema.classType;
      case "LabourMedicalInfo":
        return LabourMedicalInfo.classType;
      case "LeaveStatus":
        return LeaveStatus.classType;
      case "LocalMobilization":
        return LocalMobilization.classType;
      case "ORMCSheet":
        return ORMCSheet.classType;
      case "OffshoreSheet":
        return OffshoreSheet.classType;
      case "PassportValid":
        return PassportValid.classType;
      case "PersonalDetails":
        return PersonalDetails.classType;
      case "ProbForm":
        return ProbForm.classType;
      case "SBWSheet":
        return SBWSheet.classType;
      case "SampleTest1":
        return SampleTest1.classType;
      case "SawpDetails":
        return SawpDetails.classType;
      case "ServiceRecord":
        return ServiceRecord.classType;
      case "TerminationInfo":
        return TerminationInfo.classType;
      case "TicketRequest":
        return TicketRequest.classType;
      case "TrainingCertificates":
        return TrainingCertificates.classType;
      case "TrainingReq":
        return TrainingReq.classType;
      case "User":
        return User.classType;
      case "WPTracking":
        return WPTracking.classType;
      case "WeldingInfo":
        return WeldingInfo.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}


class ModelFieldValue<T> {
  const ModelFieldValue.value(this.value);

  final T value;
}
