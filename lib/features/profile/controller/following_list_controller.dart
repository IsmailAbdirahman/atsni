import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

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
    final profileRepository = ref.read(profileRepositoryProvider);
    final data = await profileRepository
        .getAllFollowing('getSingleUserFollowingProfiles/$userId');
    print("0-0-0-0-0-0-0-0-0-0-0 ${data}");
    return data;
  }

  Future<String> followUserFromList(String userId) async {
    final profileRepository = ref.read(profileRepositoryProvider);
    final status = await profileRepository.followUser('follow-user/$userId');
    state = AsyncValue.data([
      for (var user in state.value!)
        if (user.id == userId) user.copyWith(status: status) else user
    ]);

    return status;
  }
}
