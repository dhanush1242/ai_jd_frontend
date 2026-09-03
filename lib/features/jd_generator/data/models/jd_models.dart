import 'package:freezed_annotation/freezed_annotation.dart';

part 'jd_models.freezed.dart';
part 'jd_models.g.dart';

@freezed
class JobParameterCreate with _$JobParameterCreate {
  const factory JobParameterCreate({
    @JsonKey(name: 'job_title') required String jobTitle,
    @JsonKey(name: 'required_skills') required String requiredSkills,
    @JsonKey(name: 'education_qualification') required String educationQualification,
    required String experience,
    required String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') required String workMode,
    @JsonKey(name: 'job_type') required String jobType,
    String? package,
  }) = _JobParameterCreate;

  factory JobParameterCreate.fromJson(Map<String, dynamic> json) => _$JobParameterCreateFromJson(json);
}

@freezed
class GeneratedJD with _$GeneratedJD {
  const factory GeneratedJD({
    @JsonKey(name: 'jd_id') required int jdId,
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'version_number') required int versionNumber,
    @JsonKey(name: 'generated_jd') required String generatedJd,
    @JsonKey(name: 'updated_jd') String? updatedJd,
    @JsonKey(name: 'is_published') required bool isPublished,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'published_at') String? publishedAt,
  }) = _GeneratedJD;

  factory GeneratedJD.fromJson(Map<String, dynamic> json) => _$GeneratedJDFromJson(json);
}

@freezed
class JobParameterUpdate with _$JobParameterUpdate {
  const factory JobParameterUpdate({
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'required_skills') String? requiredSkills,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    String? experience,
    String? location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String? workMode,
    @JsonKey(name: 'job_type') String? jobType,
    String? package,
  }) = _JobParameterUpdate;

  factory JobParameterUpdate.fromJson(Map<String, dynamic> json) => _$JobParameterUpdateFromJson(json);
}

@freezed
class JobParameterResponse with _$JobParameterResponse {
  const factory JobParameterResponse({
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'recruiter_id') required int recruiterId,
    @JsonKey(name: 'job_title') required String jobTitle,
    @JsonKey(name: 'required_skills') required String requiredSkills,
    @JsonKey(name: 'education_qualification') required String educationQualification,
    required String experience,
    required String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') required String workMode,
    @JsonKey(name: 'job_type') required String jobType,
    String? package,
  }) = _JobParameterResponse;

  factory JobParameterResponse.fromJson(Map<String, dynamic> json) => _$JobParameterResponseFromJson(json);
}

@freezed
class JobDescriptionResponse with _$JobDescriptionResponse {
  const factory JobDescriptionResponse({
    @JsonKey(name: 'jd_id') required int jdId,
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'version_number') required int versionNumber,
    @JsonKey(name: 'generated_jd') required String generatedJd,
    @JsonKey(name: 'updated_jd') String? updatedJd,
    @JsonKey(name: 'is_published') required bool isPublished,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
  }) = _JobDescriptionResponse;

  factory JobDescriptionResponse.fromJson(Map<String, dynamic> json) => _$JobDescriptionResponseFromJson(json);
}

@freezed
class JobDescriptionUpdate with _$JobDescriptionUpdate {
  const factory JobDescriptionUpdate({
    @JsonKey(name: 'updated_jd') required String updatedJd,
  }) = _JobDescriptionUpdate;

  factory JobDescriptionUpdate.fromJson(Map<String, dynamic> json) => _$JobDescriptionUpdateFromJson(json);
}
