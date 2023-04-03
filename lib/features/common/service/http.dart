import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/domain/profileModel.dart';

abstract class Http {
  abstract Ref ref;

  Future<dynamic> get(String endPoint);

  Future<dynamic> post(String endPoint, Map<String, String> data);
}
