import 'package:firebase_auth/firebase_auth.dart';
import 'package:sights_app/data/client/auth_client.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthClient _authClient;

  AuthRepositoryImpl(this._authClient);
  
  @override
  Future<Result<User>> signIn(String email, String password) async {
    try {
      final user = await _authClient.signIn(email, password);
      return Result.ok(user!);
    } on FirebaseAuthException catch (e) {
      return Result.error(Exception("FirebaseAuthException: ${e.message}"));
    } catch (e) {
      return Result.error(Exception("Unknown error: $e"));
    }
  }
}