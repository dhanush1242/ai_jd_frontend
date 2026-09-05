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

  void setJd(JobDescriptionResponse jd) {
    state = AsyncValue.data(jd);
  }
}

final recruiterJobsProvider = FutureProvider<List<CandidateJob>>((ref) async {
  return ref.watch(jdRepositoryProvider).getJobs();
});

class RecruiterActions {
  final Ref ref;
  RecruiterActions(this.ref);

  Future<void> deleteJob(int jobId) async {
    await ref.read(jdRepositoryProvider).deleteJob(jobId);
    ref.invalidate(recruiterJobsProvider);
  }
}

final recruiterActionsProvider = Provider<RecruiterActions>((ref) {
  return RecruiterActions(ref);
});

final recruiterApplicationsProvider = FutureProvider.family<List<RecruiterApplication>, int>((ref, jobId) async {
  return ref.watch(jdRepositoryProvider).getApplicationsForJob(jobId);
});

final recruiterAllApplicationsProvider = FutureProvider<List<RecruiterApplication>>((ref) async {
  final jobs = await ref.watch(recruiterJobsProvider.future);
  final allApps = <RecruiterApplication>[];
  await Future.wait(jobs.map((job) async {
    try {
      final apps = await ref.read(jdRepositoryProvider).getApplicationsForJob(job.jobId);
      allApps.addAll(apps);
    } catch (_) {}
  }));
  allApps.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return allApps;
});

class RecruiterStats {
  final int totalJobs;
  final int activePostings;
  final int totalApplications;
  final int newCandidates;

  const RecruiterStats({
    required this.totalJobs,
    required this.activePostings,
    required this.totalApplications,
    required this.newCandidates,
  });
}

final recruiterStatsProvider = FutureProvider<RecruiterStats>((ref) async {
  final jobs = await ref.watch(recruiterJobsProvider.future);
  int totalApps = 0;
  int newAppsThisWeek = 0;
  final now = DateTime.now();
  final weekAgo = now.subtract(const Duration(days: 7));

  await Future.wait(jobs.map((job) async {
    try {
      final apps = await ref.read(jdRepositoryProvider).getApplicationsForJob(job.jobId);
      totalApps += apps.length;
      for (final app in apps) {
        final dt = DateTime.tryParse(app.createdAt);
        if (dt != null && dt.isAfter(weekAgo)) {
          newAppsThisWeek++;
        }
      }
    } catch (_) {}
  }));

  return RecruiterStats(
    totalJobs: jobs.length,
    activePostings: jobs.where((j) => j.publishedAt != null).length,
    totalApplications: totalApps,
    newCandidates: newAppsThisWeek,
  );
});
