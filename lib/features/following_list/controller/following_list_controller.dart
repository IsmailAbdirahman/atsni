import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/common/repository/follow_user.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../../profile/repository/profile_repository.dart';
import '../repository/following_repository.dart';

part 'following_list_controller.g.dart';

@riverpod
class FollowingListController extends _$FollowingListController {
  @override
  Future<List<ProfileModel>> build(
    String userId,
  ) {
    return getAllFollowing(userId);
  }

  Future<List<ProfileModel>> getAllFollowing(String userId) async {
    final profileRepository = ref.read(followingRepositoryProvider);
    final data = await profileRepository
        .getAllFollowing('getSingleUserFollowingProfiles/$userId');
    return data;
  }

  Future<ProfileModel> followUserFromList(String userId) async {
    final profileRepository = ref.read(followUserProvider);
    final result = await profileRepository.followUser('follow-user/$userId');
    state = AsyncValue.data([
      for (var user in state.value!)
        if (user.id == userId)
          user.copyWith(status: result.status, follower: result.follower)
        else
          user
    ]);

    return result;
  }
}
