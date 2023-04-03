import 'package:oldinsa/features/common/service/htttp_service.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'followers_list_repository.g.dart';

@riverpod
FollowersListRepo followersListRepo(FollowersListRepoRef ref) {
  return FollowersListRepo(httpService: ref.watch(httpServiceProvider));
}

class FollowersListRepo {
  final HttpService httpService;

  FollowersListRepo({required this.httpService});

  Future<List<ProfileModel>> getAllFollowers(String endPoint) async {
    final response = await httpService.get(endPoint);
    return List<ProfileModel>.from(
        response['profileList'].map((user) => ProfileModel.fromJson(user)));
  }
}
