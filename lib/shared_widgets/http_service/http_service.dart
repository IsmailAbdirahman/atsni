import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/profile/domain/profileModel.dart';

abstract class HttpService {


  Future<dynamic> get(String endPoint, Map<String, String> header);

  Future<dynamic> post(String endPoint, Map<String, String> header, Map<String, String> data);
}
