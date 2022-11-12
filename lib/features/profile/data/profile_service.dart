import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';
import '../../../shared_widgets/endpoints.dart';

final profileServiceProvider = Provider((ref) => ProfileService());

class ProfileService extends HttpService {
  @override
  Future<dynamic> get(String endPoint, Map<String, String> header) async {
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
  Future post(String endPoint, String header) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
