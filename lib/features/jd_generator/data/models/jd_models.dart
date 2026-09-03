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
