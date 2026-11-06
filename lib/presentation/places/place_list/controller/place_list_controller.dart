import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/place_repository.dart';
import 'package:sights_app/presentation/places/place_list/controller/state/place_list_state.dart';

class PlaceListController extends Notifier<PlaceListState> {
  late final PlaceRepository placeRepository;

  @override
  PlaceListState build() {
    placeRepository = ref.read(placeRepositoryProvider);
    loadPlaces();
    return LoadingState();
  }

  void loadPlaces() async {
    state = LoadingState();

    final result = await placeRepository.getAll();

    switch (result) {
      case Ok<List<Place>>():
        state = result.value.isEmpty ? EmptyState() : LoadedState(result.value);
      case Error<List<Place>>():
        state = ErrorState(result.error);
    }
  }
}
