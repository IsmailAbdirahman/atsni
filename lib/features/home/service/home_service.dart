import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/features/common/service/http.dart';

import '../../common/service/endpoints.dart';
import '../../login/controller/login_controller.dart';

final homeServiceProvider = Provider((ref) => HomeService(ref));

class HomeService extends Http {
  @override
  Ref<Object?> ref;

  HomeService(this.ref);

  @override
  Future<dynamic> get(String endPoint) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
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
  Future post(String endPoint, Map<String, String> data) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
