import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/jd_repository.dart';
import '../data/models/jd_models.dart';

part 'jd_provider.g.dart';

@riverpod
class JdHistory extends _$JdHistory {
  @override
  FutureOr<List<GeneratedJD>> build() async {
    // FAKE HISTORY
    return [];
  }

  Future<void> refreshHistory() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => []);
  }
}

@riverpod
class JdGenerator extends _$JdGenerator {
  @override
  FutureOr<GeneratedJD?> build() {
    return null;
  }

  Future<void> generate(JobDescriptionCreate createParams) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 2));
      final fakeJD = GeneratedJD(
        id: 'fake_123',
        jobTitle: createParams.jobTitle,
        generatedContent: GeneratedContent(
          jobSummary: 'This is a mocked job summary for ${createParams.jobTitle}.',
          responsibilities: ['Responsibility 1', 'Responsibility 2'],
          requiredSkills: createParams.skills,
          requiredQualifications: [createParams.educationQualifications],
          preferredQualifications: ['Extra cool skill'],
          experience: createParams.experienceRequired,
          salary: createParams.salary,
          workMode: createParams.workMode,
          jobType: createParams.jobType,
          location: createParams.location,
        )
      );
      return fakeJD;
    });
  }
  
  void clear() {
    state = const AsyncValue.data(null);
  }
}
