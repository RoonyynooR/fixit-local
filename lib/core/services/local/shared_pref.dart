
import 'package:shared_preferences/shared_preferences.dart';


class SharedPref {
  static late final SharedPreferences pref;
  static const ktoken = "token";
  static const kuser = "user";
  static const kotp = "otp";
  static const kuserId = "forgot_user_id";
  static const kfavourite = "favourite";

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> saveWishlist(List<String> ids) async {
    await pref.setStringList(kfavourite, ids);
  }

  static List<String> getWishlist() {
    return pref.getStringList(kfavourite) ?? [];
  }

  static Future<void> savetoken(String? token) async {
    if (token == null) return;
    await pref.setString(ktoken, token);
  }

  static String gettoken() {
    return pref.getString(ktoken) ?? "";
  }

  static Future<void> saveotp(String? otp) async {
    if (otp == null) return;
    await pref.setString(kotp, otp);
  }

  static String getotp() {
    return pref.getString(kotp) ?? "";
  }

  static Future<void> saveUserId(int? userId) async {
    if (userId == null) return;
    await pref.setInt(kuserId, userId);
  }

  static int getUserId() {
    return pref.getInt(kuserId) ?? 11;
  }

  static Future<void> setstring(String key, String value) async {
    await pref.setString(key, value);
  }

  static String getstring(String key) {
    return pref.getString(key) ?? "";
  }

  static Future<void> setbool(String key, bool value) async {
    await pref.setBool(key, value);
  }

  static bool getbool(String key) {
    return pref.getBool(key) ?? false;
  }

  
}
