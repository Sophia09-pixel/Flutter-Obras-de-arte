import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:obras_de_arte/data/local/repository/settings_repository_impl.dart';
import 'package:obras_de_arte/data/settings_repository.dart';
import 'package:obras_de_arte/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SettingsRepository _settingsRepository;
  @override
  void initState() {
    super.initState();
    _loadSettingsAndNavigate();
  }

  Future<void> _loadSettingsAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    _settingsRepository = SettingsRepositoryImpl(prefs);
    bool showIntro = await _settingsRepository.getShowIntro();
    // Aguarda animação Lottie rodar (ex: 3s)
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    if (showIntro) {
      Navigator.pushReplacementNamed(context, Routes.intro);
    } else {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
