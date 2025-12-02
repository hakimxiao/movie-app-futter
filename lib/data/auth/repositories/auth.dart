import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> singup(SignupReqParams params) async {
    return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthApiService>().signin(params);
  }
}
