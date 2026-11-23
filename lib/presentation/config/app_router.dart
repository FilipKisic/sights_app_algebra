import 'package:flutter/material.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/authentication/sign_in/screen/sign_in_screen.dart';
import 'package:sights_app/presentation/home/screen/home_screen.dart';
import 'package:sights_app/presentation/places/details/screen/place_details_screen.dart';
import 'package:sights_app/presentation/splash/screen/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String home = '/home';
  static const String details = '/details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      splash => MaterialPageRoute(builder: (_) => const SplashScreen()),
      signIn => MaterialPageRoute(builder: (_) => const SignInScreen()),
      home => MaterialPageRoute(builder: (_) => const HomeScreen()),
      details => MaterialPageRoute(builder: (_) {
        final place = (settings.arguments as Place);
        return PlaceDetailsScreen(place: place);
      }),
      _ => throw Exception('Route ${settings.name} not found.'),
    };
  }
}
