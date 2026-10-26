import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/authentication/sign_in/controller/state/sign_in_state.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_main_button.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_text_field.dart';
import 'package:sights_app/presentation/home/screen/home_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInControllerProvider);

    ref.listen(signInControllerProvider, (_, state) {
      if (state is AuthenticatedState) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
        return;
      }
      if (state is ErrorState) {
        const snackBar = SnackBar(content: Text('There was an error...'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                DecoratedTextField(label: 'Email', validator: _validateEmail, controller: _emailController),
                const SizedBox(height: 20),
                DecoratedTextField(label: 'Password', validator: _validatePassword, controller: _passwordController),
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
                  onPressed: _signIn,
                  isLoading: state is LoadingState,
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
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email.';
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return 'Please enter valid email.';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }

    if (value.length < 8) {
      return 'Password should be at least 8 characters.';
    }

    return null;
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      ref.read(signInControllerProvider.notifier).signIn(_emailController.text, _passwordController.text);
    }
  }
}
