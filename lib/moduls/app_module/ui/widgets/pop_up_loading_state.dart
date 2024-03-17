import 'package:flutter/material.dart';

import '../../../../core/ui_manager/app_colors.dart';
import '../../../../core/ui_manager/app_size/app_height.dart';
import '../../../../core/ui_manager/app_size/app_radius.dart';
import '../../../../core/ui_manager/app_size/app_width.dart';

class BuildPopUpLoadingState extends StatelessWidget {
  const BuildPopUpLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: AppWidth.w52,
        height: AppHeight.h52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(AppRadius.r20),
        ),
        child: CircularProgressIndicator(
          backgroundColor: AppColors.primary,
        ),
      ),
    );
  }
}