import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_models.freezed.dart';
part 'candidate_models.g.dart';

@freezed
class CandidateDetails with _$CandidateDetails {
  const factory CandidateDetails({
    @JsonKey(name: 'candidate_details_id') required int candidateDetailsId,
    @JsonKey(name: 'candidate_id') required int candidateId,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    String? experience,
    String? skills,
    @JsonKey(name: 'preferred_work_mode') String? preferredWorkMode,
    @JsonKey(name: 'preferred_job_type') String? preferredJobType,
    @JsonKey(name: 'preferred_work_location') String? preferredWorkLocation,
    @JsonKey(name: 'profile_picture') String? profilePicture,
    String? resume,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'linkedin_url') String? linkedinUrl,
  }) = _CandidateDetails;

  factory CandidateDetails.fromJson(Map<String, dynamic> json) => _$CandidateDetailsFromJson(json);
}
@freezed
class CandidateApplication with _$CandidateApplication {
  const factory CandidateApplication({
    @JsonKey(name: 'application_id') required int applicationId,
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'jd_id') required int jdId,
    @JsonKey(name: 'job_title') required String jobTitle,
    required String location,
    required String experience,
    @JsonKey(name: 'work_mode') required String workMode,
    @JsonKey(name: 'job_type') required String jobType,
    String? package,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CandidateApplication;

  factory CandidateApplication.fromJson(Map<String, dynamic> json) => _$CandidateApplicationFromJson(json);
}

@freezed
class CandidateJob with _$CandidateJob {
  const factory CandidateJob({
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'job_title') required String jobTitle,
    @JsonKey(name: 'required_skills') required String requiredSkills,
    @JsonKey(name: 'education_qualification') required String educationQualification,
    required String experience,
    required String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') required String workMode,
    @JsonKey(name: 'job_type') required String jobType,
    String? package,
    @JsonKey(name: 'jd_id') int? jdId,
    @JsonKey(name: 'version_number') int? versionNumber,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'published_at') String? publishedAt,
  }) = _CandidateJob;

  factory CandidateJob.fromJson(Map<String, dynamic> json) => _$CandidateJobFromJson(json);
}

@freezed
class Bookmark with _$Bookmark {
  const factory Bookmark({
    @JsonKey(name: 'bookmark_id') required int bookmarkId,
    @JsonKey(name: 'candidate_id') required int candidateId,
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);
}
