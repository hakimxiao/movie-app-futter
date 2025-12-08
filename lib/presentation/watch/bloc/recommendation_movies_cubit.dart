import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_recomendation_movies.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:movie_app/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedData = await sl<GetRecomendationMoviesUseCase>().call(
      params: movieId,
    );
    returnedData.fold(
      (error) {
        emit(FailureLoadedRecommendationMovies(errorMessage: error));
      },
      (data) {
        emit(RecommendationMoviesLoaded(movies: data));
      },
    );
  }
}
