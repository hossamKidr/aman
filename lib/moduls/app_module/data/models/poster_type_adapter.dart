import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';
import 'package:hive/hive.dart';

class PosterTypeAdapter extends TypeAdapter<PosterModel> {
  @override
  PosterModel read(BinaryReader reader) {
    return PosterModel(
      character1: reader.readString(),
      character2: reader.readString(),
      character3: reader.readString(),
      numberOfCar: reader.readString(),
      carType: reader.readString(),
      clintPhone: reader.readString(),
      surrealThePoster: reader.readString(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, PosterModel obj) {
    writer.writeString(obj.character1);
    writer.writeString(obj.character2);
    writer.writeString(obj.character3);
    writer.writeString(obj.numberOfCar);
    writer.writeString(obj.carType);
    writer.writeString(obj.clintPhone);
    writer.writeString(obj.surrealThePoster);
  }
}
