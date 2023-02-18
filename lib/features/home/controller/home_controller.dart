import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/repository/home_repository.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';

import '../../profile/controller/view_profile_controller.dart';
import '../../profile/data/profile_service.dart';
import '../../profile/repository/profile_repository.dart';
import '../domain/home_model.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<List<HomeModel>>>((ref) {
  final profileService = ref.watch(profileServiceProvider);
  final homeRepository = ref.watch(homeRepositoryProvider);
  final profileRepo = ref.watch(profileRepositoryProvider);
  final reff = ref;
  return HomeController(
      profileService: profileService,
      homeRepository: homeRepository,
      profileRepository: profileRepo,
      ref: reff);
});

class HomeController extends StateNotifier<AsyncValue<List<HomeModel>>> {
  final Ref ref;
  final HomeRepository homeRepository;
  final ProfileService profileService;
  final ProfileRepository profileRepository;

  HomeController(
      {required this.profileService,
      required this.homeRepository,
      required this.profileRepository,
      required this.ref})
      : super(const AsyncValue.loading()) {
    getPosts();
  }

  Future<List<HomeModel>> getPosts() async {
    state = const AsyncValue.loading();
    final data = await homeRepository.getPosts('getMyFollowingsPosts');
    state = AsyncValue.data(data);

    return data;
  }

  Future likePost(String postId) async {
    final data = await homeRepository.likePost('likedPost/$postId');

    final List<HomeModel> newState = [];

    for (var value in state.value!) {
      final newElement = HomeModel(
          id: value.id,
          caption: value.caption,
          image: value.image,
          likes: data.likes,
          author: value.author);
      newState.add(newElement);
    }

    state = AsyncData(newState);
  }
}
