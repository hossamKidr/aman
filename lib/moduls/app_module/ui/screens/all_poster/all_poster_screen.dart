import 'package:aman_app/core/enums/main_enum.dart';
import 'package:aman_app/core/extensions/extensions.dart';
import 'package:aman_app/core/functions/app_functions.dart';
import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_width.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:aman_app/core/ui_manager/svg_icons.dart';
import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';

import 'package:aman_app/moduls/app_module/ui/screens/all_poster/widgets/poster_item_in_list.dart';
import 'package:aman_app/core/ui_manager/png_icons.dart';
import 'package:aman_app/moduls/app_module/ui/screens/all_poster/widgets/update_item.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllPosterScreen extends StatefulWidget {
  const AllPosterScreen({super.key});

  @override
  State<AllPosterScreen> createState() => _AllPosterScreenState();
}

class _AllPosterScreenState extends State<AllPosterScreen> {
  var characterController1 = TextEditingController();
  var characterController2 = TextEditingController();
  var characterController3 = TextEditingController();
  var numberOfCarController = TextEditingController();
  var surrealThePosterController = TextEditingController();
  var clintPhoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getAllPosters();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            /* if (state.mainStatus.isGetAllPosterLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const BuildPopUpLoadingState();
                });
          }*/
            if (state.mainStatus.isDeletePosterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                AppFunctions.posterDeleted(),
              );
            }

          },
          builder: (context, state) {
            return BlocBuilder<HomeCubit, HomeStates>(builder: (
              context,
              state,
            ) {
              if (state.mainStatus.isGetAllPosterLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.posters!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        PngIcons.emptyBox,
                        color: AppColors.primary,
                        height: AppHeight.h52,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'لا يوجد ملصقات',
                        style: getMediumStyle(
                          color: AppColors.gray,
                          fontSize: AppFontSize.f14,
                        ),
                      )
                    ],
                  ),
                );
              }
              if (state.mainStatus.isGetAllPosterSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.posters!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        crossAxisEndOffset: 0.3,
                        direction: DismissDirection.horizontal,
                        // dragStartBehavior: DragStartBehavior.start,
                        resizeDuration: const Duration(milliseconds: 400),
                        background: Container(
                            height: AppHeight.h25,
                            width: AppWidth.w20,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r20),
                              color: AppColors.delete,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(AppPadding.p30)),
                                SvgPicture.asset(
                                  SvgIcons.deleteIcon,
                                  color: AppColors.white,
                                  height: AppHeight.h25,
                                ),
                              ],
                            )),
                        secondaryBackground: Container(
                            height: AppHeight.h25,
                            width: AppWidth.w20,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r20),
                              color: AppColors.updeat,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(AppPadding.p30)),
                                SvgPicture.asset(
                                  SvgIcons.editIcon,
                                  color: AppColors.white,
                                  height: AppHeight.h25,
                                ),
                              ],
                            )),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            setState(() {
                              context.read<HomeCubit>().deletePoster(index);
                            });
                          }
                          if (direction == DismissDirection.endToStart) {

                              setState(() {
                                showDialog(
                                  useSafeArea: true,
                                  context: context,
                                  builder: (
                                      context,
                                      ) =>
                                      Dialog(
                                          child: UpdateItemScreen(
                                              characterController1:
                                              characterController1,
                                              characterController2:
                                              characterController2,
                                              characterController3:
                                              characterController3,
                                              numberOfCarController:
                                              numberOfCarController,
                                              surrealThePosterController:
                                              surrealThePosterController,
                                              clintPhoneController:
                                              clintPhoneController,
                                              index: index,
                                              poster: PosterModel(
                                                  character1:
                                                  characterController1.text,
                                                  character2:
                                                  characterController2.text,
                                                  character3:
                                                  characterController3.text,
                                                  numberOfCar:
                                                  numberOfCarController
                                                      .text,
                                                  carType: state.carType,
                                                  surrealThePoster:
                                                  surrealThePosterController
                                                      .text,
                                                  clintPhone:
                                                  clintPhoneController
                                                      .text))),
                                );
                              });


                          }
                        },
                        key: UniqueKey(),
                        child: PosterItemInList(
                          index: index,
                          carNumber: state.posters![index].numberOfCar,
                          char1: state.posters![index].character1,
                          char2: state.posters![index].character2,
                          char3: state.posters![index].character3,
                          clintPhoneNumber: state.posters![index].clintPhone,
                          searulNumber:
                              state.posters![index].surrealThePoster.toString(),
                          carType: state.posters![index].carType,
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            });
          },
        ),
      ),
    );
  }
}
