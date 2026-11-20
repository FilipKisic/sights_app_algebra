import 'package:sights_app/data/client/places_api_client.dart';
import 'package:sights_app/data/db/database_manager.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlacesApiClient _apiClient;
  final DatabaseManager _databaseManager;

  PlaceRepositoryImpl(this._apiClient, this._databaseManager);

  @override
  Future<Result<List<Place>>> getAll() async {
    final favorites = _databaseManager.getAllFavorites();
    print("Is empty: ${favorites.isEmpty}");
    try {
      final places = await _apiClient.getAll();
      places.forEach((place) => place.isFavorite = favorites.contains(place));
      return Result.ok(places);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  void removeFromFavorites(Place place) {
    print('Removed as favorite: ${place.title}');
    _databaseManager.removeFromFavorites(place);
  }

  @override
  void setAsFavorite(Place place) {
    print('Set as favorite: ${place.title}');
    _databaseManager.setAsFavorite(place);
  }
}
