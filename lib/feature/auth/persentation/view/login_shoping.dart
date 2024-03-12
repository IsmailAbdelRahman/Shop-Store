import 'package:appstore/feature/auth/persentation/manger/login/login_andr_cubit.dart';
import 'package:appstore/feature/auth/persentation/view/widget/body_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginShopState extends StatelessWidget {
  const LoginShopState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const BodyLogin(),
    );
    // const BodyLogin();
  }
}
