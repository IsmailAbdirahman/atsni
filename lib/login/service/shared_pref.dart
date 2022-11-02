import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sharedPrefProvider = Provider((ref) => SharedPref());

class SharedPref {
  static const String tokenKey = 'token';

  Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(tokenKey, token);
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString(tokenKey);
    return token;
  }
}
