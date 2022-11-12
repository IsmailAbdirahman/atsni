import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../login/controller/login_controller.dart';
import '../repository/profile_repository.dart';

final followControllerProvider =
    StateNotifierProvider<FollowController, AsyncValue<List<ProfileModel>>>(
        (ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  final reff = ref;
  return FollowController(profileRepository: profileRepository, ref: reff);
});

class FollowController extends StateNotifier<AsyncValue<List<ProfileModel>>> {
  final ProfileRepository profileRepository;
  final Ref ref;

  FollowController({required this.profileRepository, required this.ref})
      : super(const AsyncValue.loading()) {
    getAllMyFollowing();
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
    state = AsyncValue.data(data);

    return data;
  }
}
