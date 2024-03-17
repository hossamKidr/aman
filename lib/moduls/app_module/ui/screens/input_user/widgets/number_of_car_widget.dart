import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/ui_manager/app_size/app_font_size.dart';

class NumberOfCar extends StatelessWidget {
  final TextEditingController characterController1;
  final TextEditingController characterController2;
  final TextEditingController characterController3;
  final TextEditingController numberOfCarController;

  const NumberOfCar({
    super.key,
    required this.characterController1,
    required this.characterController2,
    required this.characterController3,
    required this.numberOfCarController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextFormField(
                  controller: characterController1,
                  cursorColor: AppColors.black,
                  keyboardType: TextInputType.text,

                  textAlign: TextAlign.center,
                  style: getLightStyle(
                      color: AppColors.black, fontSize: AppFontSize.f14),
                  onChanged: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
              Gap(AppSize.s15),
              Expanded(
                child: TextFormField(
                  controller: characterController2,
                  cursorColor: AppColors.black,
                  keyboardType: TextInputType.text,

                  textAlign: TextAlign.center,
                  style: getLightStyle(
                      color: AppColors.black, fontSize: AppFontSize.f14),
                  onChanged: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
              Gap(AppSize.s15),
              Expanded(
                child: TextFormField(
                  controller: characterController3,
                  cursorColor: AppColors.black,
                  keyboardType: TextInputType.text,

                  textAlign: TextAlign.center,
                  style: getLightStyle(
                      color: AppColors.black, fontSize: AppFontSize.f14),
                  onChanged: (value) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        Gap(AppSize.s15),
        Expanded(
          child: TextFormField(
            controller: numberOfCarController,
            cursorColor: AppColors.black,

            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            style:
                getLightStyle(color: AppColors.black, fontSize: AppFontSize.f14)
                    .copyWith(height: 1.5),
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
