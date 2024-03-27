import 'dart:io';
import 'dart:typed_data';

import 'package:aman_app/core/ui_manager/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

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


 static Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    String name = 'ScreenShot $time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['file path'];
  }
 static Future saveAndShare(Uint8List bytes)async{
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/ aman.png');
    image.writeAsBytesSync(bytes);
    await Share.shareXFiles([XFile(image.path)]);
  }
}