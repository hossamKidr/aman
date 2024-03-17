
import 'package:aman_app/core/constants/app_strings.dart';
import 'package:aman_app/core/extensions/extensions.dart';
import 'package:aman_app/core/functions/app_functions.dart';
import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/input_user/widgets/car_type_widget.dart';
import 'package:aman_app/moduls/app_module/ui/screens/input_user/widgets/condition_widget.dart';
import 'package:aman_app/moduls/app_module/ui/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/ui_manager/app_size/app_size.dart';
import '../../widgets/my_text_form_field.dart';
import '../home/cubit/states.dart';
import 'widgets/number_of_car_widget.dart';

class InputUserScreen extends StatefulWidget {
  const InputUserScreen({super.key});

  @override
  State<InputUserScreen> createState() => _InputUserScreenState();
}

TextEditingController characterController1 = TextEditingController();
TextEditingController characterController2 = TextEditingController();
TextEditingController characterController3 = TextEditingController();
TextEditingController numberTheCarController = TextEditingController();
TextEditingController surrealThePosterController = TextEditingController();
TextEditingController clintPhoneController = TextEditingController();

class _InputUserScreenState extends State<InputUserScreen> {
  bool isCharacter1Valid = false;
  bool isCharacter2Valid = false;
  bool isCharacter3Valid = false;
  bool isNumberTheCarValid = false;
  bool isSurrealThePosterValid = false;
  bool isClintPhoneValid = false;

  void isCharacter1Done(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      isCharacter1Valid = true;
      setState(() {});
    }
    if (controller.text.isEmpty) {
      isCharacter1Valid = false;
      setState(() {});
    }
  }

  void isCharacter2Done(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      isCharacter2Valid = true;
      setState(() {});
    }
    if (controller.text.isEmpty) {
      isCharacter2Valid = false;
      setState(() {});
    }
  }

  void isCharacter3Done(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      isCharacter3Valid = true;
      setState(() {});
    }
    if (controller.text.isEmpty) {
      isCharacter3Valid = false;
      setState(() {});
    }
  }

  void isNumberOfCarDone(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      isNumberTheCarValid = true;
      setState(() {});
    }
    if (controller.text.isEmpty) {
      isNumberTheCarValid = false;
      setState(() {});
    }
  }

  void isSurrealThePosterDone(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      isSurrealThePosterValid = true;
      setState(() {});
    }
    if (controller.text.isEmpty) {
      isSurrealThePosterValid = false;
      setState(() {});
    }
  }

  void isClintPhoneDone(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      isClintPhoneValid = true;
      setState(() {});
    }
    if (controller.text.isEmpty) {
      isClintPhoneValid = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    characterController1.addListener(
      () {
        isCharacter1Done(characterController1);
      },
    );
    characterController2.addListener(
      () {
        isCharacter2Done(
          characterController2,
        );
      },
    );
    characterController3.addListener(
      () {
        isCharacter3Done(
          characterController3,
        );
      },
    );
    numberTheCarController.addListener(
      () {
        isNumberOfCarDone(
          numberTheCarController,
        );
      },
    );
    surrealThePosterController.addListener(
      () {
        isSurrealThePosterDone(
          surrealThePosterController,
        );
      },
    );
    clintPhoneController.addListener(
      () {
        isClintPhoneDone(
          clintPhoneController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //var cubit = BlocProvider.of<MainCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.appBarTitleInputScreen,
            style: getMediumStyle(
              color: AppColors.black,
              fontSize: AppFontSize.f14,
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Center(
              child: SingleChildScrollView(
                  child: BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {
                  if (state.mainStatus.isAddPosterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      AppFunctions.posterAdded(),
                    );
                    /* Navigator.pushReplacementNamed(
                          context,
                          RoutesName.main,
                        );*/
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: MyText(text: AppStrings.numberOfCar),
                      ),
                      NumberOfCar(
                        characterController1: characterController1,
                        characterController2: characterController2,
                        characterController3: characterController3,
                        numberOfCarController: numberTheCarController,
                      ),
                      Gap(AppSize.s15),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: MyText(text: AppStrings.typeOfCar),
                      ),
                      BlocBuilder<HomeCubit, HomeStates>(
                        builder: (context, state) {
                          return CarTypeWidget(
                            carType: state.carType,
                            onChanged: (value) {
                              context
                                  .read<HomeCubit>()
                                  .chaneCarType(value: value);
                            },
                          );
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
                        child: state.mainStatus.isAddPosterLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppRadius.r8),

                                  )
                              )
                          ),
                                onPressed: () {
                                  context.read<HomeCubit>().addPoster(
                                      PosterModel(
                                          character1: characterController1.text,
                                          character2: characterController2.text,
                                          character3: characterController3.text,
                                          numberOfCar:
                                              numberTheCarController.text,
                                          carType: state.carType,
                                          clintPhone: clintPhoneController.text,
                                          surrealThePoster:
                                              surrealThePosterController
                                                  .text));
                                },
                                child: Text(
                                  AppStrings.addElement,
                                  style: getMediumStyle(
                                    color: AppColors.white,
                                    fontSize: AppFontSize.f14,
                                  ),
                                ),
                              ),
                      ),
                      Gap(AppSize.s20),
                      Column(
                        children: [
                          ConditionWidget(
                            color: isCharacter1Valid == true
                                ? AppColors.green
                                : AppColors.gray,
                            title: 'الحرف الاول',
                            textStyle: getLightStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.f10,
                            ).copyWith(
                              decoration: isCharacter1Valid == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          ConditionWidget(
                            color: isCharacter2Valid == true
                                ? AppColors.green
                                : AppColors.gray,
                            title: 'الحرف الثاني',
                            textStyle: getLightStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.f10,
                            ).copyWith(
                              decoration: isCharacter2Valid == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          ConditionWidget(
                            color: isCharacter3Valid == true
                                ? AppColors.green
                                : AppColors.gray,
                            title: 'الحرف الثالث',
                            textStyle: getLightStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.f10,
                            ).copyWith(
                              decoration: isCharacter3Valid == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          ConditionWidget(
                            color: isNumberTheCarValid == true
                                ? AppColors.green
                                : AppColors.gray,
                            title: 'رقم المركبه',
                            textStyle: getLightStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.f10,
                            ).copyWith(
                              decoration: isNumberTheCarValid == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          ConditionWidget(
                            color: isSurrealThePosterValid == true
                                ? AppColors.green
                                : AppColors.gray,
                            title: 'رقم السيريال',
                            textStyle: getLightStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.f10,
                            ).copyWith(
                              decoration: isSurrealThePosterValid == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          ConditionWidget(
                            color: isClintPhoneValid == true
                                ? AppColors.green
                                : AppColors.gray,
                            title: 'تليفون العميل',
                            textStyle: getLightStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.f10,
                            ).copyWith(
                              decoration: isClintPhoneValid == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )),
            )),
      ),
    );
  }
}
