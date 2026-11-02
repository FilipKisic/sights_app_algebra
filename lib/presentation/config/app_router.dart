import 'package:flutter/material.dart';
import 'package:sights_app/presentation/authentication/sign_in/screen/sign_in_screen.dart';
import 'package:sights_app/presentation/home/screen/home_screen.dart';
import 'package:sights_app/presentation/splash/screen/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      splash => MaterialPageRoute(builder: (_) => const SplashScreen()),
      signIn => MaterialPageRoute(builder: (_) => const SignInScreen()),
      home => MaterialPageRoute(builder: (_) => const HomeScreen()),
      _ => throw Exception('Route ${settings.name} not found.'),
    };
  }
}
