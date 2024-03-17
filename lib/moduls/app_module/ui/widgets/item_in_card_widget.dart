import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui_manager/app_colors.dart';
import '../../../../core/ui_manager/app_size/app_font_size.dart';
import '../../../../core/ui_manager/app_size/app_height.dart';
import '../../../../core/ui_manager/app_size/app_padding.dart';
import '../../../../core/ui_manager/app_size/app_radius.dart';
import '../../../../core/ui_manager/app_size/app_width.dart';
import '../../../../core/ui_manager/font_manager/font_style.dart';

class ItemInCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color containerColor;
  final void Function()? onTap;

  const ItemInCardWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.containerColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white.withOpacity(1.0),
      child: SizedBox(
        height: AppHeight.h80,
        width: AppWidth.w80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(AppPadding.p10),
                height: AppHeight.h52,
                width: AppWidth.w52,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(AppRadius.r12)),
                child: SvgPicture.asset(
                  iconPath,
                  color: AppColors.white,
                ),
              ),
            ),
            Text(
              title,
              style: getBoldStyle(
                color: AppColors.black,
                fontSize: AppFontSize.f14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}