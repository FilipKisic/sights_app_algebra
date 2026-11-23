import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_main_button.dart';
import 'package:sights_app/presentation/places/list/widget/rating_stars.dart';
import 'package:sights_app/presentation/style/app_colors.dart';
import 'package:sights_app/presentation/style/text_styles.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(place.imageUrl, height: screenSize.height * 0.40, fit: .cover),
                Container(
                  margin: .only(top: screenSize.height * 0.35),
                  height: screenSize.height * 0.60,
                  decoration: BoxDecoration(color: AppColors.backgroundColor, borderRadius: .circular(20)),
                  child: Padding(
                    padding: const .all(20),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(place.title, style: AppTextStyles.detailsTitle),
                        const SizedBox(height: 5),
                        Text(place.address, style: AppTextStyles.detailsAddress),
                        const SizedBox(height: 10),
                        Text('Rating', style: AppTextStyles.detailsRating),
                        RatingStars(rating: place.rating, activeColor: AppColors.secondaryColor, size: 28),
                        const SizedBox(height: 30),
                        Text(place.description, style: AppTextStyles.detailsDescription),
                        Spacer(),
                        DecoratedMainButton(label: 'Show on maps', onPressed: _openInMaps),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.32,
                  right: 40,
                  child: IconButton.filled(
                    icon: Icon(Icons.favorite_rounded, color: Colors.white),
                    onPressed: () {},
                    iconSize: 32,
                    padding: .all(10),
                    style: IconButton.styleFrom(backgroundColor: AppColors.secondaryColor),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton.filled(
                    icon: Icon(Icons.chevron_left_rounded, color: AppColors.primaryColor),
                    onPressed: () => Navigator.of(context).pop(),
                    iconSize: 32,
                    padding: .all(10),
                    style: IconButton.styleFrom(backgroundColor: AppColors.backgroundColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openInMaps() async => await MapLauncher.marker(.coords(place.lat, place.lng, title: place.title)).show();
}
