import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/login_response_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<LoginResponseModel> login({required String username, required String password}) async {
    final response = await _apiService.postApiResponse("/login", {"email": username, "password": password});

    return LoginResponseModel.fromJson(response);
  }
}
