import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/storage/secure_storage.dart';
import '../data/auth_repository.dart';
import '../data/models/auth_models.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<User?> build() async {
    final token = await ref.read(secureStorageProvider).getToken();
    if (token != null) {
      try {
        return await ref.read(authRepositoryProvider).getCurrentUser();
      } catch (e) {
        await ref.read(secureStorageProvider).deleteToken();
        return null;
      }
    }
    return null;
  }

  Future<void> login(String email, String password, String role) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // FAKE LOGIN FOR UI TESTING
      await Future.delayed(const Duration(seconds: 1)); // simulate network delay
      return User(id: 'test_id', email: 'test@example.com', name: 'Mocked User', role: role);
    });
  }

  Future<void> register(String name, String email, String password, String role) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // FAKE REGISTER FOR UI TESTING
      await Future.delayed(const Duration(seconds: 1));
      return User(id: 'test_id', email: 'test@example.com', name: 'Mocked User', role: role);
    });
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).deleteToken();
    state = const AsyncValue.data(null);
  }
}
