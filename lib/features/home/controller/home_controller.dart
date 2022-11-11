import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/repository/home_repository.dart';

import '../../login/controller/login_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/data/profile_service.dart';
import '../domain/posts.dart';

class HomeEntity {
  AsyncValue<List<PostsModel>> data;

  HomeEntity({required this.data});

  HomeEntity copyWith({AsyncValue<List<PostsModel>>? data}) {
    return HomeEntity(data: data ?? this.data);
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<List<PostsModel>>>((ref) {
  final profileService = ref.watch(profileServiceProvider);
  final homeRepository = ref.watch(homeRepositoryProvider);
  final reff = ref;
  return HomeController(
      profileService: profileService,
      homeRepository: homeRepository,
      ref: reff);
});

class HomeController extends StateNotifier<AsyncValue<List<PostsModel>>> {
  final Ref ref;
  final HomeRepository homeRepository;
  final ProfileService profileService;

  HomeController(
      {required this.profileService,
      required this.homeRepository,
      required this.ref})
      : super(const AsyncValue.loading()) {
    getPosts();
  }

  Future<List<PostsModel>> getPosts() async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await homeRepository.getPosts('getMyFollowingsPosts', header);
    final profile =
        await ref.read(profileControllerProvider.notifier).myProfile();
    final ddd = data.map((post) {
      return PostsModel(
          id: post.id,
          caption: post.caption,
          countLikes: post.countLikes,
          likes: post.likes,
          author: post.author,
          isLiked: post.likes.contains(profile.id));
    }).toList();
    state = AsyncValue.data(ddd);
    return data;
  }

  Future<bool> likePost(String postId) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    await homeRepository.likePost(postId,
        endPoint: 'likedPost/$postId', header: header);
    await getPosts();
    return true;
  }
}
