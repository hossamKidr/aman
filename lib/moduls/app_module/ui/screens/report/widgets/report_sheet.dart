import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:aman_app/core/ui_manager/app_size/app_font_size.dart';
import 'package:aman_app/core/ui_manager/app_size/app_height.dart';
import 'package:aman_app/core/ui_manager/app_size/app_margin.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_radius.dart';
import 'package:aman_app/core/ui_manager/app_size/app_width.dart';
import 'package:aman_app/core/ui_manager/font_manager/font_style.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/widgets/build_divider.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/widgets/report_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportSheet extends StatelessWidget {
  final List<Widget> texts;

  const ReportSheet({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p10),
      alignment: AlignmentDirectional.center,
      width: AppWidth.w300,
      height: AppHeight.h400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Text(
            'التقرير',
            style: getBoldStyle(
              color: AppColors.black,
              fontSize: AppFontSize.f16,
            ),
          ),
          BuildDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: texts,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('اسم المحافظه'),
                  Text('اسم الوحده'),
                  Text('اسم الموظف'),
                  Text('وقت الحضور'),
                  Text('وقت الانصراف'),
                  Text('تفعيل'),
                  Text('تسليم'),
                  Text('لم يتم تسليم'),
                  Text('عدد السيارات'),
                  Text('عدد الدراجه النارريه'),
                  Text('عدد التوكتوك'),
                  Text('بداية السيريال'),
                  Text('نهاية السيريال'),
                  Text('الاجمالي'),

                ],
              ),


            ],
          ),
        ],
      ),
    );
  }
}
