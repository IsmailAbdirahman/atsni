import 'package:oldinsa/features/common/service/htttp_service.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_post_repository.g.dart';

@riverpod
LikePostRepository likePostRepository(LikePostRepositoryRef ref){
  return LikePostRepository(ref.watch(httpServiceProvider));
}


class LikePostRepository {
  final HttpService httpService;

  LikePostRepository(this.httpService);

  Future<ProfileModel> likePostFromProfile(String? endPoint) async {
    final response = await httpService.get(endPoint!);
    var data = ProfileModel.fromJson(response);
    return data;
  }
}
