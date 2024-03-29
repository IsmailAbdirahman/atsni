import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/features/common/service/http.dart';
import '../../common/service/endpoints.dart';
import '../../login/controller/login_controller.dart';

final profileServiceProvider = Provider((ref) => ProfileService(ref));

class ProfileService extends Http {
  @override
  Ref<Object?> ref;

  ProfileService(this.ref);

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

      final response = await http.post(url, body: jsonData, headers: header);
      final result = jsonDecode(response.body);
      return result;
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}
