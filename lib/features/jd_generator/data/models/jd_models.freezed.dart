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

JobParameterCreate _$JobParameterCreateFromJson(Map<String, dynamic> json) {
  return _JobParameterCreate.fromJson(json);
}

/// @nodoc
mixin _$JobParameterCreate {
  @JsonKey(name: 'job_title')
  String get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_skills')
  String get requiredSkills => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_qualification')
  String get educationQualification => throw _privateConstructorUsedError;
  String get experience => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_mode')
  String get workMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String get jobType => throw _privateConstructorUsedError;
  String? get package => throw _privateConstructorUsedError;

  /// Serializes this JobParameterCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobParameterCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobParameterCreateCopyWith<JobParameterCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobParameterCreateCopyWith<$Res> {
  factory $JobParameterCreateCopyWith(
    JobParameterCreate value,
    $Res Function(JobParameterCreate) then,
  ) = _$JobParameterCreateCopyWithImpl<$Res, JobParameterCreate>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'required_skills') String requiredSkills,
    @JsonKey(name: 'education_qualification') String educationQualification,
    String experience,
    String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
  });
}

/// @nodoc
class _$JobParameterCreateCopyWithImpl<$Res, $Val extends JobParameterCreate>
    implements $JobParameterCreateCopyWith<$Res> {
  _$JobParameterCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobParameterCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobTitle = null,
    Object? requiredSkills = null,
    Object? educationQualification = null,
    Object? experience = null,
    Object? location = null,
    Object? passedoutYear = freezed,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobTitle: null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            requiredSkills: null == requiredSkills
                ? _value.requiredSkills
                : requiredSkills // ignore: cast_nullable_to_non_nullable
                      as String,
            educationQualification: null == educationQualification
                ? _value.educationQualification
                : educationQualification // ignore: cast_nullable_to_non_nullable
                      as String,
            experience: null == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            passedoutYear: freezed == passedoutYear
                ? _value.passedoutYear
                : passedoutYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            workMode: null == workMode
                ? _value.workMode
                : workMode // ignore: cast_nullable_to_non_nullable
                      as String,
            jobType: null == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as String,
            package: freezed == package
                ? _value.package
                : package // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobParameterCreateImplCopyWith<$Res>
    implements $JobParameterCreateCopyWith<$Res> {
  factory _$$JobParameterCreateImplCopyWith(
    _$JobParameterCreateImpl value,
    $Res Function(_$JobParameterCreateImpl) then,
  ) = __$$JobParameterCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'required_skills') String requiredSkills,
    @JsonKey(name: 'education_qualification') String educationQualification,
    String experience,
    String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
  });
}

/// @nodoc
class __$$JobParameterCreateImplCopyWithImpl<$Res>
    extends _$JobParameterCreateCopyWithImpl<$Res, _$JobParameterCreateImpl>
    implements _$$JobParameterCreateImplCopyWith<$Res> {
  __$$JobParameterCreateImplCopyWithImpl(
    _$JobParameterCreateImpl _value,
    $Res Function(_$JobParameterCreateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobParameterCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobTitle = null,
    Object? requiredSkills = null,
    Object? educationQualification = null,
    Object? experience = null,
    Object? location = null,
    Object? passedoutYear = freezed,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
  }) {
    return _then(
      _$JobParameterCreateImpl(
        jobTitle: null == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        requiredSkills: null == requiredSkills
            ? _value.requiredSkills
            : requiredSkills // ignore: cast_nullable_to_non_nullable
                  as String,
        educationQualification: null == educationQualification
            ? _value.educationQualification
            : educationQualification // ignore: cast_nullable_to_non_nullable
                  as String,
        experience: null == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        passedoutYear: freezed == passedoutYear
            ? _value.passedoutYear
            : passedoutYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        workMode: null == workMode
            ? _value.workMode
            : workMode // ignore: cast_nullable_to_non_nullable
                  as String,
        jobType: null == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as String,
        package: freezed == package
            ? _value.package
            : package // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobParameterCreateImpl implements _JobParameterCreate {
  const _$JobParameterCreateImpl({
    @JsonKey(name: 'job_title') required this.jobTitle,
    @JsonKey(name: 'required_skills') required this.requiredSkills,
    @JsonKey(name: 'education_qualification')
    required this.educationQualification,
    required this.experience,
    required this.location,
    @JsonKey(name: 'passedout_year') this.passedoutYear,
    @JsonKey(name: 'work_mode') required this.workMode,
    @JsonKey(name: 'job_type') required this.jobType,
    this.package,
  });

  factory _$JobParameterCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobParameterCreateImplFromJson(json);

  @override
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @override
  @JsonKey(name: 'required_skills')
  final String requiredSkills;
  @override
  @JsonKey(name: 'education_qualification')
  final String educationQualification;
  @override
  final String experience;
  @override
  final String location;
  @override
  @JsonKey(name: 'passedout_year')
  final int? passedoutYear;
  @override
  @JsonKey(name: 'work_mode')
  final String workMode;
  @override
  @JsonKey(name: 'job_type')
  final String jobType;
  @override
  final String? package;

  @override
  String toString() {
    return 'JobParameterCreate(jobTitle: $jobTitle, requiredSkills: $requiredSkills, educationQualification: $educationQualification, experience: $experience, location: $location, passedoutYear: $passedoutYear, workMode: $workMode, jobType: $jobType, package: $package)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobParameterCreateImpl &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.requiredSkills, requiredSkills) ||
                other.requiredSkills == requiredSkills) &&
            (identical(other.educationQualification, educationQualification) ||
                other.educationQualification == educationQualification) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.passedoutYear, passedoutYear) ||
                other.passedoutYear == passedoutYear) &&
            (identical(other.workMode, workMode) ||
                other.workMode == workMode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.package, package) || other.package == package));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobTitle,
    requiredSkills,
    educationQualification,
    experience,
    location,
    passedoutYear,
    workMode,
    jobType,
    package,
  );

  /// Create a copy of JobParameterCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobParameterCreateImplCopyWith<_$JobParameterCreateImpl> get copyWith =>
      __$$JobParameterCreateImplCopyWithImpl<_$JobParameterCreateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JobParameterCreateImplToJson(this);
  }
}

abstract class _JobParameterCreate implements JobParameterCreate {
  const factory _JobParameterCreate({
    @JsonKey(name: 'job_title') required final String jobTitle,
    @JsonKey(name: 'required_skills') required final String requiredSkills,
    @JsonKey(name: 'education_qualification')
    required final String educationQualification,
    required final String experience,
    required final String location,
    @JsonKey(name: 'passedout_year') final int? passedoutYear,
    @JsonKey(name: 'work_mode') required final String workMode,
    @JsonKey(name: 'job_type') required final String jobType,
    final String? package,
  }) = _$JobParameterCreateImpl;

  factory _JobParameterCreate.fromJson(Map<String, dynamic> json) =
      _$JobParameterCreateImpl.fromJson;

  @override
  @JsonKey(name: 'job_title')
  String get jobTitle;
  @override
  @JsonKey(name: 'required_skills')
  String get requiredSkills;
  @override
  @JsonKey(name: 'education_qualification')
  String get educationQualification;
  @override
  String get experience;
  @override
  String get location;
  @override
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear;
  @override
  @JsonKey(name: 'work_mode')
  String get workMode;
  @override
  @JsonKey(name: 'job_type')
  String get jobType;
  @override
  String? get package;

  /// Create a copy of JobParameterCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobParameterCreateImplCopyWith<_$JobParameterCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeneratedJD _$GeneratedJDFromJson(Map<String, dynamic> json) {
  return _GeneratedJD.fromJson(json);
}

/// @nodoc
mixin _$GeneratedJD {
  @JsonKey(name: 'jd_id')
  int get jdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'version_number')
  int get versionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_jd')
  String get generatedJd => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_jd')
  String? get updatedJd => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_published')
  bool get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  String? get publishedAt => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'jd_id') int jdId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'version_number') int versionNumber,
    @JsonKey(name: 'generated_jd') String generatedJd,
    @JsonKey(name: 'updated_jd') String? updatedJd,
    @JsonKey(name: 'is_published') bool isPublished,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'published_at') String? publishedAt,
  });
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
    Object? jdId = null,
    Object? jobId = null,
    Object? versionNumber = null,
    Object? generatedJd = null,
    Object? updatedJd = freezed,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            jdId: null == jdId
                ? _value.jdId
                : jdId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as int,
            versionNumber: null == versionNumber
                ? _value.versionNumber
                : versionNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            generatedJd: null == generatedJd
                ? _value.generatedJd
                : generatedJd // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedJd: freezed == updatedJd
                ? _value.updatedJd
                : updatedJd // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPublished: null == isPublished
                ? _value.isPublished
                : isPublished // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
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
    @JsonKey(name: 'jd_id') int jdId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'version_number') int versionNumber,
    @JsonKey(name: 'generated_jd') String generatedJd,
    @JsonKey(name: 'updated_jd') String? updatedJd,
    @JsonKey(name: 'is_published') bool isPublished,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'published_at') String? publishedAt,
  });
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
    Object? jdId = null,
    Object? jobId = null,
    Object? versionNumber = null,
    Object? generatedJd = null,
    Object? updatedJd = freezed,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
  }) {
    return _then(
      _$GeneratedJDImpl(
        jdId: null == jdId
            ? _value.jdId
            : jdId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as int,
        versionNumber: null == versionNumber
            ? _value.versionNumber
            : versionNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        generatedJd: null == generatedJd
            ? _value.generatedJd
            : generatedJd // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedJd: freezed == updatedJd
            ? _value.updatedJd
            : updatedJd // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPublished: null == isPublished
            ? _value.isPublished
            : isPublished // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneratedJDImpl implements _GeneratedJD {
  const _$GeneratedJDImpl({
    @JsonKey(name: 'jd_id') required this.jdId,
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'version_number') required this.versionNumber,
    @JsonKey(name: 'generated_jd') required this.generatedJd,
    @JsonKey(name: 'updated_jd') this.updatedJd,
    @JsonKey(name: 'is_published') required this.isPublished,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'published_at') this.publishedAt,
  });

  factory _$GeneratedJDImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneratedJDImplFromJson(json);

  @override
  @JsonKey(name: 'jd_id')
  final int jdId;
  @override
  @JsonKey(name: 'job_id')
  final int jobId;
  @override
  @JsonKey(name: 'version_number')
  final int versionNumber;
  @override
  @JsonKey(name: 'generated_jd')
  final String generatedJd;
  @override
  @JsonKey(name: 'updated_jd')
  final String? updatedJd;
  @override
  @JsonKey(name: 'is_published')
  final bool isPublished;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'published_at')
  final String? publishedAt;

  @override
  String toString() {
    return 'GeneratedJD(jdId: $jdId, jobId: $jobId, versionNumber: $versionNumber, generatedJd: $generatedJd, updatedJd: $updatedJd, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedJDImpl &&
            (identical(other.jdId, jdId) || other.jdId == jdId) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.generatedJd, generatedJd) ||
                other.generatedJd == generatedJd) &&
            (identical(other.updatedJd, updatedJd) ||
                other.updatedJd == updatedJd) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jdId,
    jobId,
    versionNumber,
    generatedJd,
    updatedJd,
    isPublished,
    createdAt,
    updatedAt,
    publishedAt,
  );

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
    @JsonKey(name: 'jd_id') required final int jdId,
    @JsonKey(name: 'job_id') required final int jobId,
    @JsonKey(name: 'version_number') required final int versionNumber,
    @JsonKey(name: 'generated_jd') required final String generatedJd,
    @JsonKey(name: 'updated_jd') final String? updatedJd,
    @JsonKey(name: 'is_published') required final bool isPublished,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
    @JsonKey(name: 'published_at') final String? publishedAt,
  }) = _$GeneratedJDImpl;

  factory _GeneratedJD.fromJson(Map<String, dynamic> json) =
      _$GeneratedJDImpl.fromJson;

  @override
  @JsonKey(name: 'jd_id')
  int get jdId;
  @override
  @JsonKey(name: 'job_id')
  int get jobId;
  @override
  @JsonKey(name: 'version_number')
  int get versionNumber;
  @override
  @JsonKey(name: 'generated_jd')
  String get generatedJd;
  @override
  @JsonKey(name: 'updated_jd')
  String? get updatedJd;
  @override
  @JsonKey(name: 'is_published')
  bool get isPublished;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'published_at')
  String? get publishedAt;

  /// Create a copy of GeneratedJD
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratedJDImplCopyWith<_$GeneratedJDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JobParameterUpdate _$JobParameterUpdateFromJson(Map<String, dynamic> json) {
  return _JobParameterUpdate.fromJson(json);
}

/// @nodoc
mixin _$JobParameterUpdate {
  @JsonKey(name: 'job_title')
  String? get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_skills')
  String? get requiredSkills => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_qualification')
  String? get educationQualification => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_mode')
  String? get workMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String? get jobType => throw _privateConstructorUsedError;
  String? get package => throw _privateConstructorUsedError;

  /// Serializes this JobParameterUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobParameterUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobParameterUpdateCopyWith<JobParameterUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobParameterUpdateCopyWith<$Res> {
  factory $JobParameterUpdateCopyWith(
    JobParameterUpdate value,
    $Res Function(JobParameterUpdate) then,
  ) = _$JobParameterUpdateCopyWithImpl<$Res, JobParameterUpdate>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'required_skills') String? requiredSkills,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    String? experience,
    String? location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String? workMode,
    @JsonKey(name: 'job_type') String? jobType,
    String? package,
  });
}

/// @nodoc
class _$JobParameterUpdateCopyWithImpl<$Res, $Val extends JobParameterUpdate>
    implements $JobParameterUpdateCopyWith<$Res> {
  _$JobParameterUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobParameterUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobTitle = freezed,
    Object? requiredSkills = freezed,
    Object? educationQualification = freezed,
    Object? experience = freezed,
    Object? location = freezed,
    Object? passedoutYear = freezed,
    Object? workMode = freezed,
    Object? jobType = freezed,
    Object? package = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobTitle: freezed == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            requiredSkills: freezed == requiredSkills
                ? _value.requiredSkills
                : requiredSkills // ignore: cast_nullable_to_non_nullable
                      as String?,
            educationQualification: freezed == educationQualification
                ? _value.educationQualification
                : educationQualification // ignore: cast_nullable_to_non_nullable
                      as String?,
            experience: freezed == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            passedoutYear: freezed == passedoutYear
                ? _value.passedoutYear
                : passedoutYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            workMode: freezed == workMode
                ? _value.workMode
                : workMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobType: freezed == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as String?,
            package: freezed == package
                ? _value.package
                : package // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobParameterUpdateImplCopyWith<$Res>
    implements $JobParameterUpdateCopyWith<$Res> {
  factory _$$JobParameterUpdateImplCopyWith(
    _$JobParameterUpdateImpl value,
    $Res Function(_$JobParameterUpdateImpl) then,
  ) = __$$JobParameterUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'required_skills') String? requiredSkills,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    String? experience,
    String? location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String? workMode,
    @JsonKey(name: 'job_type') String? jobType,
    String? package,
  });
}

/// @nodoc
class __$$JobParameterUpdateImplCopyWithImpl<$Res>
    extends _$JobParameterUpdateCopyWithImpl<$Res, _$JobParameterUpdateImpl>
    implements _$$JobParameterUpdateImplCopyWith<$Res> {
  __$$JobParameterUpdateImplCopyWithImpl(
    _$JobParameterUpdateImpl _value,
    $Res Function(_$JobParameterUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobParameterUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobTitle = freezed,
    Object? requiredSkills = freezed,
    Object? educationQualification = freezed,
    Object? experience = freezed,
    Object? location = freezed,
    Object? passedoutYear = freezed,
    Object? workMode = freezed,
    Object? jobType = freezed,
    Object? package = freezed,
  }) {
    return _then(
      _$JobParameterUpdateImpl(
        jobTitle: freezed == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        requiredSkills: freezed == requiredSkills
            ? _value.requiredSkills
            : requiredSkills // ignore: cast_nullable_to_non_nullable
                  as String?,
        educationQualification: freezed == educationQualification
            ? _value.educationQualification
            : educationQualification // ignore: cast_nullable_to_non_nullable
                  as String?,
        experience: freezed == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        passedoutYear: freezed == passedoutYear
            ? _value.passedoutYear
            : passedoutYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        workMode: freezed == workMode
            ? _value.workMode
            : workMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobType: freezed == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as String?,
        package: freezed == package
            ? _value.package
            : package // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobParameterUpdateImpl implements _JobParameterUpdate {
  const _$JobParameterUpdateImpl({
    @JsonKey(name: 'job_title') this.jobTitle,
    @JsonKey(name: 'required_skills') this.requiredSkills,
    @JsonKey(name: 'education_qualification') this.educationQualification,
    this.experience,
    this.location,
    @JsonKey(name: 'passedout_year') this.passedoutYear,
    @JsonKey(name: 'work_mode') this.workMode,
    @JsonKey(name: 'job_type') this.jobType,
    this.package,
  });

  factory _$JobParameterUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobParameterUpdateImplFromJson(json);

  @override
  @JsonKey(name: 'job_title')
  final String? jobTitle;
  @override
  @JsonKey(name: 'required_skills')
  final String? requiredSkills;
  @override
  @JsonKey(name: 'education_qualification')
  final String? educationQualification;
  @override
  final String? experience;
  @override
  final String? location;
  @override
  @JsonKey(name: 'passedout_year')
  final int? passedoutYear;
  @override
  @JsonKey(name: 'work_mode')
  final String? workMode;
  @override
  @JsonKey(name: 'job_type')
  final String? jobType;
  @override
  final String? package;

  @override
  String toString() {
    return 'JobParameterUpdate(jobTitle: $jobTitle, requiredSkills: $requiredSkills, educationQualification: $educationQualification, experience: $experience, location: $location, passedoutYear: $passedoutYear, workMode: $workMode, jobType: $jobType, package: $package)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobParameterUpdateImpl &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.requiredSkills, requiredSkills) ||
                other.requiredSkills == requiredSkills) &&
            (identical(other.educationQualification, educationQualification) ||
                other.educationQualification == educationQualification) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.passedoutYear, passedoutYear) ||
                other.passedoutYear == passedoutYear) &&
            (identical(other.workMode, workMode) ||
                other.workMode == workMode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.package, package) || other.package == package));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobTitle,
    requiredSkills,
    educationQualification,
    experience,
    location,
    passedoutYear,
    workMode,
    jobType,
    package,
  );

  /// Create a copy of JobParameterUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobParameterUpdateImplCopyWith<_$JobParameterUpdateImpl> get copyWith =>
      __$$JobParameterUpdateImplCopyWithImpl<_$JobParameterUpdateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JobParameterUpdateImplToJson(this);
  }
}

abstract class _JobParameterUpdate implements JobParameterUpdate {
  const factory _JobParameterUpdate({
    @JsonKey(name: 'job_title') final String? jobTitle,
    @JsonKey(name: 'required_skills') final String? requiredSkills,
    @JsonKey(name: 'education_qualification')
    final String? educationQualification,
    final String? experience,
    final String? location,
    @JsonKey(name: 'passedout_year') final int? passedoutYear,
    @JsonKey(name: 'work_mode') final String? workMode,
    @JsonKey(name: 'job_type') final String? jobType,
    final String? package,
  }) = _$JobParameterUpdateImpl;

  factory _JobParameterUpdate.fromJson(Map<String, dynamic> json) =
      _$JobParameterUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'job_title')
  String? get jobTitle;
  @override
  @JsonKey(name: 'required_skills')
  String? get requiredSkills;
  @override
  @JsonKey(name: 'education_qualification')
  String? get educationQualification;
  @override
  String? get experience;
  @override
  String? get location;
  @override
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear;
  @override
  @JsonKey(name: 'work_mode')
  String? get workMode;
  @override
  @JsonKey(name: 'job_type')
  String? get jobType;
  @override
  String? get package;

  /// Create a copy of JobParameterUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobParameterUpdateImplCopyWith<_$JobParameterUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JobParameterResponse _$JobParameterResponseFromJson(Map<String, dynamic> json) {
  return _JobParameterResponse.fromJson(json);
}

/// @nodoc
mixin _$JobParameterResponse {
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recruiter_id')
  int get recruiterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_skills')
  String get requiredSkills => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_qualification')
  String get educationQualification => throw _privateConstructorUsedError;
  String get experience => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_mode')
  String get workMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String get jobType => throw _privateConstructorUsedError;
  String? get package => throw _privateConstructorUsedError;

  /// Serializes this JobParameterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobParameterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobParameterResponseCopyWith<JobParameterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobParameterResponseCopyWith<$Res> {
  factory $JobParameterResponseCopyWith(
    JobParameterResponse value,
    $Res Function(JobParameterResponse) then,
  ) = _$JobParameterResponseCopyWithImpl<$Res, JobParameterResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'recruiter_id') int recruiterId,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'required_skills') String requiredSkills,
    @JsonKey(name: 'education_qualification') String educationQualification,
    String experience,
    String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
  });
}

/// @nodoc
class _$JobParameterResponseCopyWithImpl<
  $Res,
  $Val extends JobParameterResponse
>
    implements $JobParameterResponseCopyWith<$Res> {
  _$JobParameterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobParameterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? recruiterId = null,
    Object? jobTitle = null,
    Object? requiredSkills = null,
    Object? educationQualification = null,
    Object? experience = null,
    Object? location = null,
    Object? passedoutYear = freezed,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as int,
            recruiterId: null == recruiterId
                ? _value.recruiterId
                : recruiterId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobTitle: null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            requiredSkills: null == requiredSkills
                ? _value.requiredSkills
                : requiredSkills // ignore: cast_nullable_to_non_nullable
                      as String,
            educationQualification: null == educationQualification
                ? _value.educationQualification
                : educationQualification // ignore: cast_nullable_to_non_nullable
                      as String,
            experience: null == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            passedoutYear: freezed == passedoutYear
                ? _value.passedoutYear
                : passedoutYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            workMode: null == workMode
                ? _value.workMode
                : workMode // ignore: cast_nullable_to_non_nullable
                      as String,
            jobType: null == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as String,
            package: freezed == package
                ? _value.package
                : package // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobParameterResponseImplCopyWith<$Res>
    implements $JobParameterResponseCopyWith<$Res> {
  factory _$$JobParameterResponseImplCopyWith(
    _$JobParameterResponseImpl value,
    $Res Function(_$JobParameterResponseImpl) then,
  ) = __$$JobParameterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'recruiter_id') int recruiterId,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'required_skills') String requiredSkills,
    @JsonKey(name: 'education_qualification') String educationQualification,
    String experience,
    String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
  });
}

/// @nodoc
class __$$JobParameterResponseImplCopyWithImpl<$Res>
    extends _$JobParameterResponseCopyWithImpl<$Res, _$JobParameterResponseImpl>
    implements _$$JobParameterResponseImplCopyWith<$Res> {
  __$$JobParameterResponseImplCopyWithImpl(
    _$JobParameterResponseImpl _value,
    $Res Function(_$JobParameterResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobParameterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? recruiterId = null,
    Object? jobTitle = null,
    Object? requiredSkills = null,
    Object? educationQualification = null,
    Object? experience = null,
    Object? location = null,
    Object? passedoutYear = freezed,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
  }) {
    return _then(
      _$JobParameterResponseImpl(
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as int,
        recruiterId: null == recruiterId
            ? _value.recruiterId
            : recruiterId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobTitle: null == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        requiredSkills: null == requiredSkills
            ? _value.requiredSkills
            : requiredSkills // ignore: cast_nullable_to_non_nullable
                  as String,
        educationQualification: null == educationQualification
            ? _value.educationQualification
            : educationQualification // ignore: cast_nullable_to_non_nullable
                  as String,
        experience: null == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        passedoutYear: freezed == passedoutYear
            ? _value.passedoutYear
            : passedoutYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        workMode: null == workMode
            ? _value.workMode
            : workMode // ignore: cast_nullable_to_non_nullable
                  as String,
        jobType: null == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as String,
        package: freezed == package
            ? _value.package
            : package // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobParameterResponseImpl implements _JobParameterResponse {
  const _$JobParameterResponseImpl({
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'recruiter_id') required this.recruiterId,
    @JsonKey(name: 'job_title') required this.jobTitle,
    @JsonKey(name: 'required_skills') required this.requiredSkills,
    @JsonKey(name: 'education_qualification')
    required this.educationQualification,
    required this.experience,
    required this.location,
    @JsonKey(name: 'passedout_year') this.passedoutYear,
    @JsonKey(name: 'work_mode') required this.workMode,
    @JsonKey(name: 'job_type') required this.jobType,
    this.package,
  });

  factory _$JobParameterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobParameterResponseImplFromJson(json);

  @override
  @JsonKey(name: 'job_id')
  final int jobId;
  @override
  @JsonKey(name: 'recruiter_id')
  final int recruiterId;
  @override
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @override
  @JsonKey(name: 'required_skills')
  final String requiredSkills;
  @override
  @JsonKey(name: 'education_qualification')
  final String educationQualification;
  @override
  final String experience;
  @override
  final String location;
  @override
  @JsonKey(name: 'passedout_year')
  final int? passedoutYear;
  @override
  @JsonKey(name: 'work_mode')
  final String workMode;
  @override
  @JsonKey(name: 'job_type')
  final String jobType;
  @override
  final String? package;

  @override
  String toString() {
    return 'JobParameterResponse(jobId: $jobId, recruiterId: $recruiterId, jobTitle: $jobTitle, requiredSkills: $requiredSkills, educationQualification: $educationQualification, experience: $experience, location: $location, passedoutYear: $passedoutYear, workMode: $workMode, jobType: $jobType, package: $package)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobParameterResponseImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.recruiterId, recruiterId) ||
                other.recruiterId == recruiterId) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.requiredSkills, requiredSkills) ||
                other.requiredSkills == requiredSkills) &&
            (identical(other.educationQualification, educationQualification) ||
                other.educationQualification == educationQualification) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.passedoutYear, passedoutYear) ||
                other.passedoutYear == passedoutYear) &&
            (identical(other.workMode, workMode) ||
                other.workMode == workMode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.package, package) || other.package == package));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobId,
    recruiterId,
    jobTitle,
    requiredSkills,
    educationQualification,
    experience,
    location,
    passedoutYear,
    workMode,
    jobType,
    package,
  );

  /// Create a copy of JobParameterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobParameterResponseImplCopyWith<_$JobParameterResponseImpl>
  get copyWith =>
      __$$JobParameterResponseImplCopyWithImpl<_$JobParameterResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JobParameterResponseImplToJson(this);
  }
}

abstract class _JobParameterResponse implements JobParameterResponse {
  const factory _JobParameterResponse({
    @JsonKey(name: 'job_id') required final int jobId,
    @JsonKey(name: 'recruiter_id') required final int recruiterId,
    @JsonKey(name: 'job_title') required final String jobTitle,
    @JsonKey(name: 'required_skills') required final String requiredSkills,
    @JsonKey(name: 'education_qualification')
    required final String educationQualification,
    required final String experience,
    required final String location,
    @JsonKey(name: 'passedout_year') final int? passedoutYear,
    @JsonKey(name: 'work_mode') required final String workMode,
    @JsonKey(name: 'job_type') required final String jobType,
    final String? package,
  }) = _$JobParameterResponseImpl;

  factory _JobParameterResponse.fromJson(Map<String, dynamic> json) =
      _$JobParameterResponseImpl.fromJson;

  @override
  @JsonKey(name: 'job_id')
  int get jobId;
  @override
  @JsonKey(name: 'recruiter_id')
  int get recruiterId;
  @override
  @JsonKey(name: 'job_title')
  String get jobTitle;
  @override
  @JsonKey(name: 'required_skills')
  String get requiredSkills;
  @override
  @JsonKey(name: 'education_qualification')
  String get educationQualification;
  @override
  String get experience;
  @override
  String get location;
  @override
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear;
  @override
  @JsonKey(name: 'work_mode')
  String get workMode;
  @override
  @JsonKey(name: 'job_type')
  String get jobType;
  @override
  String? get package;

  /// Create a copy of JobParameterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobParameterResponseImplCopyWith<_$JobParameterResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

JobDescriptionResponse _$JobDescriptionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _JobDescriptionResponse.fromJson(json);
}

/// @nodoc
mixin _$JobDescriptionResponse {
  @JsonKey(name: 'jd_id')
  int get jdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'version_number')
  int get versionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_jd')
  String get generatedJd => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_jd')
  String? get updatedJd => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_published')
  bool get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;

  /// Serializes this JobDescriptionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobDescriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobDescriptionResponseCopyWith<JobDescriptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDescriptionResponseCopyWith<$Res> {
  factory $JobDescriptionResponseCopyWith(
    JobDescriptionResponse value,
    $Res Function(JobDescriptionResponse) then,
  ) = _$JobDescriptionResponseCopyWithImpl<$Res, JobDescriptionResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'jd_id') int jdId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'version_number') int versionNumber,
    @JsonKey(name: 'generated_jd') String generatedJd,
    @JsonKey(name: 'updated_jd') String? updatedJd,
    @JsonKey(name: 'is_published') bool isPublished,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
  });
}

/// @nodoc
class _$JobDescriptionResponseCopyWithImpl<
  $Res,
  $Val extends JobDescriptionResponse
>
    implements $JobDescriptionResponseCopyWith<$Res> {
  _$JobDescriptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobDescriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jdId = null,
    Object? jobId = null,
    Object? versionNumber = null,
    Object? generatedJd = null,
    Object? updatedJd = freezed,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            jdId: null == jdId
                ? _value.jdId
                : jdId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as int,
            versionNumber: null == versionNumber
                ? _value.versionNumber
                : versionNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            generatedJd: null == generatedJd
                ? _value.generatedJd
                : generatedJd // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedJd: freezed == updatedJd
                ? _value.updatedJd
                : updatedJd // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPublished: null == isPublished
                ? _value.isPublished
                : isPublished // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobDescriptionResponseImplCopyWith<$Res>
    implements $JobDescriptionResponseCopyWith<$Res> {
  factory _$$JobDescriptionResponseImplCopyWith(
    _$JobDescriptionResponseImpl value,
    $Res Function(_$JobDescriptionResponseImpl) then,
  ) = __$$JobDescriptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'jd_id') int jdId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'version_number') int versionNumber,
    @JsonKey(name: 'generated_jd') String generatedJd,
    @JsonKey(name: 'updated_jd') String? updatedJd,
    @JsonKey(name: 'is_published') bool isPublished,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
  });
}

/// @nodoc
class __$$JobDescriptionResponseImplCopyWithImpl<$Res>
    extends
        _$JobDescriptionResponseCopyWithImpl<$Res, _$JobDescriptionResponseImpl>
    implements _$$JobDescriptionResponseImplCopyWith<$Res> {
  __$$JobDescriptionResponseImplCopyWithImpl(
    _$JobDescriptionResponseImpl _value,
    $Res Function(_$JobDescriptionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobDescriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jdId = null,
    Object? jobId = null,
    Object? versionNumber = null,
    Object? generatedJd = null,
    Object? updatedJd = freezed,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = freezed,
  }) {
    return _then(
      _$JobDescriptionResponseImpl(
        jdId: null == jdId
            ? _value.jdId
            : jdId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as int,
        versionNumber: null == versionNumber
            ? _value.versionNumber
            : versionNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        generatedJd: null == generatedJd
            ? _value.generatedJd
            : generatedJd // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedJd: freezed == updatedJd
            ? _value.updatedJd
            : updatedJd // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPublished: null == isPublished
            ? _value.isPublished
            : isPublished // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobDescriptionResponseImpl implements _JobDescriptionResponse {
  const _$JobDescriptionResponseImpl({
    @JsonKey(name: 'jd_id') required this.jdId,
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'version_number') required this.versionNumber,
    @JsonKey(name: 'generated_jd') required this.generatedJd,
    @JsonKey(name: 'updated_jd') this.updatedJd,
    @JsonKey(name: 'is_published') required this.isPublished,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'published_at') this.publishedAt,
  });

  factory _$JobDescriptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDescriptionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'jd_id')
  final int jdId;
  @override
  @JsonKey(name: 'job_id')
  final int jobId;
  @override
  @JsonKey(name: 'version_number')
  final int versionNumber;
  @override
  @JsonKey(name: 'generated_jd')
  final String generatedJd;
  @override
  @JsonKey(name: 'updated_jd')
  final String? updatedJd;
  @override
  @JsonKey(name: 'is_published')
  final bool isPublished;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;

  @override
  String toString() {
    return 'JobDescriptionResponse(jdId: $jdId, jobId: $jobId, versionNumber: $versionNumber, generatedJd: $generatedJd, updatedJd: $updatedJd, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDescriptionResponseImpl &&
            (identical(other.jdId, jdId) || other.jdId == jdId) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.generatedJd, generatedJd) ||
                other.generatedJd == generatedJd) &&
            (identical(other.updatedJd, updatedJd) ||
                other.updatedJd == updatedJd) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jdId,
    jobId,
    versionNumber,
    generatedJd,
    updatedJd,
    isPublished,
    createdAt,
    updatedAt,
    publishedAt,
  );

  /// Create a copy of JobDescriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDescriptionResponseImplCopyWith<_$JobDescriptionResponseImpl>
  get copyWith =>
      __$$JobDescriptionResponseImplCopyWithImpl<_$JobDescriptionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDescriptionResponseImplToJson(this);
  }
}

abstract class _JobDescriptionResponse implements JobDescriptionResponse {
  const factory _JobDescriptionResponse({
    @JsonKey(name: 'jd_id') required final int jdId,
    @JsonKey(name: 'job_id') required final int jobId,
    @JsonKey(name: 'version_number') required final int versionNumber,
    @JsonKey(name: 'generated_jd') required final String generatedJd,
    @JsonKey(name: 'updated_jd') final String? updatedJd,
    @JsonKey(name: 'is_published') required final bool isPublished,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'published_at') final DateTime? publishedAt,
  }) = _$JobDescriptionResponseImpl;

  factory _JobDescriptionResponse.fromJson(Map<String, dynamic> json) =
      _$JobDescriptionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'jd_id')
  int get jdId;
  @override
  @JsonKey(name: 'job_id')
  int get jobId;
  @override
  @JsonKey(name: 'version_number')
  int get versionNumber;
  @override
  @JsonKey(name: 'generated_jd')
  String get generatedJd;
  @override
  @JsonKey(name: 'updated_jd')
  String? get updatedJd;
  @override
  @JsonKey(name: 'is_published')
  bool get isPublished;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;

  /// Create a copy of JobDescriptionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobDescriptionResponseImplCopyWith<_$JobDescriptionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

JobDescriptionUpdate _$JobDescriptionUpdateFromJson(Map<String, dynamic> json) {
  return _JobDescriptionUpdate.fromJson(json);
}

/// @nodoc
mixin _$JobDescriptionUpdate {
  @JsonKey(name: 'updated_jd')
  String get updatedJd => throw _privateConstructorUsedError;

  /// Serializes this JobDescriptionUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobDescriptionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobDescriptionUpdateCopyWith<JobDescriptionUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDescriptionUpdateCopyWith<$Res> {
  factory $JobDescriptionUpdateCopyWith(
    JobDescriptionUpdate value,
    $Res Function(JobDescriptionUpdate) then,
  ) = _$JobDescriptionUpdateCopyWithImpl<$Res, JobDescriptionUpdate>;
  @useResult
  $Res call({@JsonKey(name: 'updated_jd') String updatedJd});
}

/// @nodoc
class _$JobDescriptionUpdateCopyWithImpl<
  $Res,
  $Val extends JobDescriptionUpdate
>
    implements $JobDescriptionUpdateCopyWith<$Res> {
  _$JobDescriptionUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobDescriptionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? updatedJd = null}) {
    return _then(
      _value.copyWith(
            updatedJd: null == updatedJd
                ? _value.updatedJd
                : updatedJd // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JobDescriptionUpdateImplCopyWith<$Res>
    implements $JobDescriptionUpdateCopyWith<$Res> {
  factory _$$JobDescriptionUpdateImplCopyWith(
    _$JobDescriptionUpdateImpl value,
    $Res Function(_$JobDescriptionUpdateImpl) then,
  ) = __$$JobDescriptionUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'updated_jd') String updatedJd});
}

/// @nodoc
class __$$JobDescriptionUpdateImplCopyWithImpl<$Res>
    extends _$JobDescriptionUpdateCopyWithImpl<$Res, _$JobDescriptionUpdateImpl>
    implements _$$JobDescriptionUpdateImplCopyWith<$Res> {
  __$$JobDescriptionUpdateImplCopyWithImpl(
    _$JobDescriptionUpdateImpl _value,
    $Res Function(_$JobDescriptionUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JobDescriptionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? updatedJd = null}) {
    return _then(
      _$JobDescriptionUpdateImpl(
        updatedJd: null == updatedJd
            ? _value.updatedJd
            : updatedJd // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobDescriptionUpdateImpl implements _JobDescriptionUpdate {
  const _$JobDescriptionUpdateImpl({
    @JsonKey(name: 'updated_jd') required this.updatedJd,
  });

  factory _$JobDescriptionUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDescriptionUpdateImplFromJson(json);

  @override
  @JsonKey(name: 'updated_jd')
  final String updatedJd;

  @override
  String toString() {
    return 'JobDescriptionUpdate(updatedJd: $updatedJd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDescriptionUpdateImpl &&
            (identical(other.updatedJd, updatedJd) ||
                other.updatedJd == updatedJd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, updatedJd);

  /// Create a copy of JobDescriptionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDescriptionUpdateImplCopyWith<_$JobDescriptionUpdateImpl>
  get copyWith =>
      __$$JobDescriptionUpdateImplCopyWithImpl<_$JobDescriptionUpdateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDescriptionUpdateImplToJson(this);
  }
}

abstract class _JobDescriptionUpdate implements JobDescriptionUpdate {
  const factory _JobDescriptionUpdate({
    @JsonKey(name: 'updated_jd') required final String updatedJd,
  }) = _$JobDescriptionUpdateImpl;

  factory _JobDescriptionUpdate.fromJson(Map<String, dynamic> json) =
      _$JobDescriptionUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'updated_jd')
  String get updatedJd;

  /// Create a copy of JobDescriptionUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobDescriptionUpdateImplCopyWith<_$JobDescriptionUpdateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
