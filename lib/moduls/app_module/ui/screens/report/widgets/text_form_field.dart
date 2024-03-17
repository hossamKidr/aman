import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;

  const BuildTextFormField({
    super.key,
    required this.labelText,
    required this.validator,
    this.keyboardType,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: getLightStyle(
          color: AppColors.gray,
          fontSize: AppFontSize.f12,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p8),
      ),
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: AppColors.primary,
      controller: textEditingController,
    );
  }
}
