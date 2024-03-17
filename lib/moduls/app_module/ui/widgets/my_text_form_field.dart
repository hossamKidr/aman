import 'package:flutter/material.dart';

import '../../../../core/ui_manager/app_colors.dart';
import '../../../../core/ui_manager/app_size/app_font_size.dart';
import '../../../../core/ui_manager/font_manager/font_style.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: hintText,
        labelStyle: getLightStyle(
          color: AppColors.gray,
          fontSize: AppFontSize.f10,
        )
      ),
    );
  }
}
