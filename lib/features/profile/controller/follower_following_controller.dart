import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/controller/follow_and_unfollow_controller.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

final followingFollowerControllerProvider = StateNotifierProvider<
    FollowingFollowerController,
    AsyncValue<List<ProfileModel>>>((ref) {
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

    final data = await profileRepository
        .getAllFollowing('getSingleUserFollowingProfiles/$userId');
    List<ProfileModel> listData = [];

    for (var user in data) {
      final status = await
      ref.read(followUndFollowProvider.notifier).getStatus(user.id);
      final dd = ProfileModel(following: user.following,
          follower: user.follower,
          id: user.id,
          username: user.username,
          email: user.email,
          status: status);
      listData.add(dd);
    }
    state = AsyncData(listData);

    return data;
  }

  Future<List<ProfileModel>> getAllFollowers(String userId) async {
    state = const AsyncValue.loading();

    final data = await profileRepository
        .getAllFollowers('getSingleUserFollowerProfiles/$userId');
    state = state.copyWithPrevious(AsyncValue.data(data));

    return data;
  }
}
