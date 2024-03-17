import 'package:aman_app/core/enums/main_enum.dart';

import '../../../../data/models/poster_model.dart';

class HomeStates {
  final MainStatus mainStatus;
  late int currentIndex;
  late bool char1isDone;
  late bool char2isDone;
  late bool isDone;
  late String carType;
  late List<String> items;
  String? message;
  List<PosterModel>? posters;

  HomeStates({
    this.mainStatus = MainStatus.initial,
    this.currentIndex = 0,
    this.message = '',
    this.char1isDone = false,
    this.char2isDone = false,
    this.isDone = false,
    this.posters = const [],
    this.carType = 'ملاكي',
    this.items = const [
      'اجره',
      'ملاكي',
      'نقل',
      'دراجه ناريه',
      'توكتوك',
      'حكومه'
    ],
  });

  HomeStates copyWith({
    MainStatus? mainStatus,
    int? currentIndex,
    bool? char1isDone = false,
    bool? char2isDone = false,
    bool? isDone = false,
    String? message = '',
    List<PosterModel>? posters,
    String? carType,
    List<String>? items,
  }) {
    return HomeStates(
      mainStatus: mainStatus ?? this.mainStatus,
      currentIndex: currentIndex ?? this.currentIndex,
      message: message ?? this.message,
      char1isDone: char1isDone ?? this.char1isDone,
      char2isDone: char2isDone ?? this.char2isDone,
      isDone: isDone ?? this.isDone,
      posters: posters ?? this.posters,
      carType: carType ?? this.carType,
      items: items ?? this.items,
    );
  }

  HomeStates.initial(
    this.mainStatus,
  );

  HomeStates.getAppPosterSuccess(
    this.mainStatus,
    List<PosterModel> this.posters,
  );

  HomeStates.getAllPosterLoading(
    this.mainStatus,
  );

  HomeStates.addPosterLoading(
    this.mainStatus,
  );

  HomeStates.addAllPosterSuccess(
    this.mainStatus,
  );

  HomeStates.deletePosterLoading(
    this.mainStatus,
  );

  HomeStates.deletePosterSuccess(
    this.mainStatus,
  );

  HomeStates.updeatPosterSuccess(
    this.mainStatus,
  );

  HomeStates.updeatPosterLoading(
    this.mainStatus,
  );

  HomeStates.error(
    String this.message,
    this.mainStatus,
  );

  HomeStates.carType(
    this.mainStatus,
    this.carType,
  );

  HomeStates.changeBottomNavBarItem({
    required this.mainStatus,
    required this.currentIndex,
  });

  HomeStates.isConditionDone({
    required this.mainStatus,
    required this.isDone,
  });
}
