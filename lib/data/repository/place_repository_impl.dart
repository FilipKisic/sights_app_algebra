import 'package:sights_app/data/client/places_api_client.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlacesApiClient _apiClient;

  PlaceRepositoryImpl(this._apiClient);

  @override
  Future<Result<List<Place>>> getAll() async {
    try {
      final places = await _apiClient.getAll();
      return Result.ok(places);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
