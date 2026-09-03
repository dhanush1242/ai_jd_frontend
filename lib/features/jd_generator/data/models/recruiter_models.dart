import 'package:freezed_annotation/freezed_annotation.dart';

part 'recruiter_models.freezed.dart';
part 'recruiter_models.g.dart';

@freezed
class RecruiterApplication with _$RecruiterApplication {
  const factory RecruiterApplication({
    @JsonKey(name: 'application_id') required int applicationId,
    @JsonKey(name: 'candidate_id') required int candidateId,
    @JsonKey(name: 'candidate_name') required String candidateName,
    @JsonKey(name: 'candidate_email') required String candidateEmail,
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    String? experience,
    String? skills,
    @JsonKey(name: 'resume_url') required String resumeUrl,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'linkedin_url') String? linkedinUrl,
    @JsonKey(name: 'job_id') required int jobId,
    @JsonKey(name: 'jd_id') required int jdId,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _RecruiterApplication;

  factory RecruiterApplication.fromJson(Map<String, dynamic> json) => _$RecruiterApplicationFromJson(json);
}

@freezed
class ApplicationNote with _$ApplicationNote {
  const factory ApplicationNote({
    @JsonKey(name: 'note_id') required int noteId,
    @JsonKey(name: 'application_id') required int applicationId,
    @JsonKey(name: 'recruiter_id') required int recruiterId,
    required String note,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ApplicationNote;

  factory ApplicationNote.fromJson(Map<String, dynamic> json) => _$ApplicationNoteFromJson(json);
}
