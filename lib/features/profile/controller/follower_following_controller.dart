import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

final followingFollowerControllerProvider = StateNotifierProvider.autoDispose<
    FollowingFollowerController, AsyncValue<List<ProfileModel>>>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  final reff = ref;
  return FollowingFollowerController(
      profileRepository: profileRepository, ref: reff);
});

class FollowingFollowerController
    extends StateNotifier<AsyncValue<List<ProfileModel>>> {
  FollowingFollowerController(
      {required this.profileRepository, required this.ref})
      : super(const AsyncValue.loading());

  final ProfileRepository profileRepository;
  final Ref ref;

  Future<List<ProfileModel>> getAllFollowing(String userId) async {
    state = const AsyncValue.loading();
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await profileRepository.getAllFollowing(
        'getSingleUserFollowingProfiles/$userId', header);
    state = AsyncValue.data(data);
    return data;
  }

  Future<List<ProfileModel>> getAllFollowers(String userId) async {
    state = const AsyncValue.loading();
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await profileRepository.getAllFollowers(
        'getSingleUserFollowerProfiles/$userId', header);
    state = AsyncValue.data(data);

    return data;
  }
}
