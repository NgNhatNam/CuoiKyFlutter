import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getName() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString('keyName');
  }

  Future<void> setName(String name) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString('keyName', name);
  }

  Future<int?> getAge() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getInt('keyAge');
  }

  Future<void> setAge(int age) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt('keyAge', age);
  }

  Future<bool?> getGender() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool('keyGender');
  }

  Future<void> setGender(bool gender) async {
    SharedPreferences prefs = await _prefs;
    prefs.setBool('keyGender', gender);
  }
}
