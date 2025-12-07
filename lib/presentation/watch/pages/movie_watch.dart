import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [VideoPlayer(id: movieEntity.id!)]),
      ),
    );
  }
}
