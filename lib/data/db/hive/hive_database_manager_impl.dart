import 'package:hive_ce/hive.dart';
import 'package:sights_app/data/db/database_manager.dart';
import 'package:sights_app/data/db/hive/hive_adapters.dart';
import 'package:sights_app/domain/model/place.dart';

class HiveDatabaseManagerImpl implements DatabaseManager {
  @override
  List<Place> getAllFavorites() {
    final placesBox = Hive.box(placeBoxName);
    return placesBox.values.cast<Place>().toList();
  }

  @override
  void removeFromFavorites(Place place) {
    final placesBox = Hive.box(placeBoxName);
    placesBox.delete(place.id);
  }

  @override
  void setAsFavorite(Place place) {
    final placesBox = Hive.box(placeBoxName);
    placesBox.put(place.id, place);
  }
}
