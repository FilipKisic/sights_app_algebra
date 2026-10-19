import 'package:riverpod/riverpod.dart';
import 'package:sights_app/data/client/auth_client.dart';
import 'package:sights_app/data/repository/auth_repository_impl.dart';
import 'package:sights_app/domain/repository/auth_repository.dart';

final authClientProvider = Provider<AuthClient>((ref) => AuthClient());

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authClientProvider)),
);
