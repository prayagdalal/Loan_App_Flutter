import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> namecontroller = TextEditingController().obs;

  Rx<TextEditingController> phonecontroller = TextEditingController().obs;

  Rx<TextEditingController> citycontroller = TextEditingController().obs;

  RxBool valid = false.obs;

  static Future<bool> setSession(String key, String value) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(key, value);
  }

  static Future<bool> clearSession(String key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    return prefs.remove(key);
  }

  static Future<String> getSession(String key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }
}
