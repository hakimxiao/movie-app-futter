import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrandingMovies();
  Future<Either> getNowPlayingMovies();
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrandingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);

      return Right(response.data);
    } on DioException catch (err) {
      return Left(err.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.nowPlayingMovies);

      return Right(response.data);
    } on DioException catch (err) {
      return Left(err.response!.data['message']);
    }
  }
}
