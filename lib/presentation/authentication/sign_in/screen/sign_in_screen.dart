import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/authentication/sign_in/controller/state/sign_in_state.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_main_button.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_text_field.dart';
import 'package:sights_app/presentation/home/screen/home_screen.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';

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

    ref.listen(
      signInControllerProvider,
      (_, state) {
        if (state is AuthenticatedState) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
        }
        if (state is ErrorState) {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(state.exception.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
    );

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
                  style: AppTextStyles.signInTitle,
                ),
                const SizedBox(height: 30),
                DecoratedTextField(
                  controller: _emailController,
                  label: 'Email',
                  validator: _validateEmail,
                ),
                const SizedBox(height: 20),
                DecoratedTextField(
                  controller: _passwordController,
                  label: 'Password',
                  validator: _validatePassword,
                  isPassword: true,
                ),
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
      return 'Please enter your email';
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter valid email address.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field cannot be empty.';
    }

    if (value.length < 7) {
      return 'Password must be at least 7 characters long.';
    }
    return null;
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      ref.read(signInControllerProvider.notifier).signIn(_emailController.text, _passwordController.text);
    }
  }
}
