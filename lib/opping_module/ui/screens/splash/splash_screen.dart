import 'package:aman_app/core/router/routse_name.dart';
import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_width.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
       Navigator.pushReplacementNamed(context, RoutesName.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: AppRadius.r65,
                backgroundColor: AppColors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'a',
                        style: getBoldStyle(
                            color: AppColors.primary, fontSize: AppFontSize.f36),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'م',
                        style: getBoldStyle(
                            color: AppColors.primary, fontSize: AppFontSize.f30),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'a',
                        style: getBoldStyle(
                            color: AppColors.primary, fontSize: AppFontSize.f36),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'ن',
                        style: getBoldStyle(
                            color: AppColors.primary, fontSize: AppFontSize.f30),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'الملصق',
                      style: getBoldStyle(
                          color: AppColors.primary, fontSize: AppFontSize.f18),
                    ),
                  ),
                  Gap(AppSize.s10),
                  RichText(
                    text: TextSpan(
                      text: 'الالكتروني',
                      style: getBoldStyle(
                          color: AppColors.black, fontSize: AppFontSize.f16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
