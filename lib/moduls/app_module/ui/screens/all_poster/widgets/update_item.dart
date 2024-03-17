import 'package:aman_app/core/extensions/extensions.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_width.dart';
import 'package:aman_app/di.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/functions/app_functions.dart';
import '../../../../../../core/ui_manager/app_colors.dart';
import '../../../../../../core/ui_manager/app_size/app_font_size.dart';
import '../../../../../../core/ui_manager/app_size/app_height.dart';
import '../../../../../../core/ui_manager/app_size/app_size.dart';
import '../../../../../../core/ui_manager/font_manager/font_style.dart';
import '../../../../data/models/poster_model.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/my_text_form_field.dart';
import '../../input_user/widgets/car_type_widget.dart';
import '../../input_user/widgets/number_of_car_widget.dart';

class UpdateItemScreen extends StatelessWidget {
  final int index;
  final PosterModel poster;

  final TextEditingController characterController1;

  final TextEditingController characterController2;

  final TextEditingController characterController3;

  final TextEditingController numberOfCarController;

  final TextEditingController surrealThePosterController;

  final TextEditingController clintPhoneController;

  const UpdateItemScreen({
    super.key,
    required this.index,
    required this.poster,
    required this.characterController1,
    required this.characterController2,
    required this.characterController3,
    required this.numberOfCarController,
    required this.surrealThePosterController,
    required this.clintPhoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state.mainStatus.isUpdeatPosterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                AppFunctions.posterUpdated(),
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                return Container(
                  width: AppWidth.w300,
                  height: AppHeight.h500,
                  padding: EdgeInsets.all(AppPadding.p12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r20),
                    color: AppColors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: MyText(text: AppStrings.numberOfCar),
                        ),
                        NumberOfCar(
                          characterController1: characterController1,
                          characterController2: characterController2,
                          characterController3: characterController3,
                          numberOfCarController: numberOfCarController,
                        ),
                        Gap(AppSize.s15),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: MyText(text: AppStrings.typeOfCar),
                        ),
                        CarTypeWidget(
                          carType: state.carType,
                          onChanged: (value) {
                            context.read<HomeCubit>().chaneCarType(
                                value: value);
                          },
                        ),


                        Gap(AppSize.s15),
                        MyTextFormField(
                          controller: surrealThePosterController,
                          hintText: AppStrings.surrealThePoster,
                          keyboardType: TextInputType.phone,
                          validator: (value) {},
                        ),
                        Gap(AppSize.s15),
                        MyTextFormField(
                          controller: clintPhoneController,
                          hintText: AppStrings.clintPhone,
                          keyboardType: TextInputType.phone,
                          validator: (value) {},
                        ),
                        Gap(AppSize.s15),
                        SizedBox(
                          width: double.infinity,
                          height: AppHeight.h52,
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<HomeCubit>()
                                  .updatePoster(poster: poster, index: index);
                              Navigator.pop(context);
                            },
                            child: Text(
                              AppStrings.updateElement,
                              style: getMediumStyle(
                                color: AppColors.white,
                                fontSize: AppFontSize.f14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
