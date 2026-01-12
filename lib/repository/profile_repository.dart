import '../model/get_profile_reponse_model.dart';

abstract class ProfileRepository {
  Future<GetProfileResponModel> getProfile();

  Future<String> updateProfile({required String nama, required String email, String? password});
}
