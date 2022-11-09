import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oldinsa/features/home/domain/posts.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/shared_widgets/http_service/http_service.dart';

import '../../../shared_widgets/endpoints.dart';
import '../../login/controller/login_controller.dart';
import '../../profile/domain/profileModel.dart';

// final futureHomeServiceProvider = FutureProvider((ref) async {
//   final data = await ref.watch(homeServiceProvider).getPosts();
//   return data;
// });

final homeServiceProvider = Provider((ref) => HomeService());

class HomeService extends HttpService {
  // final Ref ref;
  //
  //
  //
  // HomeService(this.ref);

  // Future<List<PostsModel>> getPosts() async {
  //   String? token = await ref.read(futureTokenProvider.future);
  //   final header = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  //
  //   try {
  //     final response = await http.get(
  //         Uri.parse('$baseUrl/userpost/getMyFollowingsPosts'),
  //         headers: header);
  //
  //     return List<PostsModel>.from(
  //         jsonDecode(response.body).map((e) => PostsModel.fromJson(e)));
  //   } catch (e) {
  //     throw (e.toString());
  //   }
  // }

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
  Future post(String endPoint, String header) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
