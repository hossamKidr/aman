import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/ui_manager/app_colors.dart';
import '../../../../core/ui_manager/app_size/app_height.dart';
import '../../../../core/ui_manager/app_size/app_width.dart';
import '../../../../core/ui_manager/font_manager/font_style.dart';
import '../../../../core/ui_manager/svg_icons.dart';

class AddItemButtonWidget extends StatelessWidget {
  final void Function()? onPressed;

  const AddItemButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r8),
          )),
          backgroundColor: MaterialStatePropertyAll(AppColors.white),
          maximumSize: MaterialStatePropertyAll(
            Size.fromWidth(AppWidth.w170),
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            AppStrings.addElement,
            style: getMediumStyle(color: AppColors.primary),
          ),
          SvgPicture.asset(
            SvgIcons.addIcon,
            height: AppHeight.h25,
          )
        ],
      ),
    );
  }
}
