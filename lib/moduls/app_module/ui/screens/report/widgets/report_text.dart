import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';

class ReportText extends StatelessWidget {
  final String text;

  const ReportText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getBoldStyle(
        color: AppColors.black,
        fontSize: AppFontSize.f14,
      ),
    );
  }
}
