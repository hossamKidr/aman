import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui_manager/app_size/app_font_size.dart';

class MyText extends StatelessWidget {
  final String text;

  const MyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getLightStyle(
        color: AppColors.gray,
        fontSize: AppFontSize.f10,
      ),
      textAlign: TextAlign.center,
    );
  }
}
