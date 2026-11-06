import 'package:sights_app/domain/model/place.dart';

sealed class PlaceListState {}

final class LoadingState extends PlaceListState {}

final class EmptyState extends PlaceListState {}

final class LoadedState extends PlaceListState {
  final List<Place> places;

  LoadedState(this.places);
}

final class ErrorState extends PlaceListState {
  final Exception error;

  ErrorState(this.error);
}
