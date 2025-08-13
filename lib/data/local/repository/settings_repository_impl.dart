import 'package:obras_de_arte/data/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  static const _keyShowIntro = 'show_intro';
  final SharedPreferences _prefs;
  SettingsRepositoryImpl(this._prefs);
  @override
  Future<bool> getShowIntro() async {
    return _prefs.getBool(_keyShowIntro) ?? true;
  }

  @override
  Future<void> setShowIntro(bool value) async {
    await _prefs.setBool(_keyShowIntro, value);
  }
}
