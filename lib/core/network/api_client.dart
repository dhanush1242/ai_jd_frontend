import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/secure_storage.dart';

part 'api_client.g.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;

  AuthInterceptor(this._secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

@Riverpod(keepAlive: true)
Dio apiClient(ApiClientRef ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000/api/v1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(AuthInterceptor(secureStorage));
  dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

  return dio;
}
