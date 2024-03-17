import '../enums/main_enum.dart';

extension MainExtensions on MainStatus {
bool get isSuccess => this == MainStatus.success;
bool get isError => this == MainStatus.error;
bool get isLoading => this == MainStatus.loading;

bool get isGetAllPosterSuccess => this == MainStatus.getAllPosterSuccess;
bool get isAddPosterSuccess => this == MainStatus.addPosterSuccess;
bool get isDeletePosterSuccess => this == MainStatus.deletePosterSuccess;
bool get isUpdeatPosterSuccess => this == MainStatus.updeatPosterSuccess;
bool get isGetAllPosterLoading => this == MainStatus.getAllPosterLoading;
bool get isAddPosterLoading => this == MainStatus.addPosterLoading;
bool get isDeletePosterLoading => this == MainStatus.deletePosterLoading;
bool get isUpdeatPosterLoading => this == MainStatus.updeatPosterLoading;
}