import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sights_app/domain/model/place.dart';

part 'places_api_client.g.dart';

@RestApi(baseUrl: 'http://144.91.87.48:8080/sight')
abstract class PlacesApiClient {
  factory PlacesApiClient(Dio dio, {String baseUrl}) = _PlacesApiClient;

  @GET('/all')
  Future<List<Place>> getAll();
}
