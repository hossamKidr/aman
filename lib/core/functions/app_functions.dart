import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:flutter/material.dart';

import '../ui_manager/app_size/app_margin.dart';

class AppFunctions{
  static SnackBar posterAdded(){
    return SnackBar(
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(AppMargin.m20),
      behavior: SnackBarBehavior.floating,
      content: Text("تم تسجيل الملصق"),
    );
  }

  static SnackBar posterDeleted(){
    return SnackBar(
      backgroundColor: AppColors.delete,
      margin: EdgeInsets.all(AppMargin.m20),
      behavior: SnackBarBehavior.floating,
      content: Text("تم حذف الملصق"),
    );
  }

  static SnackBar posterUpdated(){
    return SnackBar(
      backgroundColor: AppColors.updeat,
      margin: EdgeInsets.all(AppMargin.m20),
      behavior: SnackBarBehavior.floating,
      content: Text("تم تعديل الملصق"),
    );
  }
}