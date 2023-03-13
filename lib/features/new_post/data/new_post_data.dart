import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:oldinsa/features/common/service/http.dart';

import '../../login/controller/login_controller.dart';

final newPostServiceProvider = Provider((ref) {
  return NewPostService(ref);
});

class NewPostService extends Http {
  @override
  Ref ref;

  NewPostService(this.ref);

  Future<dynamic> newPost(String endPoint, String caption, File file) async {
    String? token = await ref.read(futureTokenProvider.future);
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var request = http.MultipartRequest('POST', Uri.parse(endPoint));
      request.headers.addAll(header);
      request.fields['caption'] = caption;
      request.files.add(http.MultipartFile.fromBytes(
          'file', File(file.path).readAsBytesSync(),
          filename: file.path));
      final res = await request.send();
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future get(String endPoint) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String endPoint, Map<String, String> data) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
