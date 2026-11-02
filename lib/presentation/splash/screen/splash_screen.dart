import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sights_app/presentation/config/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _redirectToNextScreen(context);
  }

  @override
  Widget build(BuildContext context) {
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
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.of(context).pushNamed(AppRouter.signIn);
      return;
    }
    Navigator.of(context).pushNamed(AppRouter.home);
  }
}
