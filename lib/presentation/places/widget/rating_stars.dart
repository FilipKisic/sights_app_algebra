import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 24.0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rating,
          (index) => Icon(
            Icons.star_rounded,
            color: activeColor,
            size: size,
          ),
        ),
        ...List.generate(
          5 - rating,
          (index) => Icon(
            Icons.star_rounded,
            color: inactiveColor,
            size: size,
          ),
        ),
      ],
    );
  }
}
