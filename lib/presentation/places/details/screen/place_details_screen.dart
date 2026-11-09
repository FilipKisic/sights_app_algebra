import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/authentication/sign_in/widget/decorated_main_button.dart';
import 'package:sights_app/presentation/places/widget/rating_stars.dart';
import 'package:sights_app/presentation/style/app_colors.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: height * 0.4,
            child: Image.network(
              place.imageUrl!,
              errorBuilder: (context, _, _) {
                return Text('There was an error');
              },
              fit: .cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: height * 0.37),
              Container(
                width: double.maxFinite,
                height: height * 0.63,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const SizedBox(height: 10),
                    FittedBox(
                      fit: .fitWidth,
                      child: Text(place.title, style: AppTextStyles.detailsTitle),
                    ),
                    const SizedBox(height: 5),
                    FittedBox(
                      fit: .fitWidth,
                      child: Text(place.address ?? 'No address', style: AppTextStyles.detailsSubtitle),
                    ),
                    const SizedBox(height: 20),
                    Text('Rating', style: AppTextStyles.detailsRating),
                    RatingStars(
                      rating: place.rating,
                      size: 28,
                      activeColor: AppColors.secondaryColor,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      place.description ?? 'No description',
                      style: AppTextStyles.detailsDescription,
                      textAlign: .justify,
                    ),
                    Spacer(),
                    SafeArea(
                      child: DecoratedMainButton(
                        label: 'Show in maps',
                        onPressed: () => _openInBrowser(place),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: height * 0.34,
            right: 50,
            child: IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.favorite_rounded),
              iconSize: 32,
              style: IconButton.styleFrom(
                padding: .all(10),
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            child: IconButton.filled(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.chevron_left_rounded),
              iconSize: 32,
              style: IconButton.styleFrom(
                padding: .all(10),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openInBrowser(Place place) => MapLauncher.marker(.coords(place.lat, place.lng, title: place.title)).show();
}
