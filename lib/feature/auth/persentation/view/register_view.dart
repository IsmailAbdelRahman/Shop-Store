import 'package:appstore/feature/auth/persentation/manger/registor/registor_cubit.dart';
import 'package:appstore/feature/auth/persentation/view/widget/body_registor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistorView extends StatelessWidget {
  const RegistorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistorCubit(),
      child: const BodyRegistor(),
    );
  }
}
