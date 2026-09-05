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
    final role = await ref.read(secureStorageProvider).getRole();
    if (token != null && role != null) {
      try {
        return await ref.read(authRepositoryProvider).getCurrentUser();
      } catch (e) {
        await ref.read(secureStorageProvider).deleteToken();
        await ref.read(secureStorageProvider).deleteRole();
        return null;
      }
    }
    return null;
  }

  Future<void> login(String email, String password, String role) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final response = await ref.read(authRepositoryProvider).login(email, password, role);
      await ref.read(secureStorageProvider).saveToken(response.accessToken);
      await ref.read(secureStorageProvider).saveRole(role);
      return await ref.read(authRepositoryProvider).getCurrentUser();
    });
  }

  Future<void> register(String name, String email, String mobileNumber, String password, String role) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).register(name, email, mobileNumber, password, role);
      // Auto-login after registration
      final response = await ref.read(authRepositoryProvider).login(email, password, role);
      await ref.read(secureStorageProvider).saveToken(response.accessToken);
      await ref.read(secureStorageProvider).saveRole(role);
      return await ref.read(authRepositoryProvider).getCurrentUser();
    });
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).deleteToken();
    await ref.read(secureStorageProvider).deleteRole();
    state = const AsyncValue.data(null);
  }
}
