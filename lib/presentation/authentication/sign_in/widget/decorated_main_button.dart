import 'package:flutter/material.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';

class DecoratedMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  const DecoratedMainButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 10, vertical: 5),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFD17438),
            Color(0xFF9D2C56),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(label, style: AppTextStyles.mainButton),
      ),
    );
  }
}
