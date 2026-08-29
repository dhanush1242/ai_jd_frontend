import 'package:freezed_annotation/freezed_annotation.dart';

part 'jd_models.freezed.dart';
part 'jd_models.g.dart';

@freezed
class JobDescriptionCreate with _$JobDescriptionCreate {
  const factory JobDescriptionCreate({
    @JsonKey(name: 'job_title') required String jobTitle,
    required List<String> skills,
    @JsonKey(name: 'experience_required') required String experienceRequired,
    @JsonKey(name: 'education_qualifications') required String educationQualifications,
    required String salary,
    @JsonKey(name: 'work_mode') required String workMode,
    @JsonKey(name: 'job_type') required String jobType,
    required String location,
    @JsonKey(name: 'number_of_openings') int? numberOfOpenings,
    String? department,
    @JsonKey(name: 'additional_instructions') String? additionalInstructions,
  }) = _JobDescriptionCreate;

  factory JobDescriptionCreate.fromJson(Map<String, dynamic> json) => _$JobDescriptionCreateFromJson(json);
}

@freezed
class GeneratedJD with _$GeneratedJD {
  const factory GeneratedJD({
    required String id,
    @JsonKey(name: 'job_title') required String jobTitle,
    @JsonKey(name: 'generated_content') required GeneratedContent generatedContent,
  }) = _GeneratedJD;

  factory GeneratedJD.fromJson(Map<String, dynamic> json) => _$GeneratedJDFromJson(json);
}

@freezed
class GeneratedContent with _$GeneratedContent {
  const factory GeneratedContent({
    @JsonKey(name: 'job_summary') required String jobSummary,
    required List<String> responsibilities,
    @JsonKey(name: 'required_skills') required List<String> requiredSkills,
    @JsonKey(name: 'required_qualifications') required List<String> requiredQualifications,
    @JsonKey(name: 'preferred_qualifications') required List<String> preferredQualifications,
    required String experience,
    required String salary,
    @JsonKey(name: 'work_mode') required String workMode,
    @JsonKey(name: 'job_type') required String jobType,
    required String location,
    @Default([]) List<String> benefits,
    @JsonKey(name: 'equal_opportunity_statement') @Default('') String equalOpportunityStatement,
  }) = _GeneratedContent;

  factory GeneratedContent.fromJson(Map<String, dynamic> json) => _$GeneratedContentFromJson(json);
}
