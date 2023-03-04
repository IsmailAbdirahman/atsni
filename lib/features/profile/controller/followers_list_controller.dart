import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/profile_repository.dart';

part 'followers_list_controller.g.dart';

@riverpod
class FollowersListController extends _$FollowersListController {

  @override
  Future<List<ProfileModel>> build(String userId) async {
    return getAllFollowers(userId);
  }

  Future<List<ProfileModel>> getAllFollowers(String userId) async {
    state = const AsyncValue.loading();
    final profileRepository = ref.read(profileRepositoryProvider);
    final data = await profileRepository
        .getAllFollowers('getSingleUserFollowerProfiles/$userId');
    state = AsyncData(data);
    return data;
  }
}
