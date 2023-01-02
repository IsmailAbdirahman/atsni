import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/search/data/search_data.dart';

import '../../profile/domain/profileModel.dart';

final searchRepositoryProvider = Provider((ref) {
  final searchService = ref.watch(searchServiceProvider);

  return SearchRepository(searchService);
});

class SearchRepository {
  final SearchService searchService;

  SearchRepository(this.searchService);

  Future<List<ProfileModel>> getUsernames(
      {required String username,
      required String endPoint,
      required Map<String, String> header}) async {
    var data = {'username': username};
    final response = await searchService.post(endPoint, header, data);
    print("----------------- getUsernames() ------------ $response");

    return List<ProfileModel>.from(
        response['profile'].map((user) => ProfileModel.fromJson(user)));
  }
}