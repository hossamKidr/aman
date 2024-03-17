import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_width.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy/MM/dd ').format(dateTime);
    return Container(
      alignment: Alignment.center,
      width: AppWidth.w110,
      height: AppHeight.h25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r8),
        color: AppColors.white,
      ),
      child: Text(
        formattedDate,
        style: getBoldStyle(
          color: AppColors.black,
          fontSize: AppFontSize.f16,
        ),
      ),
    );
  }
}
