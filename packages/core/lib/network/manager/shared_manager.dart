import 'package:core/util/enum/preference_key_enum.dart';
import 'package:core/util/resource/authentication_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedManager {
  static final SharedManager _instance = SharedManager._internal();

  factory SharedManager() => _instance;

  SharedManager._internal();

  SharedPreferences? _preferences;

  Future<SharedPreferences> get _prefs async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  // Token sıfırlama ve tüm verileri temizleme
  Future<void> clearAll() async {
    final prefs = await _prefs;
    AuthenticationSource().clearAccessToken();
    await prefs.clear();
  }

  // Setters
  Future<void> setStringValue(PreferenceKey key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key.name, value);
  }

  Future<void> setIntegerValue(PreferenceKey key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key.name, value);
  }

  Future<void> setBoolValue(PreferenceKey key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key.name, value);
  }

  // Getters
  Future<String> getStringValue(PreferenceKey key) async {
    final prefs = await _prefs;
    return prefs.getString(key.name) ?? '';
  }

  Future<int> getIntegerValue(PreferenceKey key) async {
    final prefs = await _prefs;
    return prefs.getInt(key.name) ?? 0;
  }

  Future<bool> getBoolValue(PreferenceKey key) async {
    final prefs = await _prefs;
    return prefs.getBool(key.name) ?? false;
  }
}
