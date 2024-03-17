import 'package:aman_app/core/constants/constants.dart';
import 'package:aman_app/moduls/app_module/data/data_source/data_source.dart';
import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';
import 'package:hive/hive.dart';

class LocalDataSourceImpl implements AppDataSource {
  Box<PosterModel> box = Hive.box(Constants.boxName);

  @override
  Future<void> addPoster(PosterModel poster) async {
    await box.add(poster);
    print(' poster added to local db');
  }

  @override
  Future<void> deletePoster(int index) async {
    await box.deleteAt(index);
    print(' poster deleted to local db');
  }

  @override
  List<PosterModel> getPoster() {
    print(' poster get to local db');
    List<PosterModel> poster = box.values.toList();
    print(' poster get to local db ${poster.length}');
    print(' poster get to local db ${poster[0].clintPhone}');
    return poster;
  }

  @override
  Future<void> updatePoster(int index, PosterModel poster) async {
    await box.putAt(index, poster);
    print(' poster updated to local db');
  }
}
