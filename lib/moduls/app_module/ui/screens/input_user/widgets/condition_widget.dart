import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/ui_manager/app_colors.dart';
import '../../../../../../core/ui_manager/app_size/app_font_size.dart';
import '../../../../../../core/ui_manager/app_size/app_height.dart';
import '../../../../../../core/ui_manager/app_size/app_size.dart';
import '../../../../../../core/ui_manager/font_manager/font_style.dart';
import '../../../../../../core/ui_manager/svg_icons.dart';

class ConditionWidget extends StatelessWidget {
  final Color color;
  final String title;
  final TextStyle textStyle;

  const ConditionWidget({
    super.key,
    required this.color,
    required this.title,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          SvgIcons.doneIcon,
          color: color,
        ),
        Gap(AppSize.s15),
        Text(
          title,
          style:textStyle
        ),
      ],
    );
  }
}
