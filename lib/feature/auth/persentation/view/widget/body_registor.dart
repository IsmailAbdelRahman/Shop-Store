import 'package:appstore/core/utils/component.dart';
import 'package:appstore/core/utils/theming/app_assets.dart';
import 'package:appstore/feature/auth/persentation/manger/registor/registor_cubit.dart';
import 'package:appstore/feature/auth/persentation/view/login_shoping.dart';
import 'package:appstore/feature/auth/persentation/view/widget/title_login.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyRegistor extends StatelessWidget {
  const BodyRegistor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistorCubit, RegistorState>(
        listener: (context, state) {
      state is SuccessRegisterState
          ? tost(state.message.toString(),
              state.state! ? Colorenum.correct : Colorenum.error)
          : null;
    }, builder: (context, state) {
      RegistorCubit cubit = RegistorCubit.get(context);

      return Form(
        key: cubit.globalForm,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: AppBar(
              //     elevation: 10,

              actions: [
                IconButton(
                  onPressed: () {
                    navigatorTo(context, const LoginShopState());
                  },
                  icon: const Icon(Icons.arrow_back_outlined,
                      textDirection: TextDirection.ltr),
                  color: Colors.blue,
                  alignment: AlignmentDirectional.bottomEnd,
                )
              ],
              backgroundColor: Colors.transparent,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.imageLogin),
                      colorFilter:
                          ColorFilter.mode(Colors.blue, BlendMode.dst))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleAuth(
                      textOne: 'Register',
                      textTwo: 'Hello World',
                    ),

                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customTextFormField(
                          controll: cubit.textEdControllerName,
                          text: 'name',
                          return1null: 'Enter Name place',
                          prefixIconRight: null,
                        ),
                        customTextFormField(
                            controll: cubit.textEdControllerUSer,
                            text: 'Enter Email',
                            return1null: 'Enter Email place',
                            prefixIconLeft: Icons.email_outlined,
                            prefixIconRight: null),
                        customTextFormField(
                          controll: cubit.textEdControllerPass,
                          text: 'EnterPasswd',
                          return1null: 'Enter Passwd place',
                          prefixIconLeft: Icons.password_sharp,
                          passwd: cubit.passwdS,
                          prefixIconRight: cubit.icoVi,
                          fun: () {
                            cubit.shangeSufixRightVissPasswd();
                          },
                        ),
                        customTextFormField(
                          controll: cubit.textEdControllerPhone,
                          text: 'Phone',
                          return1null: 'Enter Phone place',
                          prefixIconRight: null,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoadRegister,
                          builder: (context) => ElevatedButton(
                              onPressed: () {
                                if (cubit.globalForm.currentState!.validate()) {
                                  cubit.register(
                                      name: cubit.textEdControllerName.text,
                                      phone: cubit.textEdControllerPhone.text,
                                      email: cubit.textEdControllerUSer.text,
                                      password:
                                          cubit.textEdControllerPass.text);
                                }
                              },
                              child: const Text('Register')),
                          fallback: (context) => /*CircularProgressIndicator()*/
                              const Text("data"),
                        ),
                      ],
                    ),
                    //  Center(child: Text(Cubit.s1)),
                    const Spacer(
                      flex: 2,
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
