import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/jd_repository.dart';
import '../data/models/jd_models.dart';
import '../data/models/recruiter_models.dart';
import '../../candidate/data/models/candidate_models.dart';

part 'jd_provider.g.dart';

@riverpod
class JdGenerator extends _$JdGenerator {
  @override
  FutureOr<JobDescriptionResponse?> build() {
    return null;
  }

  Future<void> generate(JobParameterCreate createParams) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(jdRepositoryProvider).generateJd(createParams);
    });
  }
  
  void clear() {
    state = const AsyncValue.data(null);
  }

  void setJd(GeneratedJD jd) {
    state = AsyncValue.data(jd);
  }
}

final recruiterJobsProvider = FutureProvider<List<CandidateJob>>((ref) async {
  return ref.watch(jdRepositoryProvider).getJobs();
});

final recruiterApplicationsProvider = FutureProvider.family<List<RecruiterApplication>, int>((ref, jobId) async {
  return ref.watch(jdRepositoryProvider).getApplicationsForJob(jobId);
});
