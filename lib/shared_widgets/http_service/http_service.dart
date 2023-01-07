import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/profile/domain/profileModel.dart';

abstract class HttpService {
  abstract Ref ref;

  Future<dynamic> get(String endPoint);

  Future<dynamic> post(String endPoint, Map<String, String> data);
}
