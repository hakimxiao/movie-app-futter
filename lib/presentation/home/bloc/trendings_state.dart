import 'package:movie_app/domain/movie/entities/movie.dart';

abstract class TrendingsState {}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;

  TrendingsMoviesLoaded({required this.movies});
}

class FailureLoadedTrendingsMovies extends TrendingsState {
  final String errorMessage;

  FailureLoadedTrendingsMovies({required this.errorMessage});
}
