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

  Future<String> editMyProfile({
    required String username,
    required String endPoint,
  }) async {
    var data = {'username': username};
    final response = await profileService.post(endPoint, data);

    return response['updatedUsername'];
  }
}
