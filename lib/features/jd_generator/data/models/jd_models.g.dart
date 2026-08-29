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
      id: json['id'] as String,
      jobTitle: json['job_title'] as String,
      generatedContent: GeneratedContent.fromJson(
        json['generated_content'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$GeneratedJDImplToJson(_$GeneratedJDImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_title': instance.jobTitle,
      'generated_content': instance.generatedContent,
    };

_$GeneratedContentImpl _$$GeneratedContentImplFromJson(
  Map<String, dynamic> json,
) => _$GeneratedContentImpl(
  jobSummary: json['job_summary'] as String,
  responsibilities: (json['responsibilities'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  requiredSkills: (json['required_skills'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  requiredQualifications: (json['required_qualifications'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  preferredQualifications: (json['preferred_qualifications'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  experience: json['experience'] as String,
  salary: json['salary'] as String,
  workMode: json['work_mode'] as String,
  jobType: json['job_type'] as String,
  location: json['location'] as String,
  benefits:
      (json['benefits'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  equalOpportunityStatement:
      json['equal_opportunity_statement'] as String? ?? '',
);

Map<String, dynamic> _$$GeneratedContentImplToJson(
  _$GeneratedContentImpl instance,
) => <String, dynamic>{
  'job_summary': instance.jobSummary,
  'responsibilities': instance.responsibilities,
  'required_skills': instance.requiredSkills,
  'required_qualifications': instance.requiredQualifications,
  'preferred_qualifications': instance.preferredQualifications,
  'experience': instance.experience,
  'salary': instance.salary,
  'work_mode': instance.workMode,
  'job_type': instance.jobType,
  'location': instance.location,
  'benefits': instance.benefits,
  'equal_opportunity_statement': instance.equalOpportunityStatement,
};
