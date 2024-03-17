import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';

abstract class AppDataSource{
 List<PosterModel> getPoster();
 Future<void> addPoster(PosterModel poster);
 Future<void> updatePoster(int index, PosterModel poster);
 Future<void> deletePoster(int index);
}