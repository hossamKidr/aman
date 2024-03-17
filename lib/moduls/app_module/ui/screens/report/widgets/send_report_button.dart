import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_width.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';

class SendReportButton extends StatelessWidget {
  final void Function()? onPressed;

  const SendReportButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h52,
      width: AppWidth.w170,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'تاكيد',
              style: getMediumStyle(
                  color: AppColors.white, fontSize: AppFontSize.f14),
            ),
            Icon(
              Icons.done,
              size: AppSize.s25,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
