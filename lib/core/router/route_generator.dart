import 'package:aman_app/core/router/routse_name.dart';
import 'package:aman_app/moduls/app_module/ui/screens/all_poster/all_poster_screen.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/home_screen.dart';
import 'package:aman_app/moduls/app_module/ui/screens/input_user/input_user_screen.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/report_screen.dart';
import 'package:aman_app/moduls/app_module/ui/screens/search/search_screen.dart';
import 'package:aman_app/moduls/app_module/ui/screens/settings/settings_screen.dart';
import 'package:aman_app/opping_module/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../constants/app_strings.dart';

class RouteGenerator {
  static Route getRoure(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case RoutesName.main:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const HomeScreen(),
              ),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const AllPosterScreen(),
              ),
        );
      case RoutesName.setting:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const SettingScreen(),
              ),
        );
      case RoutesName.search:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const SearchScreen(),
              ),
        );
      case RoutesName.report:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child:  ReportScreen(),
              ),
        );
      case RoutesName.inputUser:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (_) => getIt<HomeCubit>(),
                child: const InputUserScreen(),
              ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: Text(
                  AppStrings.unDefinedRoute,
                ),
              ),
              body: Center(
                child: Text(
                  AppStrings.unDefinedRoute,
                ),
              ),
            ));
  }
}
