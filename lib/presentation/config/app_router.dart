import 'package:flutter/material.dart';
import 'package:sights_app/presentation/authentication/sign_in/screen/sign_in_screen.dart';
import 'package:sights_app/presentation/home/screen/home_screen.dart';
import 'package:sights_app/presentation/splash/screen/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }
}
