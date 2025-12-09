import 'package:movie_app/domain/movie/entities/movie.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> movies;

  SimilarMoviesLoaded({required this.movies});
}

class FailureLoadedSimilarMovies extends SimilarMoviesState {
  final String errorMessage;

  FailureLoadedSimilarMovies({required this.errorMessage});
}
