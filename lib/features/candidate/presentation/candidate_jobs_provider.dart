import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/candidate_repository.dart';
import '../data/models/candidate_models.dart';

final candidateApplicationsProvider = FutureProvider<List<CandidateApplication>>((ref) async {
  return ref.watch(candidateRepositoryProvider).getApplications();
});

final candidateJobsProvider = FutureProvider<List<CandidateJob>>((ref) async {
  return ref.watch(candidateRepositoryProvider).getJobs();
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
