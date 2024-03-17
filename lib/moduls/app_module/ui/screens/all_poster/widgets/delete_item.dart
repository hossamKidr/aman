import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/ui_manager/app_colors.dart';
import '../../../../../../core/ui_manager/app_size/app_height.dart';
import '../../../../../../core/ui_manager/app_size/app_radius.dart';
import '../../../../../../core/ui_manager/app_size/app_size.dart';
import '../../../../../../core/ui_manager/app_size/app_width.dart';
import '../../../../../../core/ui_manager/font_manager/font_style.dart';
import '../../../../../../di.dart';


class DeleteItem extends StatelessWidget {
  final int index;

  const DeleteItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, stat) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppRadius.r20,
                )),
            child: Container(
              width: AppWidth.w170,
              height: AppHeight.h122,
              decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(
                    AppRadius.r20,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'هل تريد حذف الملصق',
                    style: getLightStyle(color: AppColors.black),
                  ),
                  Gap(AppSize.s15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          context.read<HomeCubit>().deletePoster(index);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'خذف',
                          style: getBoldStyle(color: AppColors.black),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(AppColors.gray),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'الغاء',
                          style: getBoldStyle(color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}