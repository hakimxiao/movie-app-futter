import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_recomendation_movies.dart';
import 'package:movie_app/presentation/watch/bloc/Similar_movies_state.dart';
import 'package:movie_app/service_locator.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());

  void getSimilarMovies(int movieId) async {
    var returnedData = await sl<GetRecomendationMoviesUseCase>().call(
      params: movieId,
    );
    returnedData.fold(
      (error) {
        emit(FailureLoadedSimilarMovies(errorMessage: error));
      },
      (data) {
        emit(SimilarMoviesLoaded(movies: data));
      },
    );
  }
}
