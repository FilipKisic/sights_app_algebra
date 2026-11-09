import 'package:sights_app/domain/model/place.dart';

sealed class PlaceListState {}

final class LoadingState extends PlaceListState {}

final class EmptyState extends PlaceListState {}

final class SuccessState extends PlaceListState {
  final List<Place> placeList;

  SuccessState(this.placeList);
}

final class ErrorState extends PlaceListState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}