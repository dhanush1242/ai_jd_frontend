// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jd_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobParameterCreateImpl _$$JobParameterCreateImplFromJson(
  Map<String, dynamic> json,
) => _$JobParameterCreateImpl(
  jobTitle: json['job_title'] as String,
  requiredSkills: json['required_skills'] as String,
  educationQualification: json['education_qualification'] as String,
  experience: json['experience'] as String,
  location: json['location'] as String,
  passedoutYear: (json['passedout_year'] as num?)?.toInt(),
  workMode: json['work_mode'] as String,
  jobType: json['job_type'] as String,
  package: json['package'] as String?,
);

Map<String, dynamic> _$$JobParameterCreateImplToJson(
  _$JobParameterCreateImpl instance,
) => <String, dynamic>{
  'job_title': instance.jobTitle,
  'required_skills': instance.requiredSkills,
  'education_qualification': instance.educationQualification,
  'experience': instance.experience,
  'location': instance.location,
  'passedout_year': instance.passedoutYear,
  'work_mode': instance.workMode,
  'job_type': instance.jobType,
  'package': instance.package,
};

_$GeneratedJDImpl _$$GeneratedJDImplFromJson(Map<String, dynamic> json) =>
    _$GeneratedJDImpl(
      jdId: (json['jd_id'] as num).toInt(),
      jobId: (json['job_id'] as num).toInt(),
      versionNumber: (json['version_number'] as num).toInt(),
      generatedJd: json['generated_jd'] as String,
      updatedJd: json['updated_jd'] as String?,
      isPublished: json['is_published'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      publishedAt: json['published_at'] as String?,
    );

Map<String, dynamic> _$$GeneratedJDImplToJson(_$GeneratedJDImpl instance) =>
    <String, dynamic>{
      'jd_id': instance.jdId,
      'job_id': instance.jobId,
      'version_number': instance.versionNumber,
      'generated_jd': instance.generatedJd,
      'updated_jd': instance.updatedJd,
      'is_published': instance.isPublished,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'published_at': instance.publishedAt,
    };

_$JobParameterUpdateImpl _$$JobParameterUpdateImplFromJson(
  Map<String, dynamic> json,
) => _$JobParameterUpdateImpl(
  jobTitle: json['job_title'] as String?,
  requiredSkills: json['required_skills'] as String?,
  educationQualification: json['education_qualification'] as String?,
  experience: json['experience'] as String?,
  location: json['location'] as String?,
  passedoutYear: (json['passedout_year'] as num?)?.toInt(),
  workMode: json['work_mode'] as String?,
  jobType: json['job_type'] as String?,
  package: json['package'] as String?,
);

Map<String, dynamic> _$$JobParameterUpdateImplToJson(
  _$JobParameterUpdateImpl instance,
) => <String, dynamic>{
  'job_title': instance.jobTitle,
  'required_skills': instance.requiredSkills,
  'education_qualification': instance.educationQualification,
  'experience': instance.experience,
  'location': instance.location,
  'passedout_year': instance.passedoutYear,
  'work_mode': instance.workMode,
  'job_type': instance.jobType,
  'package': instance.package,
};

_$JobParameterResponseImpl _$$JobParameterResponseImplFromJson(
  Map<String, dynamic> json,
) => _$JobParameterResponseImpl(
  jobId: (json['job_id'] as num).toInt(),
  recruiterId: (json['recruiter_id'] as num).toInt(),
  jobTitle: json['job_title'] as String,
  requiredSkills: json['required_skills'] as String,
  educationQualification: json['education_qualification'] as String,
  experience: json['experience'] as String,
  location: json['location'] as String,
  passedoutYear: (json['passedout_year'] as num?)?.toInt(),
  workMode: json['work_mode'] as String,
  jobType: json['job_type'] as String,
  package: json['package'] as String?,
);

Map<String, dynamic> _$$JobParameterResponseImplToJson(
  _$JobParameterResponseImpl instance,
) => <String, dynamic>{
  'job_id': instance.jobId,
  'recruiter_id': instance.recruiterId,
  'job_title': instance.jobTitle,
  'required_skills': instance.requiredSkills,
  'education_qualification': instance.educationQualification,
  'experience': instance.experience,
  'location': instance.location,
  'passedout_year': instance.passedoutYear,
  'work_mode': instance.workMode,
  'job_type': instance.jobType,
  'package': instance.package,
};

_$JobDescriptionResponseImpl _$$JobDescriptionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$JobDescriptionResponseImpl(
  jdId: (json['jd_id'] as num).toInt(),
  jobId: (json['job_id'] as num).toInt(),
  versionNumber: (json['version_number'] as num).toInt(),
  generatedJd: json['generated_jd'] as String,
  updatedJd: json['updated_jd'] as String?,
  isPublished: json['is_published'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  publishedAt: json['published_at'] == null
      ? null
      : DateTime.parse(json['published_at'] as String),
);

Map<String, dynamic> _$$JobDescriptionResponseImplToJson(
  _$JobDescriptionResponseImpl instance,
) => <String, dynamic>{
  'jd_id': instance.jdId,
  'job_id': instance.jobId,
  'version_number': instance.versionNumber,
  'generated_jd': instance.generatedJd,
  'updated_jd': instance.updatedJd,
  'is_published': instance.isPublished,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'published_at': instance.publishedAt?.toIso8601String(),
};

_$JobDescriptionUpdateImpl _$$JobDescriptionUpdateImplFromJson(
  Map<String, dynamic> json,
) => _$JobDescriptionUpdateImpl(updatedJd: json['updated_jd'] as String);

Map<String, dynamic> _$$JobDescriptionUpdateImplToJson(
  _$JobDescriptionUpdateImpl instance,
) => <String, dynamic>{'updated_jd': instance.updatedJd};
