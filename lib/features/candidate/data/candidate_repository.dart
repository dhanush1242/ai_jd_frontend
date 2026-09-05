import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';

import 'package:file_picker/file_picker.dart';
import 'models/candidate_models.dart';

part 'candidate_repository.g.dart';

@riverpod
CandidateRepository candidateRepository(CandidateRepositoryRef ref) {
  return CandidateRepository(ref.watch(apiClientProvider));
}

class CandidateRepository {
  final Dio _dio;

  CandidateRepository(this._dio);

  Future<CandidateDetails?> getDetails() async {
    try {
      final response = await _dio.get('/candidates/details');
      return CandidateDetails.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        return null;
      }
      rethrow;
    }
  }

  Future<void> saveDetails({
    String? educationQualification,
    int? passedoutYear,
    String? experience,
    String? skills,
    String? preferredWorkMode,
    String? preferredJobType,
    String? preferredWorkLocation,
    String? githubUrl,
    String? linkedinUrl,
    PlatformFile? profilePicture,
    PlatformFile? resume,
  }) async {
    final jsonData = {
      'education_qualification': educationQualification,
      'passedout_year': passedoutYear,
      'experience': experience,
      'skills': skills,
      'preferred_work_mode': preferredWorkMode,
      'preferred_job_type': preferredJobType,
      'preferred_work_location': preferredWorkLocation,
      'github_url': githubUrl,
      'linkedin_url': linkedinUrl,
    };
    jsonData.removeWhere((key, value) => value == null);

    bool exists = false;
    try {
      await _dio.post('/candidates/details', data: jsonData);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        exists = true;
      } else {
        rethrow;
      }
    }

    if (exists || profilePicture != null || resume != null) {
      final formDataMap = <String, dynamic>{...jsonData};
      
      if (profilePicture != null && profilePicture.bytes != null) {
        formDataMap['profile_picture'] = MultipartFile.fromBytes(
          profilePicture.bytes!,
          filename: profilePicture.name,
        );
      }
      if (resume != null && resume.bytes != null) {
        formDataMap['resume'] = MultipartFile.fromBytes(
          resume.bytes!,
          filename: resume.name,
        );
      }

      final formData = FormData.fromMap(formDataMap);
      await _dio.put(
        '/candidates/details',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
    }
  }

  Future<List<CandidateApplication>> getApplications() async {
    final response = await _dio.get('/candidates/applications');
    return (response.data as List).map((e) => CandidateApplication.fromJson(e)).toList();
  }

  Future<List<CandidateJob>> getJobs({String? skills, String? location, String? experience}) async {
    final queryParams = <String, dynamic>{};
    if (skills != null && skills.trim().isNotEmpty) queryParams['skills'] = skills.trim();
    if (location != null && location.trim().isNotEmpty) queryParams['location'] = location.trim();
    if (experience != null && experience.trim().isNotEmpty) queryParams['experience'] = experience.trim();

    final response = await _dio.get(
      '/candidates/jobs',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );
    return (response.data as List).map((e) => CandidateJob.fromJson(e)).toList();
  }

  Future<List<Bookmark>> getBookmarks() async {
    final response = await _dio.get('/candidates/bookmarks');
    return (response.data as List).map((e) => Bookmark.fromJson(e)).toList();
  }

  Future<void> applyForJob(int jobId) async {
    await _dio.post('/candidates/jobs/$jobId/apply');
  }

  Future<void> bookmarkJob(int jobId) async {
    await _dio.post('/candidates/jobs/$jobId/bookmark');
  }

  Future<void> removeBookmark(int jobId) async {
    await _dio.delete('/candidates/jobs/$jobId/bookmark');
  }
}
