import 'package:aman_app/moduls/app_module/data/models/poster_model.dart';
import 'package:aman_app/moduls/app_module/ui/screens/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/enums/main_enum.dart';
import '../../../../data/repository/app_repository.dart';

class HomeCubit extends Cubit<HomeStates> {
  final AppRepository appRepository;

  HomeCubit({required this.appRepository}) : super(HomeStates());

  void isConditionDone(
    TextEditingController controller,
  ) {
    if (controller.text.isNotEmpty) {
      state.isDone = true;
      emit(state.copyWith(
        mainStatus: MainStatus.isDone,
        isDone: true,
      ));
    }
    if (controller.text.isEmpty) {
      state.isDone = false;
      emit(
        state.copyWith(
          mainStatus: MainStatus.isDone,
          isDone: false,
        ),
      );
    }
  }

  void chaneCarType({String? value}) {
    state.carType = value!;
    emit(
      state.copyWith(carType: value, mainStatus: MainStatus.chaneCarType),
    );
  }

  void changeBottomNavBarItem(int currentIndex) {
    emit(state.copyWith(currentIndex: currentIndex));
  }

  void getAllPosters() async {
    emit(state.copyWith(mainStatus: MainStatus.getAllPosterLoading));
    var posters = state.posters?.toList();
    try {
      posters = appRepository.getPoster();
      emit(
        state.copyWith(
          mainStatus: MainStatus.getAllPosterSuccess,
          posters: posters,
        ),
      );
    } catch (e) {
      emit(state.copyWith(mainStatus: MainStatus.error));
    }
  }

  void addPoster(PosterModel poster) async {
    emit(state.copyWith(mainStatus: MainStatus.addPosterLoading));

    try {
      await appRepository.addPoster(poster);
      emit(state.copyWith(mainStatus: MainStatus.addPosterSuccess));
      // getAllPosters();
    } catch (e) {
      emit(state.copyWith(mainStatus: MainStatus.error));
    }
  }

  void updatePoster({required int index, required PosterModel poster}) async {
    emit(state.copyWith(mainStatus: MainStatus.updeatPosterLoading));
    try {
      await appRepository.updatePoster(index, poster);
      getAllPosters();
      emit(state.copyWith(mainStatus: MainStatus.updeatPosterSuccess));
    } catch (e) {
      emit(state.copyWith(mainStatus: MainStatus.error));
    }
  }

  void deletePoster(int index) async {
    emit(state.copyWith(mainStatus: MainStatus.deletePosterLoading));
    try {
      await appRepository.deletePoster(index);
      getAllPosters();
      emit(state.copyWith(mainStatus: MainStatus.deletePosterSuccess));
      //getAllPosters();
    } catch (e) {
      emit(state.copyWith(mainStatus: MainStatus.error));
    }
  }
}
