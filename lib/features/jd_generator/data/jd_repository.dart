import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../auth/data/models/auth_models.dart';
import 'models/jd_models.dart';

part 'jd_repository.g.dart';

@riverpod
JdRepository jdRepository(JdRepositoryRef ref) {
  return JdRepository(ref.watch(apiClientProvider));
}

class JdRepository {
  final Dio _dio;

  JdRepository(this._dio);

  Future<GeneratedJD> generateJd(JobDescriptionCreate jdCreate) async {
    final response = await _dio.post('/jd/generate', data: jdCreate.toJson());
    
    final apiResponse = ApiResponse<GeneratedJD>.fromJson(
      response.data, 
      (json) => GeneratedJD.fromJson(json as Map<String, dynamic>)
    );
    
    if (apiResponse.success && apiResponse.data != null) {
      return apiResponse.data!;
    } else {
      throw Exception(apiResponse.message);
    }
  }

  Future<List<GeneratedJD>> getJdHistory() async {
    final response = await _dio.get('/jd');
    
    final apiResponse = ApiResponse<List<GeneratedJD>>.fromJson(
      response.data, 
      (json) => (json as List).map((e) => GeneratedJD.fromJson(e)).toList()
    );

    if (apiResponse.success && apiResponse.data != null) {
      return apiResponse.data!;
    } else {
      throw Exception(apiResponse.message);
    }
  }
}
