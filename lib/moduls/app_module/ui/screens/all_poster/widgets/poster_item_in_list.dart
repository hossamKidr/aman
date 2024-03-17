import 'package:aman_app/core/extensions/extensions.dart';
import 'package:aman_app/core/router/routse_name.dart';
import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_margin.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/core/ui_manager/svg_icons.dart';
import 'package:aman_app/di.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/functions/app_functions.dart';
import 'delete_item.dart';

class PosterItemInList extends StatelessWidget {
  final String carNumber;
  final String char1;
  final String char2;
  final String char3;
  final String clintPhoneNumber;
  final String searulNumber;
  final String carType;
  final int index;

   PosterItemInList(
      {super.key,
      required this.carNumber,
      required this.char1,
      required this.char2,
      required this.char3,
      required this.clintPhoneNumber,
      required this.searulNumber,
      required this.carType,
      required this.index});
  TextEditingController characterController1 = TextEditingController();
  TextEditingController characterController2 = TextEditingController();
  TextEditingController characterController3 = TextEditingController();
  TextEditingController numberOfCarController = TextEditingController();
  TextEditingController surrealThePosterController = TextEditingController();
  TextEditingController clintPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocListener<HomeCubit, HomeStates>(
        listener: (context, state) {},
        child: SizedBox(
          width: double.infinity,
          height: AppHeight.h122,
          child: Card(
            margin: EdgeInsets.all(AppMargin.m5),
            shadowColor: AppColors.gray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r20),
            ),
            color: AppColors.gray.withOpacity(0.2),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
              child: Row(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رقم المركبه'),
                      Text('تليفون العميل'),
                      Text('رقم السريال'),
                      Text('نوع المركبه'),
                    ],
                  ),
                  Gap(AppSize.s20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(char1),
                          Gap(AppSize.s5),
                          Text(char2),
                          Gap(AppSize.s5),
                          Text(char3),
                          Gap(AppSize.s5),
                          Text(carNumber),
                        ],
                      ),
                      Text(clintPhoneNumber),
                      Text(searulNumber),
                      Text(carType),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
