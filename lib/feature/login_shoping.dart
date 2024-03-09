import 'package:appstore/core/utils/component.dart';
import 'package:appstore/core/utils/end_Points.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/home/home_view.dart';
import 'package:appstore/feature/register_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginShopState extends StatelessWidget {
  bool passwd = true;
  var textEdControllerUSer = TextEditingController();
  var textEdControllerPass = TextEditingController();
  TextEditingController textEdController = TextEditingController();
  var globalForm = GlobalKey<FormState>();

  LoginShopState({super.key});

/*  Map<String ,dynamic> Map1 ={ 'status':'s1 ' , 'message' :' s2' , 'data' :{
    "id": 19359,
    "name": "ahmed60a12",
    "email": "ahmed60a12@gmail.com",
    "phone": "0115615568",
    "image": "https://student.valuxapps.com/storage/uploads/users/biE3eDebgX_1663235933.jpeg",
    "points": 0,
    "credit": 0,
    "token": "FySupxRNVtOHbhumNYsiFcPDd8dex153KuT7SjIDFFUVoohd4V9x1wj4X9IaxATPLNgK3L"
  } };*/
  //ModelsLogin s1 =ModelsLogin.json(josn: s2);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, StateLoginShop>(listener: (context, state) {
      if (state is SuccessLoginShopState) {
        if (state.s2.status!) {
          //status =true
          // print(state.s2.message);
          //   print(state.s2.data!.token);
          ShopCubit.get(context)
              .uSerHome(tokin: state.s2.data!.token.toString());

          ShPreferences.savesetDataLoginSharedprefernec(
                  'token', state.s2.data!.token)
              .then((value) {
            navigatorTo(context, const HomeView());

            tokin1 = state.s2.data!.token!.toString();
          });

          tost(state.s2.message.toString(), Colorenum.correct);
        } else {
          //status =false
          // print(state.s2.message);
          /*       Fluttertoast.showToast(

             msg:state.s2.message.toString(),toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 16.0 );*/

          tost(state.s2.message.toString(), Colorenum.error);
          //  ScaffoldMessenger.of(context).showSnackBar(SnackBarCoustem(Title: state.s2.message.toString()  ,Message: '  حاول مجددا  '  ));

          // ScaffoldMessenger.of(context).showSnackBar( SnakBars() );
        }
      }
    }, builder: (context, state) {
      ShopCubit cubit = ShopCubit.get(context);

      if (state is LoadingLoginShopState) {
        cubit.changeFalseanTrue = false;
      } else if (state is SuccessLoginShopState) {
        cubit.changeFalseanTrue = true;
      }

      return Form(
        key: globalForm,
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
                            controll: textEdControllerUSer,
                            text: 'Enter Email',
                            return1null: 'Enter Email place',
                            prefixIconLeft: Icons.email_outlined),
                        /*       Custom_textFormField(
                          Controll: TextEdControllerPass,
                          text: 'EnterPasswd',
                          return1null: 'Enter Passwd place',
                          prefixIconLeft: Icons.password_sharp,
                          passwd: passwd,

                          */ /*ico: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwd = !passwd;
                                  });
                                },
                                icon: passwd ?Icon(Icons.visibility_off):Icon(Icons.visibility))*/ /*
                          /////////////////////////////////////////
                          prefixIconRight:
                          passwd ? Icons.visibility : Icons.visibility_off,
                          fun: () {
                            setState(() {
                              print(passwd);
                              passwd = !passwd;
                            });
                          },
                        ),*/

                        customTextFormField(
                          controll: textEdControllerPass,
                          text: 'EnterPasswd',
                          return1null: 'Enter Passwd place',
                          prefixIconLeft: Icons.password_sharp,
                          passwd: Cubit.passwd,
                          prefixIconRight: Cubit.icoVi,
                          fun: () {
                            Cubit.ShangeSufixRightVissPasswd();
                          },
                        ),
                        ConditionalBuilder(
                          condition: state is! LoadingLoginShopState,
                          builder: (context) => ElevatedButton(
                              onPressed: () {
                                if (globalForm.currentState!.validate()) {
                                  Cubit.UserLogin(
                                      email: textEdControllerUSer.text,
                                      Passwd: TextEdControllerPass.text);
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
                                navigatorTo(context, RegistorView()),
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
