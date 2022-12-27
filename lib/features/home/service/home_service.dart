import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';

import '../../../shared_widgets/endpoints.dart';

final homeServiceProvider = Provider((ref) => HomeService());

class HomeService extends HttpService {
  @override
  Future<dynamic> get(String endPoint, Map<String, String> header) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/userpost/$endPoint'),
          headers: header);

      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future post(
      String endPoint, Map<String, String> header, Map<String, String> data) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
