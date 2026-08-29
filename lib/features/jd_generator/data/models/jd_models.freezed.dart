// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jd_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JobDescriptionCreate _$JobDescriptionCreateFromJson(Map<String, dynamic> json) {
  return _JobDescriptionCreate.fromJson(json);
}

/// @nodoc
mixin _$JobDescriptionCreate {
  @JsonKey(name: 'job_title')
  String get jobTitle => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_required')
  String get experienceRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_qualifications')
  String get educationQualifications => throw _privateConstructorUsedError;
  String get salary => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_mode')
  String get workMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String get jobType => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_openings')
  int? get numberOfOpenings => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_instructions')
  String? get additionalInstructions => throw _privateConstructorUsedError;

  /// Serializes this JobDescriptionCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobDescriptionCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobDescriptionCreateCopyWith<JobDescriptionCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDescriptionCreateCopyWith<$Res> {
  factory $JobDescriptionCreateCopyWith(
    JobDescriptionCreate value,
    $Res Function(JobDescriptionCreate) then,
  ) = _$JobDescriptionCreateCopyWithImpl<$Res, JobDescriptionCreate>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_title') String jobTitle,
    List<String> skills,
    @JsonKey(name: 'experience_required') String experienceRequired,
    @JsonKey(name: 'education_qualifications') String educationQualifications,
    String salary,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String location,
    @JsonKey(name: 'number_of_openings') int? numberOfOpenings,
    String? department,
    @JsonKey(name: 'additional_instructions') String? additionalInstructions,
  });
}

/// @nodoc
class _$JobDescriptionCreateCopyWithImpl<
  $Res,
  $Val extends JobDescriptionCreate
>
    implements $JobDescriptionCreateCopyWith<$Res> {
  _$JobDescriptionCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobDescriptionCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobTitle = null,
    Object? skills = null,
    Object? experienceRequired = null,
    Object? educationQualifications = null,
    Object? salary = null,
    Object? workMode = null,
    Object? jobType = null,
    Object? location = null,
    Object? numberOfOpenings = freezed,
    Object? department = freezed,
    Object? additionalInstructions = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobTitle: null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            skills: null == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            experienceRequired: null == experienceRequired
                ? _value.experienceRequired
                : experienceRequired // ignore: cast_nullable_to_non_nullable
                      as String,
            educationQualifications: null == educationQualifications
                ? _value.educationQualifications
                : educationQualifications // ignore: cast_nullable_to_non_nullable
                      as String,
            salary: null == salary
                ? _value.salary
                : salary // ignore: cast_nullable_to_non_nullable
                      as String,
            workMode: null == workMode
                ? _value.workMode
                : workMode // ignore: cast_nullable_to_non_nullable
                      as String,
            jobType: null == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            numberOfOpenings: freezed == numberOfOpenings
                ? _value.numberOfOpenings
                : numberOfOpenings // ignore: cast_nullable_to_non_nullable
                      as int?,
            department: freezed == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String?,
            additionalInstructions: freezed == additionalInstructions
                ? _value.additionalInstructions
                : additionalInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobDescriptionCreateImplCopyWith<$Res>
    implements $JobDescriptionCreateCopyWith<$Res> {
  factory _$$JobDescriptionCreateImplCopyWith(
    _$JobDescriptionCreateImpl value,
    $Res Function(_$JobDescriptionCreateImpl) then,
  ) = __$$JobDescriptionCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_title') String jobTitle,
    List<String> skills,
    @JsonKey(name: 'experience_required') String experienceRequired,
    @JsonKey(name: 'education_qualifications') String educationQualifications,
    String salary,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String location,
    @JsonKey(name: 'number_of_openings') int? numberOfOpenings,
    String? department,
    @JsonKey(name: 'additional_instructions') String? additionalInstructions,
  });
}

/// @nodoc
class __$$JobDescriptionCreateImplCopyWithImpl<$Res>
    extends _$JobDescriptionCreateCopyWithImpl<$Res, _$JobDescriptionCreateImpl>
    implements _$$JobDescriptionCreateImplCopyWith<$Res> {
  __$$JobDescriptionCreateImplCopyWithImpl(
    _$JobDescriptionCreateImpl _value,
    $Res Function(_$JobDescriptionCreateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobDescriptionCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobTitle = null,
    Object? skills = null,
    Object? experienceRequired = null,
    Object? educationQualifications = null,
    Object? salary = null,
    Object? workMode = null,
    Object? jobType = null,
    Object? location = null,
    Object? numberOfOpenings = freezed,
    Object? department = freezed,
    Object? additionalInstructions = freezed,
  }) {
    return _then(
      _$JobDescriptionCreateImpl(
        jobTitle: null == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        skills: null == skills
            ? _value._skills
            : skills // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        experienceRequired: null == experienceRequired
            ? _value.experienceRequired
            : experienceRequired // ignore: cast_nullable_to_non_nullable
                  as String,
        educationQualifications: null == educationQualifications
            ? _value.educationQualifications
            : educationQualifications // ignore: cast_nullable_to_non_nullable
                  as String,
        salary: null == salary
            ? _value.salary
            : salary // ignore: cast_nullable_to_non_nullable
                  as String,
        workMode: null == workMode
            ? _value.workMode
            : workMode // ignore: cast_nullable_to_non_nullable
                  as String,
        jobType: null == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        numberOfOpenings: freezed == numberOfOpenings
            ? _value.numberOfOpenings
            : numberOfOpenings // ignore: cast_nullable_to_non_nullable
                  as int?,
        department: freezed == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String?,
        additionalInstructions: freezed == additionalInstructions
            ? _value.additionalInstructions
            : additionalInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobDescriptionCreateImpl implements _JobDescriptionCreate {
  const _$JobDescriptionCreateImpl({
    @JsonKey(name: 'job_title') required this.jobTitle,
    required final List<String> skills,
    @JsonKey(name: 'experience_required') required this.experienceRequired,
    @JsonKey(name: 'education_qualifications')
    required this.educationQualifications,
    required this.salary,
    @JsonKey(name: 'work_mode') required this.workMode,
    @JsonKey(name: 'job_type') required this.jobType,
    required this.location,
    @JsonKey(name: 'number_of_openings') this.numberOfOpenings,
    this.department,
    @JsonKey(name: 'additional_instructions') this.additionalInstructions,
  }) : _skills = skills;

  factory _$JobDescriptionCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDescriptionCreateImplFromJson(json);

  @override
  @JsonKey(name: 'job_title')
  final String jobTitle;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey(name: 'experience_required')
  final String experienceRequired;
  @override
  @JsonKey(name: 'education_qualifications')
  final String educationQualifications;
  @override
  final String salary;
  @override
  @JsonKey(name: 'work_mode')
  final String workMode;
  @override
  @JsonKey(name: 'job_type')
  final String jobType;
  @override
  final String location;
  @override
  @JsonKey(name: 'number_of_openings')
  final int? numberOfOpenings;
  @override
  final String? department;
  @override
  @JsonKey(name: 'additional_instructions')
  final String? additionalInstructions;

  @override
  String toString() {
    return 'JobDescriptionCreate(jobTitle: $jobTitle, skills: $skills, experienceRequired: $experienceRequired, educationQualifications: $educationQualifications, salary: $salary, workMode: $workMode, jobType: $jobType, location: $location, numberOfOpenings: $numberOfOpenings, department: $department, additionalInstructions: $additionalInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDescriptionCreateImpl &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.experienceRequired, experienceRequired) ||
                other.experienceRequired == experienceRequired) &&
            (identical(
                  other.educationQualifications,
                  educationQualifications,
                ) ||
                other.educationQualifications == educationQualifications) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.workMode, workMode) ||
                other.workMode == workMode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.numberOfOpenings, numberOfOpenings) ||
                other.numberOfOpenings == numberOfOpenings) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.additionalInstructions, additionalInstructions) ||
                other.additionalInstructions == additionalInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobTitle,
    const DeepCollectionEquality().hash(_skills),
    experienceRequired,
    educationQualifications,
    salary,
    workMode,
    jobType,
    location,
    numberOfOpenings,
    department,
    additionalInstructions,
  );

  /// Create a copy of JobDescriptionCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDescriptionCreateImplCopyWith<_$JobDescriptionCreateImpl>
  get copyWith =>
      __$$JobDescriptionCreateImplCopyWithImpl<_$JobDescriptionCreateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDescriptionCreateImplToJson(this);
  }
}

abstract class _JobDescriptionCreate implements JobDescriptionCreate {
  const factory _JobDescriptionCreate({
    @JsonKey(name: 'job_title') required final String jobTitle,
    required final List<String> skills,
    @JsonKey(name: 'experience_required')
    required final String experienceRequired,
    @JsonKey(name: 'education_qualifications')
    required final String educationQualifications,
    required final String salary,
    @JsonKey(name: 'work_mode') required final String workMode,
    @JsonKey(name: 'job_type') required final String jobType,
    required final String location,
    @JsonKey(name: 'number_of_openings') final int? numberOfOpenings,
    final String? department,
    @JsonKey(name: 'additional_instructions')
    final String? additionalInstructions,
  }) = _$JobDescriptionCreateImpl;

  factory _JobDescriptionCreate.fromJson(Map<String, dynamic> json) =
      _$JobDescriptionCreateImpl.fromJson;

  @override
  @JsonKey(name: 'job_title')
  String get jobTitle;
  @override
  List<String> get skills;
  @override
  @JsonKey(name: 'experience_required')
  String get experienceRequired;
  @override
  @JsonKey(name: 'education_qualifications')
  String get educationQualifications;
  @override
  String get salary;
  @override
  @JsonKey(name: 'work_mode')
  String get workMode;
  @override
  @JsonKey(name: 'job_type')
  String get jobType;
  @override
  String get location;
  @override
  @JsonKey(name: 'number_of_openings')
  int? get numberOfOpenings;
  @override
  String? get department;
  @override
  @JsonKey(name: 'additional_instructions')
  String? get additionalInstructions;

  /// Create a copy of JobDescriptionCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobDescriptionCreateImplCopyWith<_$JobDescriptionCreateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

GeneratedJD _$GeneratedJDFromJson(Map<String, dynamic> json) {
  return _GeneratedJD.fromJson(json);
}

/// @nodoc
mixin _$GeneratedJD {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_content')
  GeneratedContent get generatedContent => throw _privateConstructorUsedError;

  /// Serializes this GeneratedJD to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneratedJDCopyWith<GeneratedJD> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratedJDCopyWith<$Res> {
  factory $GeneratedJDCopyWith(
    GeneratedJD value,
    $Res Function(GeneratedJD) then,
  ) = _$GeneratedJDCopyWithImpl<$Res, GeneratedJD>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'generated_content') GeneratedContent generatedContent,
  });

  $GeneratedContentCopyWith<$Res> get generatedContent;
}

/// @nodoc
class _$GeneratedJDCopyWithImpl<$Res, $Val extends GeneratedJD>
    implements $GeneratedJDCopyWith<$Res> {
  _$GeneratedJDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobTitle = null,
    Object? generatedContent = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            jobTitle: null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            generatedContent: null == generatedContent
                ? _value.generatedContent
                : generatedContent // ignore: cast_nullable_to_non_nullable
                      as GeneratedContent,
          )
          as $Val,
    );
  }

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneratedContentCopyWith<$Res> get generatedContent {
    return $GeneratedContentCopyWith<$Res>(_value.generatedContent, (value) {
      return _then(_value.copyWith(generatedContent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeneratedJDImplCopyWith<$Res>
    implements $GeneratedJDCopyWith<$Res> {
  factory _$$GeneratedJDImplCopyWith(
    _$GeneratedJDImpl value,
    $Res Function(_$GeneratedJDImpl) then,
  ) = __$$GeneratedJDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'generated_content') GeneratedContent generatedContent,
  });

  @override
  $GeneratedContentCopyWith<$Res> get generatedContent;
}

/// @nodoc
class __$$GeneratedJDImplCopyWithImpl<$Res>
    extends _$GeneratedJDCopyWithImpl<$Res, _$GeneratedJDImpl>
    implements _$$GeneratedJDImplCopyWith<$Res> {
  __$$GeneratedJDImplCopyWithImpl(
    _$GeneratedJDImpl _value,
    $Res Function(_$GeneratedJDImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobTitle = null,
    Object? generatedContent = null,
  }) {
    return _then(
      _$GeneratedJDImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        jobTitle: null == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedContent: null == generatedContent
            ? _value.generatedContent
            : generatedContent // ignore: cast_nullable_to_non_nullable
                  as GeneratedContent,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneratedJDImpl implements _GeneratedJD {
  const _$GeneratedJDImpl({
    required this.id,
    @JsonKey(name: 'job_title') required this.jobTitle,
    @JsonKey(name: 'generated_content') required this.generatedContent,
  });

  factory _$GeneratedJDImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneratedJDImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @override
  @JsonKey(name: 'generated_content')
  final GeneratedContent generatedContent;

  @override
  String toString() {
    return 'GeneratedJD(id: $id, jobTitle: $jobTitle, generatedContent: $generatedContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedJDImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.generatedContent, generatedContent) ||
                other.generatedContent == generatedContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, jobTitle, generatedContent);

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratedJDImplCopyWith<_$GeneratedJDImpl> get copyWith =>
      __$$GeneratedJDImplCopyWithImpl<_$GeneratedJDImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneratedJDImplToJson(this);
  }
}

abstract class _GeneratedJD implements GeneratedJD {
  const factory _GeneratedJD({
    required final String id,
    @JsonKey(name: 'job_title') required final String jobTitle,
    @JsonKey(name: 'generated_content')
    required final GeneratedContent generatedContent,
  }) = _$GeneratedJDImpl;

  factory _GeneratedJD.fromJson(Map<String, dynamic> json) =
      _$GeneratedJDImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'job_title')
  String get jobTitle;
  @override
  @JsonKey(name: 'generated_content')
  GeneratedContent get generatedContent;

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratedJDImplCopyWith<_$GeneratedJDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeneratedContent _$GeneratedContentFromJson(Map<String, dynamic> json) {
  return _GeneratedContent.fromJson(json);
}

/// @nodoc
mixin _$GeneratedContent {
  @JsonKey(name: 'job_summary')
  String get jobSummary => throw _privateConstructorUsedError;
  List<String> get responsibilities => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_skills')
  List<String> get requiredSkills => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_qualifications')
  List<String> get requiredQualifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_qualifications')
  List<String> get preferredQualifications =>
      throw _privateConstructorUsedError;
  String get experience => throw _privateConstructorUsedError;
  String get salary => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_mode')
  String get workMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String get jobType => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;
  @JsonKey(name: 'equal_opportunity_statement')
  String get equalOpportunityStatement => throw _privateConstructorUsedError;

  /// Serializes this GeneratedContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneratedContentCopyWith<GeneratedContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratedContentCopyWith<$Res> {
  factory $GeneratedContentCopyWith(
    GeneratedContent value,
    $Res Function(GeneratedContent) then,
  ) = _$GeneratedContentCopyWithImpl<$Res, GeneratedContent>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_summary') String jobSummary,
    List<String> responsibilities,
    @JsonKey(name: 'required_skills') List<String> requiredSkills,
    @JsonKey(name: 'required_qualifications')
    List<String> requiredQualifications,
    @JsonKey(name: 'preferred_qualifications')
    List<String> preferredQualifications,
    String experience,
    String salary,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String location,
    List<String> benefits,
    @JsonKey(name: 'equal_opportunity_statement')
    String equalOpportunityStatement,
  });
}

/// @nodoc
class _$GeneratedContentCopyWithImpl<$Res, $Val extends GeneratedContent>
    implements $GeneratedContentCopyWith<$Res> {
  _$GeneratedContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobSummary = null,
    Object? responsibilities = null,
    Object? requiredSkills = null,
    Object? requiredQualifications = null,
    Object? preferredQualifications = null,
    Object? experience = null,
    Object? salary = null,
    Object? workMode = null,
    Object? jobType = null,
    Object? location = null,
    Object? benefits = null,
    Object? equalOpportunityStatement = null,
  }) {
    return _then(
      _value.copyWith(
            jobSummary: null == jobSummary
                ? _value.jobSummary
                : jobSummary // ignore: cast_nullable_to_non_nullable
                      as String,
            responsibilities: null == responsibilities
                ? _value.responsibilities
                : responsibilities // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            requiredSkills: null == requiredSkills
                ? _value.requiredSkills
                : requiredSkills // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            requiredQualifications: null == requiredQualifications
                ? _value.requiredQualifications
                : requiredQualifications // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preferredQualifications: null == preferredQualifications
                ? _value.preferredQualifications
                : preferredQualifications // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            experience: null == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String,
            salary: null == salary
                ? _value.salary
                : salary // ignore: cast_nullable_to_non_nullable
                      as String,
            workMode: null == workMode
                ? _value.workMode
                : workMode // ignore: cast_nullable_to_non_nullable
                      as String,
            jobType: null == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            benefits: null == benefits
                ? _value.benefits
                : benefits // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equalOpportunityStatement: null == equalOpportunityStatement
                ? _value.equalOpportunityStatement
                : equalOpportunityStatement // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeneratedContentImplCopyWith<$Res>
    implements $GeneratedContentCopyWith<$Res> {
  factory _$$GeneratedContentImplCopyWith(
    _$GeneratedContentImpl value,
    $Res Function(_$GeneratedContentImpl) then,
  ) = __$$GeneratedContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_summary') String jobSummary,
    List<String> responsibilities,
    @JsonKey(name: 'required_skills') List<String> requiredSkills,
    @JsonKey(name: 'required_qualifications')
    List<String> requiredQualifications,
    @JsonKey(name: 'preferred_qualifications')
    List<String> preferredQualifications,
    String experience,
    String salary,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String location,
    List<String> benefits,
    @JsonKey(name: 'equal_opportunity_statement')
    String equalOpportunityStatement,
  });
}

/// @nodoc
class __$$GeneratedContentImplCopyWithImpl<$Res>
    extends _$GeneratedContentCopyWithImpl<$Res, _$GeneratedContentImpl>
    implements _$$GeneratedContentImplCopyWith<$Res> {
  __$$GeneratedContentImplCopyWithImpl(
    _$GeneratedContentImpl _value,
    $Res Function(_$GeneratedContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobSummary = null,
    Object? responsibilities = null,
    Object? requiredSkills = null,
    Object? requiredQualifications = null,
    Object? preferredQualifications = null,
    Object? experience = null,
    Object? salary = null,
    Object? workMode = null,
    Object? jobType = null,
    Object? location = null,
    Object? benefits = null,
    Object? equalOpportunityStatement = null,
  }) {
    return _then(
      _$GeneratedContentImpl(
        jobSummary: null == jobSummary
            ? _value.jobSummary
            : jobSummary // ignore: cast_nullable_to_non_nullable
                  as String,
        responsibilities: null == responsibilities
            ? _value._responsibilities
            : responsibilities // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        requiredSkills: null == requiredSkills
            ? _value._requiredSkills
            : requiredSkills // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        requiredQualifications: null == requiredQualifications
            ? _value._requiredQualifications
            : requiredQualifications // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preferredQualifications: null == preferredQualifications
            ? _value._preferredQualifications
            : preferredQualifications // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        experience: null == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String,
        salary: null == salary
            ? _value.salary
            : salary // ignore: cast_nullable_to_non_nullable
                  as String,
        workMode: null == workMode
            ? _value.workMode
            : workMode // ignore: cast_nullable_to_non_nullable
                  as String,
        jobType: null == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        benefits: null == benefits
            ? _value._benefits
            : benefits // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equalOpportunityStatement: null == equalOpportunityStatement
            ? _value.equalOpportunityStatement
            : equalOpportunityStatement // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneratedContentImpl implements _GeneratedContent {
  const _$GeneratedContentImpl({
    @JsonKey(name: 'job_summary') required this.jobSummary,
    required final List<String> responsibilities,
    @JsonKey(name: 'required_skills')
    required final List<String> requiredSkills,
    @JsonKey(name: 'required_qualifications')
    required final List<String> requiredQualifications,
    @JsonKey(name: 'preferred_qualifications')
    required final List<String> preferredQualifications,
    required this.experience,
    required this.salary,
    @JsonKey(name: 'work_mode') required this.workMode,
    @JsonKey(name: 'job_type') required this.jobType,
    required this.location,
    final List<String> benefits = const [],
    @JsonKey(name: 'equal_opportunity_statement')
    this.equalOpportunityStatement = '',
  }) : _responsibilities = responsibilities,
       _requiredSkills = requiredSkills,
       _requiredQualifications = requiredQualifications,
       _preferredQualifications = preferredQualifications,
       _benefits = benefits;

  factory _$GeneratedContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneratedContentImplFromJson(json);

  @override
  @JsonKey(name: 'job_summary')
  final String jobSummary;
  final List<String> _responsibilities;
  @override
  List<String> get responsibilities {
    if (_responsibilities is EqualUnmodifiableListView)
      return _responsibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responsibilities);
  }

  final List<String> _requiredSkills;
  @override
  @JsonKey(name: 'required_skills')
  List<String> get requiredSkills {
    if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredSkills);
  }

  final List<String> _requiredQualifications;
  @override
  @JsonKey(name: 'required_qualifications')
  List<String> get requiredQualifications {
    if (_requiredQualifications is EqualUnmodifiableListView)
      return _requiredQualifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredQualifications);
  }

  final List<String> _preferredQualifications;
  @override
  @JsonKey(name: 'preferred_qualifications')
  List<String> get preferredQualifications {
    if (_preferredQualifications is EqualUnmodifiableListView)
      return _preferredQualifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredQualifications);
  }

  @override
  final String experience;
  @override
  final String salary;
  @override
  @JsonKey(name: 'work_mode')
  final String workMode;
  @override
  @JsonKey(name: 'job_type')
  final String jobType;
  @override
  final String location;
  final List<String> _benefits;
  @override
  @JsonKey()
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  @override
  @JsonKey(name: 'equal_opportunity_statement')
  final String equalOpportunityStatement;

  @override
  String toString() {
    return 'GeneratedContent(jobSummary: $jobSummary, responsibilities: $responsibilities, requiredSkills: $requiredSkills, requiredQualifications: $requiredQualifications, preferredQualifications: $preferredQualifications, experience: $experience, salary: $salary, workMode: $workMode, jobType: $jobType, location: $location, benefits: $benefits, equalOpportunityStatement: $equalOpportunityStatement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedContentImpl &&
            (identical(other.jobSummary, jobSummary) ||
                other.jobSummary == jobSummary) &&
            const DeepCollectionEquality().equals(
              other._responsibilities,
              _responsibilities,
            ) &&
            const DeepCollectionEquality().equals(
              other._requiredSkills,
              _requiredSkills,
            ) &&
            const DeepCollectionEquality().equals(
              other._requiredQualifications,
              _requiredQualifications,
            ) &&
            const DeepCollectionEquality().equals(
              other._preferredQualifications,
              _preferredQualifications,
            ) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.workMode, workMode) ||
                other.workMode == workMode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            (identical(
                  other.equalOpportunityStatement,
                  equalOpportunityStatement,
                ) ||
                other.equalOpportunityStatement == equalOpportunityStatement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobSummary,
    const DeepCollectionEquality().hash(_responsibilities),
    const DeepCollectionEquality().hash(_requiredSkills),
    const DeepCollectionEquality().hash(_requiredQualifications),
    const DeepCollectionEquality().hash(_preferredQualifications),
    experience,
    salary,
    workMode,
    jobType,
    location,
    const DeepCollectionEquality().hash(_benefits),
    equalOpportunityStatement,
  );

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratedContentImplCopyWith<_$GeneratedContentImpl> get copyWith =>
      __$$GeneratedContentImplCopyWithImpl<_$GeneratedContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneratedContentImplToJson(this);
  }
}

abstract class _GeneratedContent implements GeneratedContent {
  const factory _GeneratedContent({
    @JsonKey(name: 'job_summary') required final String jobSummary,
    required final List<String> responsibilities,
    @JsonKey(name: 'required_skills')
    required final List<String> requiredSkills,
    @JsonKey(name: 'required_qualifications')
    required final List<String> requiredQualifications,
    @JsonKey(name: 'preferred_qualifications')
    required final List<String> preferredQualifications,
    required final String experience,
    required final String salary,
    @JsonKey(name: 'work_mode') required final String workMode,
    @JsonKey(name: 'job_type') required final String jobType,
    required final String location,
    final List<String> benefits,
    @JsonKey(name: 'equal_opportunity_statement')
    final String equalOpportunityStatement,
  }) = _$GeneratedContentImpl;

  factory _GeneratedContent.fromJson(Map<String, dynamic> json) =
      _$GeneratedContentImpl.fromJson;

  @override
  @JsonKey(name: 'job_summary')
  String get jobSummary;
  @override
  List<String> get responsibilities;
  @override
  @JsonKey(name: 'required_skills')
  List<String> get requiredSkills;
  @override
  @JsonKey(name: 'required_qualifications')
  List<String> get requiredQualifications;
  @override
  @JsonKey(name: 'preferred_qualifications')
  List<String> get preferredQualifications;
  @override
  String get experience;
  @override
  String get salary;
  @override
  @JsonKey(name: 'work_mode')
  String get workMode;
  @override
  @JsonKey(name: 'job_type')
  String get jobType;
  @override
  String get location;
  @override
  List<String> get benefits;
  @override
  @JsonKey(name: 'equal_opportunity_statement')
  String get equalOpportunityStatement;

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratedContentImplCopyWith<_$GeneratedContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
