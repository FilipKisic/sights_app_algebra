import 'package:firebase_auth/firebase_auth.dart';
import 'package:sights_app/domain/model/result.dart';

abstract interface class AuthRepository {
  Future<Result<User>> signIn(String email, String password);
}