import 'package:flutter/material.dart';
import 'package:sights_app/presentation/style/app_colors.dart';

class AppTextStyles {
  static final signInTitle = TextStyle(fontSize: 16, fontWeight: .bold);
  static final mainButton = TextStyle(color: Colors.white, fontWeight: .bold, fontSize: 18);
  static final standard = TextStyle(color: AppColors.textColor, fontSize: 16);
  static final stateTitle = TextStyle(fontSize: 18, fontWeight: .bold);
  static final title = TextStyle(fontSize: 32, fontWeight: .bold);

  static final cardTitle = TextStyle(fontSize: 16, fontWeight: .bold, color: Colors.white);
  static final cardSubtitle = TextStyle(fontSize: 14, fontWeight: .w600, color: Colors.white);
  static final cardContent = TextStyle(fontSize: 14, color: Colors.white);
}
