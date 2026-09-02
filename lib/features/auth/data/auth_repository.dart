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
    try {
      final path = role == 'recruiter' ? '/recruiters/login' : '/candidates/login';
      final response = await _dio.post(path, data: {
        if (role == 'recruiter') 'organisation_email': email else 'email': email,
        'password': password,
      });
      final data = Map<String, dynamic>.from(response.data as Map<String, dynamic>);
      data['expires_in'] = data['expires_in'] ?? 3600; // Mock expires_in as it is missing from OpenAPI spec
      return LoginResponse.fromJson(data);
    } on DioException catch (e) {
      final message = e.response?.data['detail'] ?? e.message;
      throw Exception(message);
    }
  }

  Future<void> register(String name, String email, String password, String mobileNumber, String role) async {
    try {
      final path = role == 'recruiter' ? '/recruiters/register' : '/candidates/register';
      await _dio.post(path, data: {
        'name': name,
        if (role == 'recruiter') 'organisation_email': email else 'email': email,
        'password': password,
        'mobile_number': mobileNumber,
      });
    } on DioException catch (e) {
      final message = e.response?.data['detail'] ?? e.message;
      throw Exception(message);
    }
  }

  Future<User> getCurrentUser(String role) async {
    try {
      final path = role == 'recruiter' ? '/recruiters/profile' : '/candidates/profile';
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
    } on DioException catch (e) {
      final message = e.response?.data['detail'] ?? e.message;
      throw Exception(message);
    }
  }
}
