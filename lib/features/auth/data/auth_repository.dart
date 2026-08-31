import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import 'models/auth_models.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(apiClientProvider));
}

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<LoginResponse> login(String email, String password, String role) async {
    final path = role == 'recruiter' ? '/recruiters/login' : '/candidates/login';
    final requestData = role == 'recruiter' 
        ? {'organisation_email': email, 'password': password}
        : {'email': email, 'password': password};

    final response = await _dio.post(path, data: requestData);
    
    final data = Map<String, dynamic>.from(response.data);
    data['expires_in'] = data['expires_in'] ?? 3600; // Mock expires_in as it is missing from OpenAPI spec
    return LoginResponse.fromJson(data);
  }

  Future<void> register(String name, String email, String password, String role) async {
    final path = role == 'recruiter' ? '/recruiters/register' : '/candidates/register';
    final requestData = role == 'recruiter'
        ? {'name': name, 'organisation_email': email, 'password': password, 'mobile_number': '1234567890'} // Dummy mobile
        : {'name': name, 'email': email, 'password': password, 'mobile_number': '1234567890'};

    await _dio.post(path, data: requestData);
  }

  Future<User> getCurrentUser(String role) async {
    final path = role == 'recruiter' ? '/recruiters/me' : '/candidates/me';
    final response = await _dio.get(path);
    
    final data = response.data as Map<String, dynamic>;
    if (role == 'recruiter') {
      return User(
        id: data['recruiter_id'].toString(),
        email: data['organisation_email'] ?? '',
        name: data['name'] ?? '',
        role: role,
      );
    } else {
      return User(
        id: data['candidate_id'].toString(),
        email: data['email'] ?? '',
        name: data['name'] ?? '',
        role: role,
      );
    }
  }
}
