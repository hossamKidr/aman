import 'package:aman_app/core/constants/app_strings.dart';
import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:aman_app/core/ui_manager/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;

  const MyFloatingActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
child: SvgPicture.asset(SvgIcons.addIcon),
    );
  }
}
