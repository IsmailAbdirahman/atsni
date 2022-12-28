import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/profile_service.dart';
import '../domain/profileModel.dart';


final editRepositoryProvider = Provider((ref) {
  final editProfileRepository = ref.watch(profileServiceProvider);
  return EditProfileRepository(profileService: editProfileRepository);
});



class EditProfileRepository {
  ProfileService profileService;

  EditProfileRepository({required this.profileService});

  Future<MyProfile> editMyProfile(
      {required String username,
      required String password,
      required String endPoint,
      required Map<String, String> header}) async {
    var data = {'username': username, 'password': password};
    final response = await profileService.post(endPoint, header, data);

    return MyProfile.fromJson(response);
  }
}
