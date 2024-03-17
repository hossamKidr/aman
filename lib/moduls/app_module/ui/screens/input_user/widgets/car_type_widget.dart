import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:aman_app/core/ui_manager/svg_icons.dart';
import 'package:aman_app/di.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/ui_manager/app_size/app_font_size.dart';
import '../../../../../../core/ui_manager/app_size/app_padding.dart';

class CarTypeWidget extends StatefulWidget {
final String carType;
final void Function(String?)? onChanged;

  const CarTypeWidget({super.key, required this.carType, this.onChanged, });

  @override
  State<CarTypeWidget> createState() => _CarTypeWidgetState();
}

class _CarTypeWidgetState extends State<CarTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppRadius.r20),
            ),
            width: double.infinity,
            height: AppHeight.h56,
            child: DropdownButton(
              style: getBoldStyle(
                color: AppColors.black,
                fontSize: AppFontSize.f14,
              ),
              elevation: 0,
              value: widget.carType,
              alignment: Alignment.center,
              dropdownColor: AppColors.primary,
              borderRadius: BorderRadius.circular(AppRadius.r20),
              padding: EdgeInsets.all(AppPadding.p10),
              icon: SvgPicture.asset(
                SvgIcons.carIcon,
                color: AppColors.black,
                height: AppSize.s30,
              ),
              underline: const SizedBox.shrink(),
              menuMaxHeight: AppHeight.h126,
              disabledHint: Text('data'),
              items: state.items.toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
             onChanged: widget.onChanged,
            ),
          );
        },
      ),
    );
  }
}
