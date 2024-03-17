import 'package:aman_app/moduls/app_module/data/data_source/data_source.dart';
import 'package:aman_app/moduls/app_module/data/repository/app_repository.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/cubit.dart';
import 'package:get_it/get_it.dart';

import 'moduls/app_module/data/data_source/local/local_data_source_impl.dart';

GetIt getIt = GetIt.instance;

Future<void> initDi() async {
  getIt.registerLazySingleton<AppDataSource>(
    () => LocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<AppRepository>(
    () => AppRepository(
      getIt.get<AppDataSource>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      appRepository: getIt(),
    ),
  );
}
