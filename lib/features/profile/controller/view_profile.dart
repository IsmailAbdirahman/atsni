import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';
///TODO: Call ['/users/viewProfile/:id'] API
///TODO: Fix the code of this class to view Profile
///TODO: Add status to ProfileModel class or create new one
///TODO: Show User Profile Info,
///TODO: Add Follow and and Follow feature


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
      : super(const AsyncValue.loading()) {
    myProfile();
    getAllMyFollowing();
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

  Future<List<ProfileModel>> getAllMyFollowing() async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await profileRepository.getAllMyFollowing(
        'getMyFollowingProfile', header);
    // print(data);

    return data;
  }
}
