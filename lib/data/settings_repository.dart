abstract class SettingsRepository {
  Future<bool> getShowIntro();
  Future<void> setShowIntro(bool value);
}
