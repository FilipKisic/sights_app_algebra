import 'package:flutter/material.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/places/list/widget/rating_stars.dart';
import 'package:sights_app/presentation/style/app_colors.dart';
import 'package:sights_app/presentation/style/text_styles.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: .all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(place.imageUrl, width: 140, height: 100, fit: .cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Text(place.title, style: AppTextStyles.cardTitle, overflow: .ellipsis),
                Text(place.address, style: AppTextStyles.cardSubtitle, overflow: .ellipsis),
                Text('${place.lat}, ${place.lng}', style: AppTextStyles.cardText),
                Spacer(),
                RatingStars(rating: place.rating)
              ],
            ),
          ),
          Icon(Icons.favorite_rounded, color: Colors.white),
        ],
      ),
    );
  }
}
