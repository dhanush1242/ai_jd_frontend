import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/storage/secure_storage.dart';

part 'chat_repository.g.dart';

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepository(ref.watch(apiClientProvider), ref.watch(secureStorageProvider));
}

class ChatRepository {
  final Dio _dio;
  final SecureStorage _secureStorage;

  ChatRepository(this._dio, this._secureStorage);

  Future<String> sendMessage(String message) async {
    final role = await _secureStorage.getRole();
    if (role == null) throw Exception('Role not found');
    
    final response = await _dio.post(
      '/${role}s/chat',
      data: {'message': message},
    );
    
    return response.data['response'] as String;
  }
}
