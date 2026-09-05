import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../candidate/data/models/candidate_models.dart';
import 'models/jd_models.dart';
import 'models/recruiter_models.dart';

part 'jd_repository.g.dart';

@riverpod
JdRepository jdRepository(JdRepositoryRef ref) {
  return JdRepository(ref.watch(apiClientProvider));
}

class JdRepository {
  final Dio _dio;

  JdRepository(this._dio);

  Future<JobDescriptionResponse> generateJd(JobParameterCreate jdCreate) async {
    final payload = jdCreate.toJson();
    final jobResponse = await _dio.post('/jobs', data: payload);
    final jobId = jobResponse.data['job_id'];

    // 2. Trigger generation
    final jdResponse = await _dio.post('/jobs/$jobId/generate-jd');
    return JobDescriptionResponse.fromJson(jdResponse.data);
  }

  Future<List<JobDescriptionResponse>> getJobVersions(int jobId) async {
    final response = await _dio.get('/jobs/$jobId/versions');
    return (response.data as List).map((e) => JobDescriptionResponse.fromJson(e)).toList();
  }

  Future<List<CandidateJob>> getJobs() async {
    final response = await _dio.get('/jobs');
    final jobs = (response.data as List).map((e) => CandidateJob.fromJson(e)).toList();

    // Enrich with version status
    final enriched = await Future.wait(jobs.map((job) async {
      try {
        final versions = await getJobVersions(job.jobId);
        if (versions.isNotEmpty) {
          final publishedVersion = versions.firstWhere(
            (v) => v.isPublished,
            orElse: () => versions.last,
          );
          return job.copyWith(
            versionNumber: publishedVersion.versionNumber,
            jdId: publishedVersion.jdId,
            jobDescription: publishedVersion.updatedJd ?? publishedVersion.generatedJd,
            publishedAt: publishedVersion.isPublished
                ? (publishedVersion.publishedAt ?? publishedVersion.updatedAt).toIso8601String()
                : null,
          );
        }
      } catch (_) {}
      return job;
    }));

    return enriched;
  }

  Future<List<RecruiterApplication>> getApplicationsForJob(int jobId) async {
    final response = await _dio.get('/recruiters/jobs/$jobId/applications');
    return (response.data as List).map((e) => RecruiterApplication.fromJson(e)).toList();
  }

  Future<void> updateApplicationStatus(int applicationId, String status) async {
    await _dio.put('/recruiters/applications/$applicationId/status', data: {'status': status});
  }

  Future<void> addApplicationNote(int applicationId, String note) async {
    await _dio.post('/recruiters/applications/$applicationId/notes', data: {'note': note});
  }

  Future<List<ApplicationNote>> getApplicationNotes(int applicationId) async {
    final response = await _dio.get('/recruiters/applications/$applicationId/notes');
    return (response.data as List).map((e) => ApplicationNote.fromJson(e)).toList();
  }

  Future<CandidateJob> getJob(int jobId) async {
    final response = await _dio.get('/jobs/$jobId');
    return CandidateJob.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> updateJob(int jobId, JobParameterUpdate jobUpdate) async {
    await _dio.put('/jobs/$jobId', data: jobUpdate.toJson());
  }

  Future<void> deleteJob(int jobId) async {
    await _dio.delete('/jobs/$jobId');
  }

  Future<JobDescriptionResponse> regenerateJd(int jobId) async {
    final response = await _dio.post('/jobs/$jobId/regenerate-jd');
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<JobDescriptionResponse> updateJdVersion(int jobId, int versionId, JobDescriptionUpdate updateData) async {
    final response = await _dio.put('/jobs/$jobId/versions/$versionId', data: updateData.toJson());
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<JobDescriptionResponse> publishJdVersion(int jobId, int versionId) async {
    final response = await _dio.post('/jobs/$jobId/versions/$versionId/publish');
    return JobDescriptionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<String> getApplicationResume(int applicationId) async {
    // Assuming the API returns a URL or file path. If it returns binary, this needs to be adjusted.
    final response = await _dio.get('/recruiters/applications/$applicationId/resume');
    return response.data['resume_url'] ?? '';
  }
}
