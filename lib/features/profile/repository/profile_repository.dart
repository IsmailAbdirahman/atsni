import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/data/profile_service.dart';
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';

import '../domain/profileModel.dart';

final profileRepositoryProvider = Provider((ref) {
  final profileService = ref.watch(profileServiceProvider);
  return ProfileRepository(profileService);
});

class ProfileRepository {
  ProfileService profileService;

  ProfileRepository(this.profileService);

  Future<MyProfile> myProfile(
      String endPoint, Map<String, String> header) async {
    final response = await profileService.get(endPoint, header);
    print(response);
    var data = MyProfile.fromJson(response);

    return data;
  }
}
