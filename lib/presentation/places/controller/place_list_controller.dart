import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/place_repository.dart';
import 'package:sights_app/presentation/places/controller/state/place_list_state.dart';

class PlaceListController extends Notifier<PlaceListState> {
  late final PlaceRepository _placeRepository;

  @override
  PlaceListState build() {
    _placeRepository = ref.read(placeRepositoryProvider);
    return LoadingState();
  }

  void getAllPlaces() async {
    state = LoadingState();

    final result = await _placeRepository.getAllPlaces();

    switch (result) {
      case Ok<List<Place>>():
        state = result.value.isEmpty ? EmptyState() : SuccessState(result.value);
      case Error<List<Place>>():
        state = ErrorState(result.error.toString());
     }
  }
}