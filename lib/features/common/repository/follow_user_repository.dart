import 'package:oldinsa/features/common/service/htttp_service.dart';
import 'package:oldinsa/features/profile/domain/profileModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_user_repository.g.dart';

@riverpod
FollowUser followUser(FollowUserRef ref) {
  return FollowUser(ref.watch(httpServiceProvider));
}

class FollowUser {
  final HttpService httpService;

  FollowUser(this.httpService);

  Future<ProfileModel> followUser(String endPoint) async {
    final response = await httpService.get(endPoint);
    return ProfileModel.fromJson(response['userInfo']);
  }
}
