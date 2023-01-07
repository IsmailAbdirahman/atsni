import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/shared_widgets/endpoints.dart';
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';
import 'package:http/http.dart' as http;

import '../../login/controller/login_controller.dart';

final searchServiceProvider = Provider((ref) {
  return SearchService(ref);
});

class SearchService extends HttpService {
  @override
  Ref<Object?> ref;

  SearchService(this.ref);

  @override
  Future<dynamic> get(String endPoint) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse('$baseUrl/users/$endPoint'),
          headers: header);
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<dynamic> post(String endPoint, Map<String, String> data) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var jsonData = json.encode(data);
      var url = Uri.https('oldclonee.onrender.com', '/users/$endPoint');

      final response = await http.post(url, headers: header, body: jsonData);
      final result = jsonDecode(response.body);
      print("----------------- POST() ------------ $result");

      return result;
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
