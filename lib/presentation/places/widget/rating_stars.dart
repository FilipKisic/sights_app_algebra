import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(rating, (index) => const Icon(Icons.star, color: Colors.amber)),
        ...List.generate(5 - rating, (index) => const Icon(Icons.star, color: Colors.grey)),
      ],
    );
  }
}
