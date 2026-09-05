import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/candidate_repository.dart';
import '../data/models/candidate_models.dart';

final candidateApplicationsProvider = FutureProvider<List<CandidateApplication>>((ref) async {
  return ref.watch(candidateRepositoryProvider).getApplications();
});

class JobFilter {
  final String? skills;
  final String? location;
  final String? experience;

  const JobFilter({this.skills, this.location, this.experience});

  JobFilter copyWith({String? skills, String? location, String? experience}) {
    return JobFilter(
      skills: skills ?? this.skills,
      location: location ?? this.location,
      experience: experience ?? this.experience,
    );
  }

  bool get hasFilters =>
      (skills != null && skills!.isNotEmpty) ||
      (location != null && location!.isNotEmpty) ||
      (experience != null && experience!.isNotEmpty);
}

final candidateJobFilterProvider = StateProvider<JobFilter>((ref) => const JobFilter());

final candidateJobsProvider = FutureProvider<List<CandidateJob>>((ref) async {
  final filter = ref.watch(candidateJobFilterProvider);
  return ref.watch(candidateRepositoryProvider).getJobs(
    skills: filter.skills,
    location: filter.location,
    experience: filter.experience,
  );
});

final candidateBookmarksProvider = FutureProvider<List<Bookmark>>((ref) async {
  return ref.watch(candidateRepositoryProvider).getBookmarks();
});

// A derived provider that combines bookmarks and jobs to return a list of saved jobs
final savedJobsProvider = FutureProvider<List<CandidateJob>>((ref) async {
  final jobs = await ref.watch(candidateJobsProvider.future);
  final bookmarks = await ref.watch(candidateBookmarksProvider.future);
  
  final bookmarkedJobIds = bookmarks.map((b) => b.jobId).toSet();
  return jobs.where((job) => bookmarkedJobIds.contains(job.jobId)).toList();
});

class CandidateActions {
  final Ref ref;
  CandidateActions(this.ref);

  Future<void> applyForJob(int jobId) async {
    await ref.read(candidateRepositoryProvider).applyForJob(jobId);
    ref.invalidate(candidateApplicationsProvider);
  }

  Future<void> toggleBookmark(int jobId, bool isBookmarked) async {
    if (isBookmarked) {
      await ref.read(candidateRepositoryProvider).removeBookmark(jobId);
    } else {
      await ref.read(candidateRepositoryProvider).bookmarkJob(jobId);
    }
    ref.invalidate(candidateBookmarksProvider);
  }
}

final candidateActionsProvider = Provider<CandidateActions>((ref) {
  return CandidateActions(ref);
});
