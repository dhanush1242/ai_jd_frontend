// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecruiterApplicationImpl _$$RecruiterApplicationImplFromJson(
  Map<String, dynamic> json,
) => _$RecruiterApplicationImpl(
  applicationId: (json['application_id'] as num).toInt(),
  candidateId: (json['candidate_id'] as num).toInt(),
  candidateName: json['candidate_name'] as String,
  candidateEmail: json['candidate_email'] as String,
  mobileNumber: json['mobile_number'] as String,
  educationQualification: json['education_qualification'] as String?,
  passedoutYear: (json['passedout_year'] as num?)?.toInt(),
  experience: json['experience'] as String?,
  skills: json['skills'] as String?,
  resumeUrl: json['resume_url'] as String,
  githubUrl: json['github_url'] as String?,
  linkedinUrl: json['linkedin_url'] as String?,
  jobId: (json['job_id'] as num).toInt(),
  jdId: (json['jd_id'] as num).toInt(),
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$RecruiterApplicationImplToJson(
  _$RecruiterApplicationImpl instance,
) => <String, dynamic>{
  'application_id': instance.applicationId,
  'candidate_id': instance.candidateId,
  'candidate_name': instance.candidateName,
  'candidate_email': instance.candidateEmail,
  'mobile_number': instance.mobileNumber,
  'education_qualification': instance.educationQualification,
  'passedout_year': instance.passedoutYear,
  'experience': instance.experience,
  'skills': instance.skills,
  'resume_url': instance.resumeUrl,
  'github_url': instance.githubUrl,
  'linkedin_url': instance.linkedinUrl,
  'job_id': instance.jobId,
  'jd_id': instance.jdId,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_$ApplicationNoteImpl _$$ApplicationNoteImplFromJson(
  Map<String, dynamic> json,
) => _$ApplicationNoteImpl(
  noteId: (json['note_id'] as num).toInt(),
  applicationId: (json['application_id'] as num).toInt(),
  recruiterId: (json['recruiter_id'] as num).toInt(),
  note: json['note'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$ApplicationNoteImplToJson(
  _$ApplicationNoteImpl instance,
) => <String, dynamic>{
  'note_id': instance.noteId,
  'application_id': instance.applicationId,
  'recruiter_id': instance.recruiterId,
  'note': instance.note,
  'created_at': instance.createdAt,
};
