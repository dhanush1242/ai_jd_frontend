import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/jd_repository.dart';
import '../data/models/jd_models.dart';

part 'jd_provider.g.dart';

@riverpod
class JdHistory extends _$JdHistory {
  @override
  FutureOr<List<JobParameterResponse>> build() async {
    return ref.read(jdRepositoryProvider).getJobs();
  }

  Future<void> refreshHistory() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(jdRepositoryProvider).getJobs());
  }
}

@riverpod
class JdGenerator extends _$JdGenerator {
  @override
  FutureOr<JobDescriptionResponse?> build() {
    return null;
  }

  Future<void> generate(JobParameterCreate createParams) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final job = await ref.read(jdRepositoryProvider).createJob(createParams);
      return await ref.read(jdRepositoryProvider).generateJd(job.jobId);
    });
  }

  Future<void> regenerate(int jobId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.read(jdRepositoryProvider).regenerateJd(jobId);
    });
  }
  
  void clear() {
    state = const AsyncValue.data(null);
  }
}
