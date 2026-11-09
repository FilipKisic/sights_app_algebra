import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  final int id;
  final String title;
  final String description;
  final String address;
  final double lat;
  final double lng;
  final int rating;
  final String imageUrl;

  Place(
    this.id,
    this.title,
    this.description,
    this.address,
    this.lat,
    this.lng,
    this.rating,
    this.imageUrl,
  );

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}