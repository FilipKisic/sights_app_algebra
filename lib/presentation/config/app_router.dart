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
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case details:
        final place = settings.arguments as Place;
        return MaterialPageRoute(builder: (_) => PlaceDetailsScreen(place: place));
      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }
}
