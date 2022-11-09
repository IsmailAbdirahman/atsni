import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/repository/home_repository.dart';

import '../../login/controller/login_controller.dart';
import '../../profile/data/profile_service.dart';
import '../domain/posts.dart';

class HomeEntity {
  AsyncValue<List<PostsModel>> data;

  HomeEntity({required this.data});

  HomeEntity copyWith({AsyncValue<List<PostsModel>>? data}) {
    return HomeEntity(data: data ?? this.data);
  }
}

final futureHomeControllerProvider = FutureProvider((ref) async {
  final homeController =
      await ref.watch(homeControllerProvider.notifier).getPosts();
  return homeController;
});

final homeControllerProvider = StateNotifierProvider((ref) {
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
      : super(const AsyncValue.loading());

  String endPoint = 'getMyFollowingsPosts';

  Future<List<PostsModel>> getPosts() async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await homeRepository.getPosts('getMyFollowingsPosts', header);
    return data;
  }

  Future<bool> likePost(String postId) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final data = await homeRepository.likePost(postId,
        endPoint: 'likedPost/$postId', header: header);
    print(data);
    return true;
  }
}
