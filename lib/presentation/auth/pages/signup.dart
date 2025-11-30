import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _signupText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 60),
            _signupButton(),
            SizedBox(height: 10),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signupButton() {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        SignupUseCase(
          authRepository: AuthRepositoryImpl(
            authApiService: AuthApiServiceImpl(),
          ),
        ).call(
          params: SignupReqParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Have an account?'),
          TextSpan(
            text: ' Sign In',
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SigninPage());
              },
          ),
        ],
      ),
    );
  }
}
