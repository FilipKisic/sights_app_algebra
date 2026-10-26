import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/repository/place_repository.dart';
import 'package:sights_app/presentation/places/controller/state/place_list_state.dart';

class PlaceListController extends Notifier<PlaceListState> {
  late final PlaceRepository placeRepository;

  @override
  PlaceListState build() {
    placeRepository = ref.read(placeRepositoryProvider);
    return LoadingState();
  }

  void loadPlaces() async {}
}
