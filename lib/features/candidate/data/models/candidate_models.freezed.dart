// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CandidateDetails _$CandidateDetailsFromJson(Map<String, dynamic> json) {
  return _CandidateDetails.fromJson(json);
}

/// @nodoc
mixin _$CandidateDetails {
  @JsonKey(name: 'candidate_details_id')
  int get candidateDetailsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_id')
  int get candidateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_qualification')
  String? get educationQualification => throw _privateConstructorUsedError;
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_work_mode')
  String? get preferredWorkMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_job_type')
  String? get preferredJobType => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_work_location')
  String? get preferredWorkLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get resume => throw _privateConstructorUsedError;
  @JsonKey(name: 'github_url')
  String? get githubUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedin_url')
  String? get linkedinUrl => throw _privateConstructorUsedError;

  /// Serializes this CandidateDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateDetailsCopyWith<CandidateDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateDetailsCopyWith<$Res> {
  factory $CandidateDetailsCopyWith(
    CandidateDetails value,
    $Res Function(CandidateDetails) then,
  ) = _$CandidateDetailsCopyWithImpl<$Res, CandidateDetails>;
  @useResult
  $Res call({
    @JsonKey(name: 'candidate_details_id') int candidateDetailsId,
    @JsonKey(name: 'candidate_id') int candidateId,
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
  });
}

/// @nodoc
class _$CandidateDetailsCopyWithImpl<$Res, $Val extends CandidateDetails>
    implements $CandidateDetailsCopyWith<$Res> {
  _$CandidateDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidateDetailsId = null,
    Object? candidateId = null,
    Object? educationQualification = freezed,
    Object? passedoutYear = freezed,
    Object? experience = freezed,
    Object? skills = freezed,
    Object? preferredWorkMode = freezed,
    Object? preferredJobType = freezed,
    Object? preferredWorkLocation = freezed,
    Object? profilePicture = freezed,
    Object? resume = freezed,
    Object? githubUrl = freezed,
    Object? linkedinUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            candidateDetailsId: null == candidateDetailsId
                ? _value.candidateDetailsId
                : candidateDetailsId // ignore: cast_nullable_to_non_nullable
                      as int,
            candidateId: null == candidateId
                ? _value.candidateId
                : candidateId // ignore: cast_nullable_to_non_nullable
                      as int,
            educationQualification: freezed == educationQualification
                ? _value.educationQualification
                : educationQualification // ignore: cast_nullable_to_non_nullable
                      as String?,
            passedoutYear: freezed == passedoutYear
                ? _value.passedoutYear
                : passedoutYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            experience: freezed == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String?,
            skills: freezed == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredWorkMode: freezed == preferredWorkMode
                ? _value.preferredWorkMode
                : preferredWorkMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredJobType: freezed == preferredJobType
                ? _value.preferredJobType
                : preferredJobType // ignore: cast_nullable_to_non_nullable
                      as String?,
            preferredWorkLocation: freezed == preferredWorkLocation
                ? _value.preferredWorkLocation
                : preferredWorkLocation // ignore: cast_nullable_to_non_nullable
                      as String?,
            profilePicture: freezed == profilePicture
                ? _value.profilePicture
                : profilePicture // ignore: cast_nullable_to_non_nullable
                      as String?,
            resume: freezed == resume
                ? _value.resume
                : resume // ignore: cast_nullable_to_non_nullable
                      as String?,
            githubUrl: freezed == githubUrl
                ? _value.githubUrl
                : githubUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkedinUrl: freezed == linkedinUrl
                ? _value.linkedinUrl
                : linkedinUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CandidateDetailsImplCopyWith<$Res>
    implements $CandidateDetailsCopyWith<$Res> {
  factory _$$CandidateDetailsImplCopyWith(
    _$CandidateDetailsImpl value,
    $Res Function(_$CandidateDetailsImpl) then,
  ) = __$$CandidateDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'candidate_details_id') int candidateDetailsId,
    @JsonKey(name: 'candidate_id') int candidateId,
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
  });
}

/// @nodoc
class __$$CandidateDetailsImplCopyWithImpl<$Res>
    extends _$CandidateDetailsCopyWithImpl<$Res, _$CandidateDetailsImpl>
    implements _$$CandidateDetailsImplCopyWith<$Res> {
  __$$CandidateDetailsImplCopyWithImpl(
    _$CandidateDetailsImpl _value,
    $Res Function(_$CandidateDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidateDetailsId = null,
    Object? candidateId = null,
    Object? educationQualification = freezed,
    Object? passedoutYear = freezed,
    Object? experience = freezed,
    Object? skills = freezed,
    Object? preferredWorkMode = freezed,
    Object? preferredJobType = freezed,
    Object? preferredWorkLocation = freezed,
    Object? profilePicture = freezed,
    Object? resume = freezed,
    Object? githubUrl = freezed,
    Object? linkedinUrl = freezed,
  }) {
    return _then(
      _$CandidateDetailsImpl(
        candidateDetailsId: null == candidateDetailsId
            ? _value.candidateDetailsId
            : candidateDetailsId // ignore: cast_nullable_to_non_nullable
                  as int,
        candidateId: null == candidateId
            ? _value.candidateId
            : candidateId // ignore: cast_nullable_to_non_nullable
                  as int,
        educationQualification: freezed == educationQualification
            ? _value.educationQualification
            : educationQualification // ignore: cast_nullable_to_non_nullable
                  as String?,
        passedoutYear: freezed == passedoutYear
            ? _value.passedoutYear
            : passedoutYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        experience: freezed == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String?,
        skills: freezed == skills
            ? _value.skills
            : skills // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredWorkMode: freezed == preferredWorkMode
            ? _value.preferredWorkMode
            : preferredWorkMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredJobType: freezed == preferredJobType
            ? _value.preferredJobType
            : preferredJobType // ignore: cast_nullable_to_non_nullable
                  as String?,
        preferredWorkLocation: freezed == preferredWorkLocation
            ? _value.preferredWorkLocation
            : preferredWorkLocation // ignore: cast_nullable_to_non_nullable
                  as String?,
        profilePicture: freezed == profilePicture
            ? _value.profilePicture
            : profilePicture // ignore: cast_nullable_to_non_nullable
                  as String?,
        resume: freezed == resume
            ? _value.resume
            : resume // ignore: cast_nullable_to_non_nullable
                  as String?,
        githubUrl: freezed == githubUrl
            ? _value.githubUrl
            : githubUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkedinUrl: freezed == linkedinUrl
            ? _value.linkedinUrl
            : linkedinUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateDetailsImpl implements _CandidateDetails {
  const _$CandidateDetailsImpl({
    @JsonKey(name: 'candidate_details_id') required this.candidateDetailsId,
    @JsonKey(name: 'candidate_id') required this.candidateId,
    @JsonKey(name: 'education_qualification') this.educationQualification,
    @JsonKey(name: 'passedout_year') this.passedoutYear,
    this.experience,
    this.skills,
    @JsonKey(name: 'preferred_work_mode') this.preferredWorkMode,
    @JsonKey(name: 'preferred_job_type') this.preferredJobType,
    @JsonKey(name: 'preferred_work_location') this.preferredWorkLocation,
    @JsonKey(name: 'profile_picture') this.profilePicture,
    this.resume,
    @JsonKey(name: 'github_url') this.githubUrl,
    @JsonKey(name: 'linkedin_url') this.linkedinUrl,
  });

  factory _$CandidateDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'candidate_details_id')
  final int candidateDetailsId;
  @override
  @JsonKey(name: 'candidate_id')
  final int candidateId;
  @override
  @JsonKey(name: 'education_qualification')
  final String? educationQualification;
  @override
  @JsonKey(name: 'passedout_year')
  final int? passedoutYear;
  @override
  final String? experience;
  @override
  final String? skills;
  @override
  @JsonKey(name: 'preferred_work_mode')
  final String? preferredWorkMode;
  @override
  @JsonKey(name: 'preferred_job_type')
  final String? preferredJobType;
  @override
  @JsonKey(name: 'preferred_work_location')
  final String? preferredWorkLocation;
  @override
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @override
  final String? resume;
  @override
  @JsonKey(name: 'github_url')
  final String? githubUrl;
  @override
  @JsonKey(name: 'linkedin_url')
  final String? linkedinUrl;

  @override
  String toString() {
    return 'CandidateDetails(candidateDetailsId: $candidateDetailsId, candidateId: $candidateId, educationQualification: $educationQualification, passedoutYear: $passedoutYear, experience: $experience, skills: $skills, preferredWorkMode: $preferredWorkMode, preferredJobType: $preferredJobType, preferredWorkLocation: $preferredWorkLocation, profilePicture: $profilePicture, resume: $resume, githubUrl: $githubUrl, linkedinUrl: $linkedinUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateDetailsImpl &&
            (identical(other.candidateDetailsId, candidateDetailsId) ||
                other.candidateDetailsId == candidateDetailsId) &&
            (identical(other.candidateId, candidateId) ||
                other.candidateId == candidateId) &&
            (identical(other.educationQualification, educationQualification) ||
                other.educationQualification == educationQualification) &&
            (identical(other.passedoutYear, passedoutYear) ||
                other.passedoutYear == passedoutYear) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.preferredWorkMode, preferredWorkMode) ||
                other.preferredWorkMode == preferredWorkMode) &&
            (identical(other.preferredJobType, preferredJobType) ||
                other.preferredJobType == preferredJobType) &&
            (identical(other.preferredWorkLocation, preferredWorkLocation) ||
                other.preferredWorkLocation == preferredWorkLocation) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.resume, resume) || other.resume == resume) &&
            (identical(other.githubUrl, githubUrl) ||
                other.githubUrl == githubUrl) &&
            (identical(other.linkedinUrl, linkedinUrl) ||
                other.linkedinUrl == linkedinUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    candidateDetailsId,
    candidateId,
    educationQualification,
    passedoutYear,
    experience,
    skills,
    preferredWorkMode,
    preferredJobType,
    preferredWorkLocation,
    profilePicture,
    resume,
    githubUrl,
    linkedinUrl,
  );

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateDetailsImplCopyWith<_$CandidateDetailsImpl> get copyWith =>
      __$$CandidateDetailsImplCopyWithImpl<_$CandidateDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateDetailsImplToJson(this);
  }
}

abstract class _CandidateDetails implements CandidateDetails {
  const factory _CandidateDetails({
    @JsonKey(name: 'candidate_details_id')
    required final int candidateDetailsId,
    @JsonKey(name: 'candidate_id') required final int candidateId,
    @JsonKey(name: 'education_qualification')
    final String? educationQualification,
    @JsonKey(name: 'passedout_year') final int? passedoutYear,
    final String? experience,
    final String? skills,
    @JsonKey(name: 'preferred_work_mode') final String? preferredWorkMode,
    @JsonKey(name: 'preferred_job_type') final String? preferredJobType,
    @JsonKey(name: 'preferred_work_location')
    final String? preferredWorkLocation,
    @JsonKey(name: 'profile_picture') final String? profilePicture,
    final String? resume,
    @JsonKey(name: 'github_url') final String? githubUrl,
    @JsonKey(name: 'linkedin_url') final String? linkedinUrl,
  }) = _$CandidateDetailsImpl;

  factory _CandidateDetails.fromJson(Map<String, dynamic> json) =
      _$CandidateDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'candidate_details_id')
  int get candidateDetailsId;
  @override
  @JsonKey(name: 'candidate_id')
  int get candidateId;
  @override
  @JsonKey(name: 'education_qualification')
  String? get educationQualification;
  @override
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear;
  @override
  String? get experience;
  @override
  String? get skills;
  @override
  @JsonKey(name: 'preferred_work_mode')
  String? get preferredWorkMode;
  @override
  @JsonKey(name: 'preferred_job_type')
  String? get preferredJobType;
  @override
  @JsonKey(name: 'preferred_work_location')
  String? get preferredWorkLocation;
  @override
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;
  @override
  String? get resume;
  @override
  @JsonKey(name: 'github_url')
  String? get githubUrl;
  @override
  @JsonKey(name: 'linkedin_url')
  String? get linkedinUrl;

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateDetailsImplCopyWith<_$CandidateDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CandidateApplication _$CandidateApplicationFromJson(Map<String, dynamic> json) {
  return _CandidateApplication.fromJson(json);
}

/// @nodoc
mixin _$CandidateApplication {
  @JsonKey(name: 'application_id')
  int get applicationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'jd_id')
  int get jdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String get jobTitle => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get experience => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_mode')
  String get workMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String get jobType => throw _privateConstructorUsedError;
  String? get package => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CandidateApplication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateApplicationCopyWith<CandidateApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateApplicationCopyWith<$Res> {
  factory $CandidateApplicationCopyWith(
    CandidateApplication value,
    $Res Function(CandidateApplication) then,
  ) = _$CandidateApplicationCopyWithImpl<$Res, CandidateApplication>;
  @useResult
  $Res call({
    @JsonKey(name: 'application_id') int applicationId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'jd_id') int jdId,
    @JsonKey(name: 'job_title') String jobTitle,
    String location,
    String experience,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class _$CandidateApplicationCopyWithImpl<
  $Res,
  $Val extends CandidateApplication
>
    implements $CandidateApplicationCopyWith<$Res> {
  _$CandidateApplicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? jobId = null,
    Object? jdId = null,
    Object? jobTitle = null,
    Object? location = null,
    Object? experience = null,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            applicationId: null == applicationId
                ? _value.applicationId
                : applicationId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as int,
            jdId: null == jdId
                ? _value.jdId
                : jdId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobTitle: null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            experience: null == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CandidateApplicationImplCopyWith<$Res>
    implements $CandidateApplicationCopyWith<$Res> {
  factory _$$CandidateApplicationImplCopyWith(
    _$CandidateApplicationImpl value,
    $Res Function(_$CandidateApplicationImpl) then,
  ) = __$$CandidateApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'application_id') int applicationId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'jd_id') int jdId,
    @JsonKey(name: 'job_title') String jobTitle,
    String location,
    String experience,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class __$$CandidateApplicationImplCopyWithImpl<$Res>
    extends _$CandidateApplicationCopyWithImpl<$Res, _$CandidateApplicationImpl>
    implements _$$CandidateApplicationImplCopyWith<$Res> {
  __$$CandidateApplicationImplCopyWithImpl(
    _$CandidateApplicationImpl _value,
    $Res Function(_$CandidateApplicationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CandidateApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? jobId = null,
    Object? jdId = null,
    Object? jobTitle = null,
    Object? location = null,
    Object? experience = null,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CandidateApplicationImpl(
        applicationId: null == applicationId
            ? _value.applicationId
            : applicationId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as int,
        jdId: null == jdId
            ? _value.jdId
            : jdId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobTitle: null == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        experience: null == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String,
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateApplicationImpl implements _CandidateApplication {
  const _$CandidateApplicationImpl({
    @JsonKey(name: 'application_id') required this.applicationId,
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'jd_id') required this.jdId,
    @JsonKey(name: 'job_title') required this.jobTitle,
    required this.location,
    required this.experience,
    @JsonKey(name: 'work_mode') required this.workMode,
    @JsonKey(name: 'job_type') required this.jobType,
    this.package,
    required this.status,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$CandidateApplicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateApplicationImplFromJson(json);

  @override
  @JsonKey(name: 'application_id')
  final int applicationId;
  @override
  @JsonKey(name: 'job_id')
  final int jobId;
  @override
  @JsonKey(name: 'jd_id')
  final int jdId;
  @override
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @override
  final String location;
  @override
  final String experience;
  @override
  @JsonKey(name: 'work_mode')
  final String workMode;
  @override
  @JsonKey(name: 'job_type')
  final String jobType;
  @override
  final String? package;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'CandidateApplication(applicationId: $applicationId, jobId: $jobId, jdId: $jdId, jobTitle: $jobTitle, location: $location, experience: $experience, workMode: $workMode, jobType: $jobType, package: $package, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateApplicationImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.jdId, jdId) || other.jdId == jdId) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.workMode, workMode) ||
                other.workMode == workMode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.package, package) || other.package == package) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    applicationId,
    jobId,
    jdId,
    jobTitle,
    location,
    experience,
    workMode,
    jobType,
    package,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of CandidateApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateApplicationImplCopyWith<_$CandidateApplicationImpl>
  get copyWith =>
      __$$CandidateApplicationImplCopyWithImpl<_$CandidateApplicationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateApplicationImplToJson(this);
  }
}

abstract class _CandidateApplication implements CandidateApplication {
  const factory _CandidateApplication({
    @JsonKey(name: 'application_id') required final int applicationId,
    @JsonKey(name: 'job_id') required final int jobId,
    @JsonKey(name: 'jd_id') required final int jdId,
    @JsonKey(name: 'job_title') required final String jobTitle,
    required final String location,
    required final String experience,
    @JsonKey(name: 'work_mode') required final String workMode,
    @JsonKey(name: 'job_type') required final String jobType,
    final String? package,
    required final String status,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _$CandidateApplicationImpl;

  factory _CandidateApplication.fromJson(Map<String, dynamic> json) =
      _$CandidateApplicationImpl.fromJson;

  @override
  @JsonKey(name: 'application_id')
  int get applicationId;
  @override
  @JsonKey(name: 'job_id')
  int get jobId;
  @override
  @JsonKey(name: 'jd_id')
  int get jdId;
  @override
  @JsonKey(name: 'job_title')
  String get jobTitle;
  @override
  String get location;
  @override
  String get experience;
  @override
  @JsonKey(name: 'work_mode')
  String get workMode;
  @override
  @JsonKey(name: 'job_type')
  String get jobType;
  @override
  String? get package;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of CandidateApplication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateApplicationImplCopyWith<_$CandidateApplicationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CandidateJob _$CandidateJobFromJson(Map<String, dynamic> json) {
  return _CandidateJob.fromJson(json);
}

/// @nodoc
mixin _$CandidateJob {
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'jd_id')
  int? get jdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'version_number')
  int? get versionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_description')
  String? get jobDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  String? get publishedAt => throw _privateConstructorUsedError;

  /// Serializes this CandidateJob to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateJobCopyWith<CandidateJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateJobCopyWith<$Res> {
  factory $CandidateJobCopyWith(
    CandidateJob value,
    $Res Function(CandidateJob) then,
  ) = _$CandidateJobCopyWithImpl<$Res, CandidateJob>;
  @useResult
  $Res call({
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'required_skills') String requiredSkills,
    @JsonKey(name: 'education_qualification') String educationQualification,
    String experience,
    String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
    @JsonKey(name: 'jd_id') int? jdId,
    @JsonKey(name: 'version_number') int? versionNumber,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'published_at') String? publishedAt,
  });
}

/// @nodoc
class _$CandidateJobCopyWithImpl<$Res, $Val extends CandidateJob>
    implements $CandidateJobCopyWith<$Res> {
  _$CandidateJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? jobTitle = null,
    Object? requiredSkills = null,
    Object? educationQualification = null,
    Object? experience = null,
    Object? location = null,
    Object? passedoutYear = freezed,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
    Object? jdId = freezed,
    Object? versionNumber = freezed,
    Object? jobDescription = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
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
            jdId: freezed == jdId
                ? _value.jdId
                : jdId // ignore: cast_nullable_to_non_nullable
                      as int?,
            versionNumber: freezed == versionNumber
                ? _value.versionNumber
                : versionNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            jobDescription: freezed == jobDescription
                ? _value.jobDescription
                : jobDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$CandidateJobImplCopyWith<$Res>
    implements $CandidateJobCopyWith<$Res> {
  factory _$$CandidateJobImplCopyWith(
    _$CandidateJobImpl value,
    $Res Function(_$CandidateJobImpl) then,
  ) = __$$CandidateJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'required_skills') String requiredSkills,
    @JsonKey(name: 'education_qualification') String educationQualification,
    String experience,
    String location,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    @JsonKey(name: 'work_mode') String workMode,
    @JsonKey(name: 'job_type') String jobType,
    String? package,
    @JsonKey(name: 'jd_id') int? jdId,
    @JsonKey(name: 'version_number') int? versionNumber,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'published_at') String? publishedAt,
  });
}

/// @nodoc
class __$$CandidateJobImplCopyWithImpl<$Res>
    extends _$CandidateJobCopyWithImpl<$Res, _$CandidateJobImpl>
    implements _$$CandidateJobImplCopyWith<$Res> {
  __$$CandidateJobImplCopyWithImpl(
    _$CandidateJobImpl _value,
    $Res Function(_$CandidateJobImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CandidateJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? jobTitle = null,
    Object? requiredSkills = null,
    Object? educationQualification = null,
    Object? experience = null,
    Object? location = null,
    Object? passedoutYear = freezed,
    Object? workMode = null,
    Object? jobType = null,
    Object? package = freezed,
    Object? jdId = freezed,
    Object? versionNumber = freezed,
    Object? jobDescription = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(
      _$CandidateJobImpl(
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
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
        jdId: freezed == jdId
            ? _value.jdId
            : jdId // ignore: cast_nullable_to_non_nullable
                  as int?,
        versionNumber: freezed == versionNumber
            ? _value.versionNumber
            : versionNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        jobDescription: freezed == jobDescription
            ? _value.jobDescription
            : jobDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$CandidateJobImpl implements _CandidateJob {
  const _$CandidateJobImpl({
    @JsonKey(name: 'job_id') required this.jobId,
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
    @JsonKey(name: 'jd_id') this.jdId,
    @JsonKey(name: 'version_number') this.versionNumber,
    @JsonKey(name: 'job_description') this.jobDescription,
    @JsonKey(name: 'published_at') this.publishedAt,
  });

  factory _$CandidateJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateJobImplFromJson(json);

  @override
  @JsonKey(name: 'job_id')
  final int jobId;
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
  @JsonKey(name: 'jd_id')
  final int? jdId;
  @override
  @JsonKey(name: 'version_number')
  final int? versionNumber;
  @override
  @JsonKey(name: 'job_description')
  final String? jobDescription;
  @override
  @JsonKey(name: 'published_at')
  final String? publishedAt;

  @override
  String toString() {
    return 'CandidateJob(jobId: $jobId, jobTitle: $jobTitle, requiredSkills: $requiredSkills, educationQualification: $educationQualification, experience: $experience, location: $location, passedoutYear: $passedoutYear, workMode: $workMode, jobType: $jobType, package: $package, jdId: $jdId, versionNumber: $versionNumber, jobDescription: $jobDescription, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateJobImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
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
            (identical(other.package, package) || other.package == package) &&
            (identical(other.jdId, jdId) || other.jdId == jdId) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobId,
    jobTitle,
    requiredSkills,
    educationQualification,
    experience,
    location,
    passedoutYear,
    workMode,
    jobType,
    package,
    jdId,
    versionNumber,
    jobDescription,
    publishedAt,
  );

  /// Create a copy of CandidateJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateJobImplCopyWith<_$CandidateJobImpl> get copyWith =>
      __$$CandidateJobImplCopyWithImpl<_$CandidateJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateJobImplToJson(this);
  }
}

abstract class _CandidateJob implements CandidateJob {
  const factory _CandidateJob({
    @JsonKey(name: 'job_id') required final int jobId,
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
    @JsonKey(name: 'jd_id') final int? jdId,
    @JsonKey(name: 'version_number') final int? versionNumber,
    @JsonKey(name: 'job_description') final String? jobDescription,
    @JsonKey(name: 'published_at') final String? publishedAt,
  }) = _$CandidateJobImpl;

  factory _CandidateJob.fromJson(Map<String, dynamic> json) =
      _$CandidateJobImpl.fromJson;

  @override
  @JsonKey(name: 'job_id')
  int get jobId;
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
  @override
  @JsonKey(name: 'jd_id')
  int? get jdId;
  @override
  @JsonKey(name: 'version_number')
  int? get versionNumber;
  @override
  @JsonKey(name: 'job_description')
  String? get jobDescription;
  @override
  @JsonKey(name: 'published_at')
  String? get publishedAt;

  /// Create a copy of CandidateJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateJobImplCopyWith<_$CandidateJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  @JsonKey(name: 'bookmark_id')
  int get bookmarkId => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_id')
  int get candidateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call({
    @JsonKey(name: 'bookmark_id') int bookmarkId,
    @JsonKey(name: 'candidate_id') int candidateId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkId = null,
    Object? candidateId = null,
    Object? jobId = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            bookmarkId: null == bookmarkId
                ? _value.bookmarkId
                : bookmarkId // ignore: cast_nullable_to_non_nullable
                      as int,
            candidateId: null == candidateId
                ? _value.candidateId
                : candidateId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookmarkImplCopyWith<$Res>
    implements $BookmarkCopyWith<$Res> {
  factory _$$BookmarkImplCopyWith(
    _$BookmarkImpl value,
    $Res Function(_$BookmarkImpl) then,
  ) = __$$BookmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'bookmark_id') int bookmarkId,
    @JsonKey(name: 'candidate_id') int candidateId,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$BookmarkImplCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$BookmarkImpl>
    implements _$$BookmarkImplCopyWith<$Res> {
  __$$BookmarkImplCopyWithImpl(
    _$BookmarkImpl _value,
    $Res Function(_$BookmarkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkId = null,
    Object? candidateId = null,
    Object? jobId = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$BookmarkImpl(
        bookmarkId: null == bookmarkId
            ? _value.bookmarkId
            : bookmarkId // ignore: cast_nullable_to_non_nullable
                  as int,
        candidateId: null == candidateId
            ? _value.candidateId
            : candidateId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkImpl implements _Bookmark {
  const _$BookmarkImpl({
    @JsonKey(name: 'bookmark_id') required this.bookmarkId,
    @JsonKey(name: 'candidate_id') required this.candidateId,
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$BookmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkImplFromJson(json);

  @override
  @JsonKey(name: 'bookmark_id')
  final int bookmarkId;
  @override
  @JsonKey(name: 'candidate_id')
  final int candidateId;
  @override
  @JsonKey(name: 'job_id')
  final int jobId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'Bookmark(bookmarkId: $bookmarkId, candidateId: $candidateId, jobId: $jobId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkImpl &&
            (identical(other.bookmarkId, bookmarkId) ||
                other.bookmarkId == bookmarkId) &&
            (identical(other.candidateId, candidateId) ||
                other.candidateId == candidateId) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bookmarkId, candidateId, jobId, createdAt);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      __$$BookmarkImplCopyWithImpl<_$BookmarkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkImplToJson(this);
  }
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark({
    @JsonKey(name: 'bookmark_id') required final int bookmarkId,
    @JsonKey(name: 'candidate_id') required final int candidateId,
    @JsonKey(name: 'job_id') required final int jobId,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$BookmarkImpl;

  factory _Bookmark.fromJson(Map<String, dynamic> json) =
      _$BookmarkImpl.fromJson;

  @override
  @JsonKey(name: 'bookmark_id')
  int get bookmarkId;
  @override
  @JsonKey(name: 'candidate_id')
  int get candidateId;
  @override
  @JsonKey(name: 'job_id')
  int get jobId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
