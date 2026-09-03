// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateDetailsImpl _$$CandidateDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$CandidateDetailsImpl(
  candidateDetailsId: (json['candidate_details_id'] as num).toInt(),
  candidateId: (json['candidate_id'] as num).toInt(),
  educationQualification: json['education_qualification'] as String?,
  passedoutYear: (json['passedout_year'] as num?)?.toInt(),
  experience: json['experience'] as String?,
  skills: json['skills'] as String?,
  preferredWorkMode: json['preferred_work_mode'] as String?,
  preferredJobType: json['preferred_job_type'] as String?,
  preferredWorkLocation: json['preferred_work_location'] as String?,
  profilePicture: json['profile_picture'] as String?,
  resume: json['resume'] as String?,
  githubUrl: json['github_url'] as String?,
  linkedinUrl: json['linkedin_url'] as String?,
);

Map<String, dynamic> _$$CandidateDetailsImplToJson(
  _$CandidateDetailsImpl instance,
) => <String, dynamic>{
  'candidate_details_id': instance.candidateDetailsId,
  'candidate_id': instance.candidateId,
  'education_qualification': instance.educationQualification,
  'passedout_year': instance.passedoutYear,
  'experience': instance.experience,
  'skills': instance.skills,
  'preferred_work_mode': instance.preferredWorkMode,
  'preferred_job_type': instance.preferredJobType,
  'preferred_work_location': instance.preferredWorkLocation,
  'profile_picture': instance.profilePicture,
  'resume': instance.resume,
  'github_url': instance.githubUrl,
  'linkedin_url': instance.linkedinUrl,
};

_$CandidateApplicationImpl _$$CandidateApplicationImplFromJson(
  Map<String, dynamic> json,
) => _$CandidateApplicationImpl(
  applicationId: (json['application_id'] as num).toInt(),
  jobId: (json['job_id'] as num).toInt(),
  jdId: (json['jd_id'] as num).toInt(),
  jobTitle: json['job_title'] as String,
  location: json['location'] as String,
  experience: json['experience'] as String,
  workMode: json['work_mode'] as String,
  jobType: json['job_type'] as String,
  package: json['package'] as String?,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$CandidateApplicationImplToJson(
  _$CandidateApplicationImpl instance,
) => <String, dynamic>{
  'application_id': instance.applicationId,
  'job_id': instance.jobId,
  'jd_id': instance.jdId,
  'job_title': instance.jobTitle,
  'location': instance.location,
  'experience': instance.experience,
  'work_mode': instance.workMode,
  'job_type': instance.jobType,
  'package': instance.package,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_$CandidateJobImpl _$$CandidateJobImplFromJson(Map<String, dynamic> json) =>
    _$CandidateJobImpl(
      jobId: (json['job_id'] as num).toInt(),
      jobTitle: json['job_title'] as String,
      requiredSkills: json['required_skills'] as String,
      educationQualification: json['education_qualification'] as String,
      experience: json['experience'] as String,
      location: json['location'] as String,
      passedoutYear: (json['passedout_year'] as num?)?.toInt(),
      workMode: json['work_mode'] as String,
      jobType: json['job_type'] as String,
      package: json['package'] as String?,
      jdId: (json['jd_id'] as num?)?.toInt(),
      versionNumber: (json['version_number'] as num?)?.toInt(),
      jobDescription: json['job_description'] as String?,
      publishedAt: json['published_at'] as String?,
    );

Map<String, dynamic> _$$CandidateJobImplToJson(_$CandidateJobImpl instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
      'job_title': instance.jobTitle,
      'required_skills': instance.requiredSkills,
      'education_qualification': instance.educationQualification,
      'experience': instance.experience,
      'location': instance.location,
      'passedout_year': instance.passedoutYear,
      'work_mode': instance.workMode,
      'job_type': instance.jobType,
      'package': instance.package,
      'jd_id': instance.jdId,
      'version_number': instance.versionNumber,
      'job_description': instance.jobDescription,
      'published_at': instance.publishedAt,
    };

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      bookmarkId: (json['bookmark_id'] as num).toInt(),
      candidateId: (json['candidate_id'] as num).toInt(),
      jobId: (json['job_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'bookmark_id': instance.bookmarkId,
      'candidate_id': instance.candidateId,
      'job_id': instance.jobId,
      'created_at': instance.createdAt,
    };
