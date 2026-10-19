import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  Future<User?> signIn(String email, String password) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }
}
