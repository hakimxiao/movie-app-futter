import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTv();
}

class TVApiServiceImpl extends TVService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.popularTV);

      return Right(response.data);
    } on DioException catch (err) {
      return Left(err.response!.data['message']);
    }
  }
}
