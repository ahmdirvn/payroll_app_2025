import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/get_profile_reponse_model.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<GetProfileResponModel> getProfile() async {
    final response = await _apiService.getApiResponse('/profile');
    print(response);
    return GetProfileResponModel.fromJson(response);
  }

  @override
  Future<String> updateProfile({required String nama, required String email, String? password}) async {
    final body = {'nama': nama, 'email': email, if (password != null && password.isNotEmpty) 'password': password};

    final response = await _apiService.postApiResponse('/profile/update', body);

    return response['message'];
  }
}
