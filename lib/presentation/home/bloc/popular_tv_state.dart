import 'package:movie_app/domain/tv/entities/tv.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TVEntity> tv;

  PopularTvLoaded({required this.tv});
}

class FailureLoadedPopularTv extends PopularTvState {
  final String errorMessage;

  FailureLoadedPopularTv({required this.errorMessage});
}
