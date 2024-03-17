import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: AppColors.primary,
      height: AppSize.s5,
      endIndent: AppSize.s5,
      indent: AppSize.s5,
    );
  }
}
