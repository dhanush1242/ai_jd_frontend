import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../data/candidate_repository.dart';
import '../data/models/candidate_models.dart';

final candidateDetailsProvider = FutureProvider<CandidateDetails?>((ref) async {
  return ref.watch(candidateRepositoryProvider).getDetails();
});

final profileCompletedProvider = Provider<AsyncValue<bool>>((ref) {
  return ref.watch(candidateDetailsProvider).whenData((details) => details != null);
});

final candidateControllerProvider = StateNotifierProvider<CandidateController, AsyncValue<void>>((ref) {
  return CandidateController(ref.watch(candidateRepositoryProvider));
});

class CandidateController extends StateNotifier<AsyncValue<void>> {
  final CandidateRepository _repository;

  CandidateController(this._repository) : super(const AsyncValue.data(null));

  Future<void> saveProfile({
    String? skills,
    String? education,
    String? location,
    String? experience,
    String? workMode,
    String? jobType,
    PlatformFile? profilePicture,
    PlatformFile? resume,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.saveDetails(
        skills: skills,
        educationQualification: education,
        preferredWorkLocation: location,
        experience: experience,
        preferredWorkMode: workMode,
        preferredJobType: jobType,
        profilePicture: profilePicture,
        resume: resume,
      );
    });
  }
}
