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
    final response = await _dio.post('/auth/$role/login', data: {
      'email': email,
      'password': password,
    });
    
    final apiResponse = ApiResponse<LoginResponse>.fromJson(
      response.data, 
      (json) => LoginResponse.fromJson(json as Map<String, dynamic>)
    );
    
    if (apiResponse.success && apiResponse.data != null) {
      return apiResponse.data!;
    } else {
      throw Exception(apiResponse.message);
    }
  }

  Future<void> register(String name, String email, String password, String role) async {
    final response = await _dio.post('/auth/$role/register', data: {
      'name': name,
      'email': email,
      'password': password,
    });

    final apiResponse = ApiResponse<dynamic>.fromJson(
      response.data, 
      (json) => null
    );

    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
  }

  Future<User> getCurrentUser() async {
    final response = await _dio.get('/users/me');
    
    final apiResponse = ApiResponse<User>.fromJson(
      response.data, 
      (json) => User.fromJson(json as Map<String, dynamic>)
    );

    if (apiResponse.success && apiResponse.data != null) {
      return apiResponse.data!;
    } else {
      throw Exception(apiResponse.message);
    }
  }
}
