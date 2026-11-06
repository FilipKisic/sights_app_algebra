import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sights_app/data/client/auth_client.dart';
import 'package:sights_app/data/client/places_api_client.dart';
import 'package:sights_app/data/repository/auth_repository_impl.dart';
import 'package:sights_app/data/repository/place_repository_impl.dart';
import 'package:sights_app/domain/repository/auth_repository.dart';
import 'package:sights_app/domain/repository/place_repository.dart';
import 'package:sights_app/presentation/authentication/sign_in/controller/sign_in_controller.dart';
import 'package:sights_app/presentation/authentication/sign_in/controller/state/sign_in_state.dart';
import 'package:sights_app/presentation/places/place_list/controller/state/place_list_state.dart';

import 'presentation/places/place_list/controller/place_list_controller.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

// ******************** CLIENTS ******************** //
final authClientProvider = Provider<AuthClient>((ref) => AuthClient());
final placeClientProvider = Provider<PlacesApiClient>((ref) => PlacesApiClient(ref.watch(dioProvider)));

// ******************** REPOSITORIES ******************** //
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authClientProvider)),
);

final placeRepositoryProvider = Provider<PlaceRepository>(
  (ref) => PlaceRepositoryImpl(ref.watch(placeClientProvider)),
);

// ******************** CONTROLLERS ******************** //
final signInControllerProvider = NotifierProvider<SignInController, SignInState>(
  () => SignInController(),
);

final placeListControllerProvider = NotifierProvider<PlaceListController, PlaceListState>(
  () => PlaceListController(),
);
