import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:oldinsa/login/controller/login_controller.dart';

import '../../home/domain/posts.dart';
import '../../shared_widgets/endpoints.dart';
import '../domain/profileModel.dart';

final futureprofileServiceProvider = FutureProvider((ref) async {
  final res = await ref.watch(profileServiceProvider).myProfile();
  return res;
});

final profileServiceProvider = Provider(ProfileService.new);

class ProfileService {
  final Ref ref;

  ProfileService(this.ref);

  Future<ProfileModel> myProfile() async {
    String? token = await ref.read(futureTokenProvider.future);
    final heade = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response =
        await http.get(Uri.parse('$baseUrl/users/myProfile'), headers: heade);
    debugPrint(response.body.toString());
    try {
      debugPrint(jsonDecode(response.body)['']);
      return ProfileModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<PostsModel> likePost(String id) async {
    String? token = await ref.read(futureTokenProvider.future);

    final heade = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .get(Uri.parse('$baseUrl/userpost/likedPost/$id'), headers: heade);

      debugPrint(response.body.toString());

      return PostsModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw (e.toString());
    }
  }
}
