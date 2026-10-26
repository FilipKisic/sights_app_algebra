import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/auth_repository.dart';
import 'package:sights_app/presentation/authentication/sign_in/controller/state/sign_in_state.dart';

class SignInController extends Notifier<SignInState> {
  late final AuthRepository _authRepository;

  @override
  SignInState build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return InitialState();
  }

  void signIn(String email, String password) async {
    state = LoadingState();

    await Future.delayed(const Duration(seconds: 2));
    final result = await _authRepository.signIn(email, password);

    switch (result) {
      case Ok<User>():
        state = AuthenticatedState(result.value);
      case Error<User>():
        state = ErrorState(result.error);
    }
  }
}
