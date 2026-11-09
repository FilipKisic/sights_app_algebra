import 'package:sights_app/data/client/places_http_client.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/domain/model/result.dart';
import 'package:sights_app/domain/repository/place_repository.dart';

class PlaceRepositoryImpl implements PlaceRepository {

  final PlacesHttpClient _client;

  PlaceRepositoryImpl(this._client);

  @override
  Future<Result<List<Place>>> getAllPlaces() async {
    try {
      final result = await _client.getAllPlaces();
      return Result.ok(result);
    } catch (e) {
      return Result.error(Exception('There was a network error.'));
    }
  }

}