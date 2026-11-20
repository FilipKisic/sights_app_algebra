import 'package:sights_app/domain/model/place.dart';

abstract interface class DatabaseManager {
  List<Place> getAllFavorites();
  void setAsFavorite(Place place);
  void removeFromFavorites(Place place);
}