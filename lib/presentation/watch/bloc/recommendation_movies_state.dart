import 'package:movie_app/domain/movie/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;

  RecommendationMoviesLoaded({required this.movies});
}

class FailureLoadedRecommendationMovies extends RecommendationMoviesState {
  final String errorMessage;

  FailureLoadedRecommendationMovies({required this.errorMessage});
}
