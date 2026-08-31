import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import 'models/jd_models.dart';

part 'jd_repository.g.dart';

@riverpod
JdRepository jdRepository(JdRepositoryRef ref) {
  return JdRepository(ref.watch(apiClientProvider));
}

class JdRepository {
  final Dio _dio;

  JdRepository(this._dio);

  Future<List<JobParameterResponse>> getJobs() async {
    final response = await _dio.get('/jobs');
    return (response.data as List).map((e) => JobParameterResponse.fromJson(e)).toList();
  }

  Future<JobParameterResponse> createJob(JobParameterCreate jobCreate) async {
    final response = await _dio.post('/jobs', data: jobCreate.toJson());
    return JobParameterResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<JobParameterResponse> getJob(int jobId) async {
    final response = await _dio.get('/jobs/$jobId');
    return JobParameterResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<JobParameterResponse> updateJob(int jobId, JobParameterUpdate jobUpdate) async {
    final response = await _dio.put('/jobs/$jobId', data: jobUpdate.toJson());
    return JobParameterResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteJob(int jobId) async {
    await _dio.delete('/jobs/$jobId');
  }

  Future<JobDescriptionResponse> generateJd(int jobId) async {
    final response = await _dio.post('/jobs/$jobId/generate-jd');
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<JobDescriptionResponse> regenerateJd(int jobId) async {
    final response = await _dio.post('/jobs/$jobId/regenerate-jd');
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<JobDescriptionResponse>> getJdVersions(int jobId) async {
    final response = await _dio.get('/jobs/$jobId/versions');
    return (response.data as List).map((e) => JobDescriptionResponse.fromJson(e)).toList();
  }

  Future<JobDescriptionResponse> updateJdVersion(int jobId, int versionId, JobDescriptionUpdate updateData) async {
    final response = await _dio.put('/jobs/$jobId/versions/$versionId', data: updateData.toJson());
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<JobDescriptionResponse> publishJdVersion(int jobId, int versionId) async {
    final response = await _dio.post('/jobs/$jobId/versions/$versionId/publish');
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
