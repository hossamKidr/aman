import 'package:aman_app/core/constants/app_strings.dart';
import 'package:aman_app/core/router/routse_name.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/core/ui_manager/svg_icons.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui_manager/app_colors.dart';
import '../../../../../core/ui_manager/app_size/app_font_size.dart';
import '../../../../../core/ui_manager/font_manager/font_style.dart';
import '../../widgets/add_item_button_widget.dart';
import '../../widgets/date_time_widget.dart';
import '../../widgets/item_in_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  height: AppHeight.h250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(
                        AppRadius.r300,
                        AppRadius.r50,
                      ),
                      bottomRight: Radius.elliptical(
                        AppRadius.r300,
                        AppRadius.r50,
                      ),
                    ),
                    color: AppColors.primary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'تاريخ اليوم :',
                            style: getLightStyle(
                              color: AppColors.white,
                              fontSize: AppFontSize.f14,
                            ),
                          ),
                          DateTimeWidget(),
                        ],
                      ),
                      AddItemButtonWidget(
                        onPressed: (){
                          Navigator.pushNamed(context, RoutesName.inputUser);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.all(AppPadding.p20),
                    crossAxisSpacing: AppSize.s15,
                    mainAxisSpacing: AppSize.s15,
                    crossAxisCount: 2,
                    children: [
                      ItemInCardWidget(
                        iconPath: SvgIcons.reportIcon,
                        title: AppStrings.report,
                        containerColor: AppColors.primary,
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutesName.report,
                        ),
                      ),
                      ItemInCardWidget(
                        iconPath: SvgIcons.searchIcon,
                        title: AppStrings.search,
                        containerColor: AppColors.tile,
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutesName.search,
                        ),
                      ),
                      ItemInCardWidget(
                        iconPath: SvgIcons.settingsIcon,
                        title: AppStrings.setting,
                        containerColor: AppColors.green,
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutesName.setting,
                        ),
                      ),
                      ItemInCardWidget(
                        iconPath: SvgIcons.stikerIcon,
                        title: AppStrings.home,
                        containerColor: AppColors.darkBlu,
                        onTap: () => Navigator.pushNamed(
                          context,
                          RoutesName.home,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
