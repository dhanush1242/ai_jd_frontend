import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/storage/secure_storage.dart';
import 'models/auth_models.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(apiClientProvider), ref.watch(secureStorageProvider));
}

class AuthRepository {
  final Dio _dio;
  final SecureStorage _secureStorage;

  AuthRepository(this._dio, this._secureStorage);

  Future<LoginResponse> login(String email, String password, String role) async {
    final data = role == 'recruiter' 
        ? {'organisation_email': email, 'password': password}
        : {'email': email, 'password': password};
        
    final response = await _dio.post('/${role}s/login', data: data);
    
    return LoginResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> register(String name, String email, String mobileNumber, String password, String role) async {
    final data = role == 'recruiter'
        ? {
            'name': name,
            'organisation_email': email,
            'password': password,
            'mobile_number': mobileNumber,
          }
        : {
            'name': name,
            'email': email,
            'password': password,
            'mobile_number': mobileNumber,
          };
          
    await _dio.post('/${role}s/register', data: data);
  }

  Future<User> getCurrentUser() async {
    final role = await _secureStorage.getRole();
    if (role == null) throw Exception('Role not found');
    
    final response = await _dio.get('/${role}s/me');
    
    // The response data is CandidateResponse or RecruiterResponse
    final data = response.data as Map<String, dynamic>;
    
    return User(
      id: data['candidate_id']?.toString() ?? data['recruiter_id']?.toString() ?? '',
      email: data['email'] ?? data['organisation_email'] ?? '',
      name: data['name'] ?? '',
      role: role,
      mobileNumber: data['mobile_number']?.toString(),
    );
  }
}
