import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/domain/model/result.dart';

abstract interface class PlaceRepository {
  Future<Result<List<Place>>> getAll();
  void setAsFavorite(Place place);
  void removeFromFavorites(Place place);
}
