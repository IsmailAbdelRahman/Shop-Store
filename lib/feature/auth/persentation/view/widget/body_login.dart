import 'package:appstore/core/utils/component.dart';
import 'package:appstore/core/utils/networking/api_constants.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/core/widget/bottom_navigator_bar_app.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/auth/persentation/manger/login_r/lgin_andr_cubit.dart';
import 'package:appstore/feature/auth/persentation/view/register_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginAndrCubit, LoginAndrState>(
        listener: (context, state) {
      if (state is SuccessLoginShopState) {
        if (state.s2.status!) {
          ShopCubit.get(context)
              .uSerHome(tokin: state.s2.data!.token.toString());

          ShPreferences.savesetDataLoginSharedprefernec(
                  'token', state.s2.data!.token)
              .then((value) {
            // navigatorTo(context, const BottomNavigationBarView());
            navigatorAndFinshed(context, const BottomNavigationBarView());

            ApiConstants.tokin1 = state.s2.data!.token!.toString();
          });

          tost(state.s2.message.toString(), Colorenum.correct);
        } else {
          tost(state.s2.message.toString(), Colorenum.error);
        }
      }
    }, builder: (context, state) {
      LoginAndrCubit cubit = LoginAndrCubit.get(context);

      if (state is LoadingLoginShopState) {
        cubit.changeFalseanTrue = false;
      } else if (state is SuccessLoginShopState) {
        cubit.changeFalseanTrue = true;
      }

      return Form(
        key: cubit.globalFormLogin,
        child: Scaffold(
          // appBar:AppBar(title: Text('Login')),

          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/s1.png'),
                      colorFilter:
                          ColorFilter.mode(Colors.blue, BlendMode.dst))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 30)),
                    Text(
                      'Hello World',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customTextFormField(
                            controll: cubit.textEdControllerUSerLogin,
                            text: 'Enter Email',
                            return1null: 'Enter Email place',
                            prefixIconLeft: Icons.email_outlined),
                        customTextFormField(
                          controll: cubit.textEdControllerPassLogin,
                          text: 'EnterPasswd',
                          return1null: 'Enter Passwd place',
                          prefixIconLeft: Icons.password_sharp,
                          passwd: cubit.passwdS,
                          prefixIconRight: cubit.icoVi,
                          fun: () {
                            cubit.shangeSufixRightVissPasswd();
                          },
                        ),
                        ConditionalBuilder(
                          condition: state is! LoadingLoginShopState,
                          builder: (context) => ElevatedButton(
                              onPressed: () {
                                if (cubit.globalFormLogin.currentState!
                                    .validate()) {
                                  cubit.userLogin(
                                      email:
                                          cubit.textEdControllerUSerLogin.text,
                                      passwd:
                                          cubit.textEdControllerPassLogin.text);
                                }
                              },
                              child: const Text('Login')),
                          fallback: (context) =>
                              const CircularProgressIndicator(),
                        ),
                      ],
                    ),
                    //  Center(child: Text(Cubit.s1)),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don`t have an account'),
                        TextButton(
                            onPressed: () =>
                                navigatorTo(context, const RegistorView()),
                            child: const Text('Register'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
