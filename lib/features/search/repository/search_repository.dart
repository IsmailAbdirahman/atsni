import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/search/data/search_data.dart';

import '../../profile/domain/profileModel.dart';
import '../domain/search_model.dart';

final searchRepositoryProvider = Provider((ref) {
  final searchService = ref.watch(searchServiceProvider);

  return SearchRepository(searchService);
});

class SearchRepository {
  final SearchService searchService;

  SearchRepository(this.searchService);

  Future<List<SearchModel>> getUsernames({
    required String username,
    required String endPoint,
  }) async {
    var data = {'username': username};
    final response = await searchService.post(endPoint, data);
    print("----------------- getUsernames() ------------ $response");

    return List<SearchModel>.from(
        response['profile'].map((user) => SearchModel.fromJson(user)));
  }
}
