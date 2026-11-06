import 'package:flutter/material.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/style/app_colors.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(place.imageUrl!, width: 125, height: 100, fit: .cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  place.title,
                  style: AppTextStyles.cardTitle,
                  overflow: .ellipsis,
                ),
                Text(
                  place.address ?? 'No address',
                  style: AppTextStyles.cardSubtitle,
                  overflow: .ellipsis,
                ),
                Text(
                  '${place.lat}, ${place.lng}',
                  style: AppTextStyles.cardContent,
                  overflow: .ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.favorite_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
