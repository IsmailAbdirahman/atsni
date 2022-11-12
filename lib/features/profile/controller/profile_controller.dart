import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<MyProfile>>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  final reff = ref;
  return ProfileController(profileRepository: profileRepository, ref: reff);
});

class ProfileController extends StateNotifier<AsyncValue<MyProfile>> {
  final ProfileRepository profileRepository;
  final Ref ref;

  ProfileController({required this.profileRepository, required this.ref})
      : super(const AsyncValue.loading()) {
    myProfile();
  }

  Future<MyProfile> myProfile() async {
    state = const AsyncValue.loading();
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final result = await profileRepository.myProfile('myProfile', header);
    state = AsyncValue.data(result);
    return result;
  }

  // Future<List<ProfileModel>> getAllMyFollowing() async {
  //   String? token = await ref.read(futureTokenProvider.future);
  //   final header = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  //   final data = await profileRepository.getAllMyFollowing(
  //       'getMyFollowingsPosts', header);
  //  // print(data);
  //
  //   return data;
  // }
}
