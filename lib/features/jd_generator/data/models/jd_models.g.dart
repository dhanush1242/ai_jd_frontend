// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jd_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobDescriptionCreateImpl _$$JobDescriptionCreateImplFromJson(
  Map<String, dynamic> json,
) => _$JobDescriptionCreateImpl(
  jobTitle: json['job_title'] as String,
  skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
  experienceRequired: json['experience_required'] as String,
  educationQualifications: json['education_qualifications'] as String,
  salary: json['salary'] as String,
  workMode: json['work_mode'] as String,
  jobType: json['job_type'] as String,
  location: json['location'] as String,
  numberOfOpenings: (json['number_of_openings'] as num?)?.toInt(),
  department: json['department'] as String?,
  additionalInstructions: json['additional_instructions'] as String?,
);

Map<String, dynamic> _$$JobDescriptionCreateImplToJson(
  _$JobDescriptionCreateImpl instance,
) => <String, dynamic>{
  'job_title': instance.jobTitle,
  'skills': instance.skills,
  'experience_required': instance.experienceRequired,
  'education_qualifications': instance.educationQualifications,
  'salary': instance.salary,
  'work_mode': instance.workMode,
  'job_type': instance.jobType,
  'location': instance.location,
  'number_of_openings': instance.numberOfOpenings,
  'department': instance.department,
  'additional_instructions': instance.additionalInstructions,
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
