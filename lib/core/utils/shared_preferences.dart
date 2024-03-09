import 'package:shared_preferences/shared_preferences.dart';

class ShPreferences {
  static SharedPreferences? shPrefernces;

  static Future initialShPreferen() async {
    return shPrefernces = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({required key, required value}) async {
    return await shPrefernces!.setBool(key, value);
  }

  //dynamic //string
  static bool? getData({required key}) {
    return shPrefernces!.getBool(key);
  }

  ///////////////////////////////////
  // بيستقبل كل الانواع
  static Future<bool> savesetDataLoginSharedprefernec(
      String key, dynamic value) {
    if (value is bool) return shPrefernces!.setBool(key, value); //value bool
    if (value is String) {
      return shPrefernces!.setString(key, value); // value String
    }
    if (value is int) return shPrefernces!.setInt(key, value); // value  int

    return shPrefernces!.setDouble(key, value); // value  double
  }

  static dynamic getDataLoginSharedprefernec({String? key}) {
    return shPrefernces!.get(key!); // get object
  }

  static Future<bool> removeData(String key) async {
    return await shPrefernces!.remove(key);
  }
}
