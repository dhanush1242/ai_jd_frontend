import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../auth/data/models/auth_models.dart';
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

  Future<GeneratedJD> generateJd(JobDescriptionCreate jdCreate) async {
    // 1. Create the job parameters first
    final payload = {
      'job_title': jdCreate.jobTitle,
      'required_skills': jdCreate.skills.join(', '),
      'education_qualification': jdCreate.educationQualifications,
      'experience': jdCreate.experienceRequired,
      'location': jdCreate.location,
      'work_mode': jdCreate.workMode,
      'job_type': jdCreate.jobType,
      'package': jdCreate.salary,
    };
    final jobResponse = await _dio.post('/jobs', data: payload);
    final jobId = jobResponse.data['job_id'];

    // 2. Trigger generation
    final jdResponse = await _dio.post('/jobs/$jobId/generate-jd');
    return GeneratedJD.fromJson(jdResponse.data);
  }

  Future<List<GeneratedJD>> getJobVersions(int jobId) async {
    final response = await _dio.get('/jobs/$jobId/versions');
    return (response.data as List).map((e) => GeneratedJD.fromJson(e)).toList();
  }

  Future<List<CandidateJob>> getJobs() async {
    final response = await _dio.get('/jobs');
    return (response.data as List).map((e) => CandidateJob.fromJson(e)).toList();
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
}
