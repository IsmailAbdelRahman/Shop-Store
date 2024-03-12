import 'package:appstore/core/utils/networking/api_constants.dart';
import 'package:appstore/core/utils/networking/dio_helper.dart';
import 'package:appstore/feature/auth/data/model/model_login.dart';
import 'package:appstore/feature/auth/data/model/models_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lgin_andr_state.dart';

class LoginAndrCubit extends Cubit<LoginAndrState> {
  LoginAndrCubit() : super(LginAndrInitial());

  static LoginAndrCubit get(context) => BlocProvider.of(context);
  bool changeFalseanTrue = true;

//////////////////////////? attribute registor
  bool passwd = true;
  var textEdControllerUSer = TextEditingController();
  var textEdControllerPass = TextEditingController();
  var textEdControllerName = TextEditingController();
  var textEdControllerPassword = TextEditingController();
  var textEdControllerPhone = TextEditingController();
  TextEditingController textEdController = TextEditingController();
  var globalForm = GlobalKey<FormState>();

  bool passwdS = true;
  IconData icoVi = Icons.visibility_off;
//////////////////////////? attribute login
  //bool passwdLgon = true;
  var textEdControllerUSerLogin = TextEditingController();
  var textEdControllerPassLogin = TextEditingController();
  TextEditingController textEdControllerLogin = TextEditingController();
  var globalFormLogin = GlobalKey<FormState>();

  void shangeSufixRightVissPasswd() {
    passwdS = !passwdS;
    passwdS ? icoVi = Icons.visibility_off : icoVi = Icons.visibility;

    emit(ChangePasswdAndVisi());
  }

  ////////////////////  غير مستخدمه
  void logOut() {
    DioHelper.postData(
        url: ApiConstants.postLogOut,
        data: {"fcm_token": ApiConstants.tokin1}).then((value) {
      emit(SeccessfullLogOut());
      //  print(value.data);
    }).catchError((e) {});
    emit(ErrorLogOut());
  }

  ////////////////////////
  RegisterP? r1;
  void register(
      {required String name,
      required String email,
      required String phone,
      required String password}) {
    DioHelper.postData(url: ApiConstants.postRegister, data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password
    }).then((value) {
      emit(LoadRegister());

      r1 = RegisterP.fromJson(value.data);
      // print(value.data);
      emit(SuccessRegisterState(r1!.status, r1!.message));
    }).catchError((e) {
      emit(ErrorRegister());
      //  print(e);
    });
  }
  //////////////////////////?

  ShopLoginModel? s2;
  userLogin({required String email, required String passwd}) {
    emit(LoadingLoginShopState());
    return DioHelper.postData(
        url: ApiConstants.login,
        data: {'email': email, 'password': passwd}).then((value) {
      // s1 =value.data['message']; //صيغه الماب دا الكي انا عاوز الكي ال اسمو مسيج من الماب
      s2 = ShopLoginModel.formJson(josn: value.data);
//     throw('');
      emit(SuccessLoginShopState(s2!));
      //   print(s2!.data!.token);

      //    print( value.data[message] );
    }).catchError((er) {
      emit(ErrorShopState(er.toString()));
    });
  }
}
