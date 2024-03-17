import 'package:aman_app/aman_app.dart';
import 'package:aman_app/di.dart';
import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';
import 'package:aman_app/moduls/app_module/data/models/poster_type_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/constants/constants.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDi();
  await ScreenUtil.ensureScreenSize();
  Hive.registerAdapter(PosterTypeAdapter());
 await Hive.openBox<PosterModel>(Constants.boxName);

  runApp(const ProviderScope(child: AmanApp()));
}


