// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recruiter_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecruiterApplication _$RecruiterApplicationFromJson(Map<String, dynamic> json) {
  return _RecruiterApplication.fromJson(json);
}

/// @nodoc
mixin _$RecruiterApplication {
  @JsonKey(name: 'application_id')
  int get applicationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_id')
  int get candidateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_name')
  String get candidateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'candidate_email')
  String get candidateEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_qualification')
  String? get educationQualification => throw _privateConstructorUsedError;
  @JsonKey(name: 'passedout_year')
  int? get passedoutYear => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'resume_url')
  String get resumeUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'github_url')
  String? get githubUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedin_url')
  String? get linkedinUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  int get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'jd_id')
  int get jdId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RecruiterApplication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecruiterApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecruiterApplicationCopyWith<RecruiterApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecruiterApplicationCopyWith<$Res> {
  factory $RecruiterApplicationCopyWith(
    RecruiterApplication value,
    $Res Function(RecruiterApplication) then,
  ) = _$RecruiterApplicationCopyWithImpl<$Res, RecruiterApplication>;
  @useResult
  $Res call({
    @JsonKey(name: 'application_id') int applicationId,
    @JsonKey(name: 'candidate_id') int candidateId,
    @JsonKey(name: 'candidate_name') String candidateName,
    @JsonKey(name: 'candidate_email') String candidateEmail,
    @JsonKey(name: 'mobile_number') String mobileNumber,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    String? experience,
    String? skills,
    @JsonKey(name: 'resume_url') String resumeUrl,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'linkedin_url') String? linkedinUrl,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'jd_id') int jdId,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class _$RecruiterApplicationCopyWithImpl<
  $Res,
  $Val extends RecruiterApplication
>
    implements $RecruiterApplicationCopyWith<$Res> {
  _$RecruiterApplicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecruiterApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? candidateId = null,
    Object? candidateName = null,
    Object? candidateEmail = null,
    Object? mobileNumber = null,
    Object? educationQualification = freezed,
    Object? passedoutYear = freezed,
    Object? experience = freezed,
    Object? skills = freezed,
    Object? resumeUrl = null,
    Object? githubUrl = freezed,
    Object? linkedinUrl = freezed,
    Object? jobId = null,
    Object? jdId = null,
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
            candidateId: null == candidateId
                ? _value.candidateId
                : candidateId // ignore: cast_nullable_to_non_nullable
                      as int,
            candidateName: null == candidateName
                ? _value.candidateName
                : candidateName // ignore: cast_nullable_to_non_nullable
                      as String,
            candidateEmail: null == candidateEmail
                ? _value.candidateEmail
                : candidateEmail // ignore: cast_nullable_to_non_nullable
                      as String,
            mobileNumber: null == mobileNumber
                ? _value.mobileNumber
                : mobileNumber // ignore: cast_nullable_to_non_nullable
                      as String,
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
            resumeUrl: null == resumeUrl
                ? _value.resumeUrl
                : resumeUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            githubUrl: freezed == githubUrl
                ? _value.githubUrl
                : githubUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkedinUrl: freezed == linkedinUrl
                ? _value.linkedinUrl
                : linkedinUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as int,
            jdId: null == jdId
                ? _value.jdId
                : jdId // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$RecruiterApplicationImplCopyWith<$Res>
    implements $RecruiterApplicationCopyWith<$Res> {
  factory _$$RecruiterApplicationImplCopyWith(
    _$RecruiterApplicationImpl value,
    $Res Function(_$RecruiterApplicationImpl) then,
  ) = __$$RecruiterApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'application_id') int applicationId,
    @JsonKey(name: 'candidate_id') int candidateId,
    @JsonKey(name: 'candidate_name') String candidateName,
    @JsonKey(name: 'candidate_email') String candidateEmail,
    @JsonKey(name: 'mobile_number') String mobileNumber,
    @JsonKey(name: 'education_qualification') String? educationQualification,
    @JsonKey(name: 'passedout_year') int? passedoutYear,
    String? experience,
    String? skills,
    @JsonKey(name: 'resume_url') String resumeUrl,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'linkedin_url') String? linkedinUrl,
    @JsonKey(name: 'job_id') int jobId,
    @JsonKey(name: 'jd_id') int jdId,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class __$$RecruiterApplicationImplCopyWithImpl<$Res>
    extends _$RecruiterApplicationCopyWithImpl<$Res, _$RecruiterApplicationImpl>
    implements _$$RecruiterApplicationImplCopyWith<$Res> {
  __$$RecruiterApplicationImplCopyWithImpl(
    _$RecruiterApplicationImpl _value,
    $Res Function(_$RecruiterApplicationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecruiterApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? candidateId = null,
    Object? candidateName = null,
    Object? candidateEmail = null,
    Object? mobileNumber = null,
    Object? educationQualification = freezed,
    Object? passedoutYear = freezed,
    Object? experience = freezed,
    Object? skills = freezed,
    Object? resumeUrl = null,
    Object? githubUrl = freezed,
    Object? linkedinUrl = freezed,
    Object? jobId = null,
    Object? jdId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$RecruiterApplicationImpl(
        applicationId: null == applicationId
            ? _value.applicationId
            : applicationId // ignore: cast_nullable_to_non_nullable
                  as int,
        candidateId: null == candidateId
            ? _value.candidateId
            : candidateId // ignore: cast_nullable_to_non_nullable
                  as int,
        candidateName: null == candidateName
            ? _value.candidateName
            : candidateName // ignore: cast_nullable_to_non_nullable
                  as String,
        candidateEmail: null == candidateEmail
            ? _value.candidateEmail
            : candidateEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        mobileNumber: null == mobileNumber
            ? _value.mobileNumber
            : mobileNumber // ignore: cast_nullable_to_non_nullable
                  as String,
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
        resumeUrl: null == resumeUrl
            ? _value.resumeUrl
            : resumeUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        githubUrl: freezed == githubUrl
            ? _value.githubUrl
            : githubUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkedinUrl: freezed == linkedinUrl
            ? _value.linkedinUrl
            : linkedinUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as int,
        jdId: null == jdId
            ? _value.jdId
            : jdId // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$RecruiterApplicationImpl implements _RecruiterApplication {
  const _$RecruiterApplicationImpl({
    @JsonKey(name: 'application_id') required this.applicationId,
    @JsonKey(name: 'candidate_id') required this.candidateId,
    @JsonKey(name: 'candidate_name') required this.candidateName,
    @JsonKey(name: 'candidate_email') required this.candidateEmail,
    @JsonKey(name: 'mobile_number') required this.mobileNumber,
    @JsonKey(name: 'education_qualification') this.educationQualification,
    @JsonKey(name: 'passedout_year') this.passedoutYear,
    this.experience,
    this.skills,
    @JsonKey(name: 'resume_url') required this.resumeUrl,
    @JsonKey(name: 'github_url') this.githubUrl,
    @JsonKey(name: 'linkedin_url') this.linkedinUrl,
    @JsonKey(name: 'job_id') required this.jobId,
    @JsonKey(name: 'jd_id') required this.jdId,
    required this.status,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$RecruiterApplicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecruiterApplicationImplFromJson(json);

  @override
  @JsonKey(name: 'application_id')
  final int applicationId;
  @override
  @JsonKey(name: 'candidate_id')
  final int candidateId;
  @override
  @JsonKey(name: 'candidate_name')
  final String candidateName;
  @override
  @JsonKey(name: 'candidate_email')
  final String candidateEmail;
  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
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
  @JsonKey(name: 'resume_url')
  final String resumeUrl;
  @override
  @JsonKey(name: 'github_url')
  final String? githubUrl;
  @override
  @JsonKey(name: 'linkedin_url')
  final String? linkedinUrl;
  @override
  @JsonKey(name: 'job_id')
  final int jobId;
  @override
  @JsonKey(name: 'jd_id')
  final int jdId;
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
    return 'RecruiterApplication(applicationId: $applicationId, candidateId: $candidateId, candidateName: $candidateName, candidateEmail: $candidateEmail, mobileNumber: $mobileNumber, educationQualification: $educationQualification, passedoutYear: $passedoutYear, experience: $experience, skills: $skills, resumeUrl: $resumeUrl, githubUrl: $githubUrl, linkedinUrl: $linkedinUrl, jobId: $jobId, jdId: $jdId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecruiterApplicationImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.candidateId, candidateId) ||
                other.candidateId == candidateId) &&
            (identical(other.candidateName, candidateName) ||
                other.candidateName == candidateName) &&
            (identical(other.candidateEmail, candidateEmail) ||
                other.candidateEmail == candidateEmail) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.educationQualification, educationQualification) ||
                other.educationQualification == educationQualification) &&
            (identical(other.passedoutYear, passedoutYear) ||
                other.passedoutYear == passedoutYear) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.resumeUrl, resumeUrl) ||
                other.resumeUrl == resumeUrl) &&
            (identical(other.githubUrl, githubUrl) ||
                other.githubUrl == githubUrl) &&
            (identical(other.linkedinUrl, linkedinUrl) ||
                other.linkedinUrl == linkedinUrl) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.jdId, jdId) || other.jdId == jdId) &&
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
    candidateId,
    candidateName,
    candidateEmail,
    mobileNumber,
    educationQualification,
    passedoutYear,
    experience,
    skills,
    resumeUrl,
    githubUrl,
    linkedinUrl,
    jobId,
    jdId,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of RecruiterApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecruiterApplicationImplCopyWith<_$RecruiterApplicationImpl>
  get copyWith =>
      __$$RecruiterApplicationImplCopyWithImpl<_$RecruiterApplicationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecruiterApplicationImplToJson(this);
  }
}

abstract class _RecruiterApplication implements RecruiterApplication {
  const factory _RecruiterApplication({
    @JsonKey(name: 'application_id') required final int applicationId,
    @JsonKey(name: 'candidate_id') required final int candidateId,
    @JsonKey(name: 'candidate_name') required final String candidateName,
    @JsonKey(name: 'candidate_email') required final String candidateEmail,
    @JsonKey(name: 'mobile_number') required final String mobileNumber,
    @JsonKey(name: 'education_qualification')
    final String? educationQualification,
    @JsonKey(name: 'passedout_year') final int? passedoutYear,
    final String? experience,
    final String? skills,
    @JsonKey(name: 'resume_url') required final String resumeUrl,
    @JsonKey(name: 'github_url') final String? githubUrl,
    @JsonKey(name: 'linkedin_url') final String? linkedinUrl,
    @JsonKey(name: 'job_id') required final int jobId,
    @JsonKey(name: 'jd_id') required final int jdId,
    required final String status,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _$RecruiterApplicationImpl;

  factory _RecruiterApplication.fromJson(Map<String, dynamic> json) =
      _$RecruiterApplicationImpl.fromJson;

  @override
  @JsonKey(name: 'application_id')
  int get applicationId;
  @override
  @JsonKey(name: 'candidate_id')
  int get candidateId;
  @override
  @JsonKey(name: 'candidate_name')
  String get candidateName;
  @override
  @JsonKey(name: 'candidate_email')
  String get candidateEmail;
  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
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
  @JsonKey(name: 'resume_url')
  String get resumeUrl;
  @override
  @JsonKey(name: 'github_url')
  String? get githubUrl;
  @override
  @JsonKey(name: 'linkedin_url')
  String? get linkedinUrl;
  @override
  @JsonKey(name: 'job_id')
  int get jobId;
  @override
  @JsonKey(name: 'jd_id')
  int get jdId;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of RecruiterApplication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecruiterApplicationImplCopyWith<_$RecruiterApplicationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ApplicationNote _$ApplicationNoteFromJson(Map<String, dynamic> json) {
  return _ApplicationNote.fromJson(json);
}

/// @nodoc
mixin _$ApplicationNote {
  @JsonKey(name: 'note_id')
  int get noteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'application_id')
  int get applicationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recruiter_id')
  int get recruiterId => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ApplicationNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationNoteCopyWith<ApplicationNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationNoteCopyWith<$Res> {
  factory $ApplicationNoteCopyWith(
    ApplicationNote value,
    $Res Function(ApplicationNote) then,
  ) = _$ApplicationNoteCopyWithImpl<$Res, ApplicationNote>;
  @useResult
  $Res call({
    @JsonKey(name: 'note_id') int noteId,
    @JsonKey(name: 'application_id') int applicationId,
    @JsonKey(name: 'recruiter_id') int recruiterId,
    String note,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$ApplicationNoteCopyWithImpl<$Res, $Val extends ApplicationNote>
    implements $ApplicationNoteCopyWith<$Res> {
  _$ApplicationNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? applicationId = null,
    Object? recruiterId = null,
    Object? note = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            noteId: null == noteId
                ? _value.noteId
                : noteId // ignore: cast_nullable_to_non_nullable
                      as int,
            applicationId: null == applicationId
                ? _value.applicationId
                : applicationId // ignore: cast_nullable_to_non_nullable
                      as int,
            recruiterId: null == recruiterId
                ? _value.recruiterId
                : recruiterId // ignore: cast_nullable_to_non_nullable
                      as int,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$ApplicationNoteImplCopyWith<$Res>
    implements $ApplicationNoteCopyWith<$Res> {
  factory _$$ApplicationNoteImplCopyWith(
    _$ApplicationNoteImpl value,
    $Res Function(_$ApplicationNoteImpl) then,
  ) = __$$ApplicationNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'note_id') int noteId,
    @JsonKey(name: 'application_id') int applicationId,
    @JsonKey(name: 'recruiter_id') int recruiterId,
    String note,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$ApplicationNoteImplCopyWithImpl<$Res>
    extends _$ApplicationNoteCopyWithImpl<$Res, _$ApplicationNoteImpl>
    implements _$$ApplicationNoteImplCopyWith<$Res> {
  __$$ApplicationNoteImplCopyWithImpl(
    _$ApplicationNoteImpl _value,
    $Res Function(_$ApplicationNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? applicationId = null,
    Object? recruiterId = null,
    Object? note = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ApplicationNoteImpl(
        noteId: null == noteId
            ? _value.noteId
            : noteId // ignore: cast_nullable_to_non_nullable
                  as int,
        applicationId: null == applicationId
            ? _value.applicationId
            : applicationId // ignore: cast_nullable_to_non_nullable
                  as int,
        recruiterId: null == recruiterId
            ? _value.recruiterId
            : recruiterId // ignore: cast_nullable_to_non_nullable
                  as int,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$ApplicationNoteImpl implements _ApplicationNote {
  const _$ApplicationNoteImpl({
    @JsonKey(name: 'note_id') required this.noteId,
    @JsonKey(name: 'application_id') required this.applicationId,
    @JsonKey(name: 'recruiter_id') required this.recruiterId,
    required this.note,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$ApplicationNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationNoteImplFromJson(json);

  @override
  @JsonKey(name: 'note_id')
  final int noteId;
  @override
  @JsonKey(name: 'application_id')
  final int applicationId;
  @override
  @JsonKey(name: 'recruiter_id')
  final int recruiterId;
  @override
  final String note;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'ApplicationNote(noteId: $noteId, applicationId: $applicationId, recruiterId: $recruiterId, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationNoteImpl &&
            (identical(other.noteId, noteId) || other.noteId == noteId) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.recruiterId, recruiterId) ||
                other.recruiterId == recruiterId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    noteId,
    applicationId,
    recruiterId,
    note,
    createdAt,
  );

  /// Create a copy of ApplicationNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationNoteImplCopyWith<_$ApplicationNoteImpl> get copyWith =>
      __$$ApplicationNoteImplCopyWithImpl<_$ApplicationNoteImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationNoteImplToJson(this);
  }
}

abstract class _ApplicationNote implements ApplicationNote {
  const factory _ApplicationNote({
    @JsonKey(name: 'note_id') required final int noteId,
    @JsonKey(name: 'application_id') required final int applicationId,
    @JsonKey(name: 'recruiter_id') required final int recruiterId,
    required final String note,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$ApplicationNoteImpl;

  factory _ApplicationNote.fromJson(Map<String, dynamic> json) =
      _$ApplicationNoteImpl.fromJson;

  @override
  @JsonKey(name: 'note_id')
  int get noteId;
  @override
  @JsonKey(name: 'application_id')
  int get applicationId;
  @override
  @JsonKey(name: 'recruiter_id')
  int get recruiterId;
  @override
  String get note;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of ApplicationNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationNoteImplCopyWith<_$ApplicationNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
