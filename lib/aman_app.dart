import 'package:aman_app/core/router/routse_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/route_generator.dart';
import 'core/ui_manager/theme/ligt_theme.dart';

class AmanApp extends StatefulWidget {
  const AmanApp({super.key});

  @override
  State<AmanApp> createState() => _AmanAppState();
}

class _AmanAppState extends State<AmanApp> {
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.splash,
          onGenerateRoute: RouteGenerator.getRoure,
          theme: getLightTheme(),

        );
      },
    );
  }
}
