import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final Color activeColor;
  final Color inactiveColor;
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rating,
          (index) => Icon(
            Icons.star,
            color: activeColor,
            size: size,
          ),
        ),
        ...List.generate(
          5 - rating,
          (index) => Icon(
            Icons.star,
            color: inactiveColor,
            size: size,
          ),
        ),
      ],
    );
  }
}
