import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/profile_repository.dart';

final followUndFollowProvider =
    StateNotifierProvider<FollowUndFollow, AsyncValue<String>>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  return FollowUndFollow(profileRepository: profileRepository, ref: ref);
});

class FollowUndFollow extends StateNotifier<AsyncValue<String>> {
  FollowUndFollow({required this.profileRepository, required this.ref})
      : super(const AsyncValue.loading());

  final ProfileRepository profileRepository;
  final Ref ref;

  Future<String> followUser(String id) async {
    final data = await profileRepository.followUser('follow-user/$id');
    await getStatus(id);
    return data;
  }

  Future<String> getStatus(String userID) async {
    state = const AsyncValue.loading();
    final status = await profileRepository.getStatus('getStatus/$userID');
    state = AsyncValue.data(status);
    return status;
  }
}
