import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_main_button.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/sign_in_image.png',
                width: 250,
              ),
              const SizedBox(height: 20),
              Text(
                'Please sign in into your account.',
                style: TextStyle(fontSize: 18, fontWeight: .bold),
              ),
              const SizedBox(height: 30),
              DecoratedTextField(label: 'Email'),
              const SizedBox(height: 20),
              DecoratedTextField(label: 'Password'),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?'),
                ),
              ),
              const SizedBox(height: 20),
              DecoratedMainButton(
                label: 'Sign in',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
