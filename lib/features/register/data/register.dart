import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/shared_widgets/endpoints.dart';

import '../domian/register.dart';

class Register {
  Future<RegisterModel> getUserInfo(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('$baseUrl/users/createAccount'),
        headers: headers, body: jsonEncode(data));
    debugPrint(response.body);

    if (response.statusCode == 201) {
      return RegisterModel.fromJson(jsonDecode(response.body));
    } else {
      throw ('Something went wrong');
    }
  }
}
