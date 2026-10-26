// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sights_app/presentation/config/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _redirectToNextScreen(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: .maxFinite,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Image.asset(
                'assets/images/camping_image.png',
                width: 300,
              ),
              Lottie.asset(
                'assets/animations/loading_dots.json',
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _redirectToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    FirebaseAuth.instance.currentUser == null
        ? Navigator.of(context).pushReplacementNamed(AppRouter.signIn)
        : Navigator.of(context).pushReplacementNamed(AppRouter.home);
  }
}
