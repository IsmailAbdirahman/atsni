import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

final viewControllerProvider =
    StateNotifierProvider<ViewProfileController, AsyncValue<MyProfile>>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  final reff = ref;
  return ViewProfileController(profileRepository: profileRepository, ref: reff);
});

class ViewProfileController extends StateNotifier<AsyncValue<MyProfile>> {
  final ProfileRepository profileRepository;
  final Ref ref;

  ViewProfileController({required this.profileRepository, required this.ref})
      : super(const AsyncValue.loading());

  Future<List<ProfileModel>> getAllFollowing(String userId) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await profileRepository.getAllFollowing(
        'getSingleUserFollowingProfiles/$userId', header);
    return data;
  }

  Future<List<ProfileModel>> getAllFollowers(String userId) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await profileRepository.getAllFollowers(
        'getSingleUserFollowerProfiles/$userId', header);
    return data;
  }

  Future<String> followUser(String id) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await profileRepository.followUser('follow-user/$id', header);
    await viewUserProfile(id);

    return data;
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

  Future<MyProfile> viewUserProfile(String id) async {
    state = const AsyncValue.loading();
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final result =
        await profileRepository.viewUserProfile(id, 'viewProfile/$id', header);

    state = AsyncValue.data(result);
    return result;
  }
}
