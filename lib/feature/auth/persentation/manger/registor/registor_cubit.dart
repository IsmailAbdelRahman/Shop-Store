import 'package:appstore/core/utils/networking/api_constants.dart';
import 'package:appstore/core/utils/networking/dio_helper.dart';
import 'package:appstore/feature/auth/data/model/models_register.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registor_state.dart';

class RegistorCubit extends Cubit<RegistorState> {
  RegistorCubit() : super(RegistorInitial());

  static RegistorCubit get(context) => BlocProvider.of(context);

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

  void shangeSufixRightVissPasswd() {
    passwdS = !passwdS;
    passwdS ? icoVi = Icons.visibility_off : icoVi = Icons.visibility;

    emit(ChangePasswdAndVisi());
  }

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
}
