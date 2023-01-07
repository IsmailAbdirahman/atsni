import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/domain/posts.dart';
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';

import '../service/home_service.dart';

final homeRepositoryProvider = Provider((ref) {
  final httpService = ref.watch(homeServiceProvider);
  return HomeRepository(httpService);
});

class HomeRepository {
  final HttpService httpService;

  HomeRepository(this.httpService);

  Future<List<PostsModel>> getPosts(String endPoint) async {
    final response = await httpService.get(endPoint);
    return List<PostsModel>.from(response.map((e) => PostsModel.fromJson(e)));
  }

  Future<bool> likePost(String postId, {String? endPoint}) async {
    final likedUsers = await getPosts('getMyFollowingsPosts');
    final response = await httpService.get(endPoint!);
    var data = PostsModel.fromJson(response);

    return false;
  }
}
