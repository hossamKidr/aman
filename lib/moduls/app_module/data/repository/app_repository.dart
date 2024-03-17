import 'package:aman_app/moduls/app_module/data/data_source/data_source.dart';

import '../models/poster_model.dart';

class AppRepository {
  final AppDataSource _appDataSource;

  const AppRepository(this._appDataSource);

  List<PosterModel> getPoster()  {
    return _appDataSource.getPoster();
  }

  Future<void> addPoster(
    PosterModel poster,
  ) async {
    await _appDataSource.addPoster(
      poster,
    );
  }

  Future<void> updatePoster(
    int index,
    PosterModel poster,
  ) async {
    await _appDataSource.updatePoster(
      index,
      poster,
    );
  }

  Future<void> deletePoster(
    int index,
  ) async {
    await _appDataSource.deletePoster(
      index,
    );
  }
}
