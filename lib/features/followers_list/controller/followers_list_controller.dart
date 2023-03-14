import 'package:oldinsa/features/common/repository/follow_user.dart';
import 'package:oldinsa/features/followers_list/repository/followers_list_repository.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:oldinsa/features/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'followers_list_controller.g.dart';

@riverpod
class FollowersListController extends _$FollowersListController {
  @override
  Future<List<ProfileModel>> build(String userId) async {
    return getAllFollowers(userId);
  }

  Future<List<ProfileModel>> getAllFollowers(String userId) async {
    state = const AsyncValue.loading();
    final profileRepository = ref.read(followersListRepoProvider);
    final data = await profileRepository
        .getAllFollowers('getSingleUserFollowerProfiles/$userId');
    state = AsyncData(data);
    return data;
  }

  Future<String> followUserFromList(String userId) async {
    final profileRepository = ref.read(followUserProvider);
    final status = await profileRepository.followUser('follow-user/$userId');
    state = AsyncValue.data([
      for (var user in state.value!)
        if (user.id == userId) user.copyWith(status: status) else user
    ]);

    return status;
  }
}
