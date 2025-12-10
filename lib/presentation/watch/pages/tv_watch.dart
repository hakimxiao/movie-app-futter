import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/similar_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_title.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            SizedBox(height: 16),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            SizedBox(height: 16),
            RecommendationTvs(tvId: tvEntity.id!),
            SizedBox(height: 16),
            SimilarTvs(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}
