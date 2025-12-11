import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/search_movie.dart';
import 'package:movie_app/domain/tv/usecases/search_tv.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  Timer? _debounce; // ⬅️ Timer untuk debounce

  void search(String query, SearchType searchType) {
    // Batalkan timer sebelumnya
    _debounce?.cancel();

    // Set debounce baru
    _debounce = Timer(Duration(seconds: 2), () {
      if (query.isNotEmpty) {
        emit(SearchLoading());

        switch (searchType) {
          case SearchType.movie:
            searchMovies(query);
            break;
          case SearchType.tv:
            searchTv(query);
            break;
        }
      }
    });
  }

  void searchMovies(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);

    returnedData.fold(
      (error) {
        emit(SearchFailure(errorMessage: error));
      },
      (data) {
        emit(MoviesLoaded(movies: data));
      },
    );
  }

  void searchTv(String query) async {
    var returnedData = await sl<SearchTvUseCase>().call(params: query);

    returnedData.fold(
      (error) {
        emit(SearchFailure(errorMessage: error));
      },
      (data) {
        emit(TvsLoaded(tvs: data));
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    textEditingController.dispose();
    return super.close();
  }
}
