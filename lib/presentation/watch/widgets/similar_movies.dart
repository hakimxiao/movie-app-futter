import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/Similar_movies_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/Similar_movies_state.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is SimilarMoviesLoaded) {
            return Column(
              children: [
                Text(
                  'Similar Movies',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadedSimilarMovies) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
