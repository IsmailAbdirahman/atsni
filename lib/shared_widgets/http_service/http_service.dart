import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HttpService {


  Future<dynamic> get(String endPoint, Map<String, String> header);

  Future<dynamic> post(String endPoint, String header);
}
