import 'package:appstore/app_store.dart';
import 'package:appstore/core/utils/networking/dio_helper.dart';
import 'package:appstore/core/utils/networking/api_constants.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/core/widget/bottom_navigator_bar_app.dart';
import 'package:appstore/feature/Shareit/bloc/Observer.dart';
import 'package:appstore/feature/auth/persentation/view/login_shoping.dart';
import 'package:appstore/feature/boarding/presentation/view/boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//////////////
  Bloc.observer = MyBlocObserver();
///////////////////////////////
  DioHelper.init();

  await ShPreferences.initialShPreferen();
  ///////////////////////////////////////////////////get share preference
  bool? dark = ShPreferences.getData(key: 'dark') ?? true; //
  bool? saveSkipBool =
      ShPreferences.getDataLoginSharedprefernec(key: 'isBoarding');
  ApiConstants.tokin1 = ShPreferences.getDataLoginSharedprefernec(key: 'token');
  ////////////////////////////////////////////////////////////////////Page
  Widget widget = OnBoarding();
  if (saveSkipBool != null) {
    if (ApiConstants.tokin1 != null) {
      widget = const BottomNavigationBarView();
    } else {
      widget = const LoginShopState();
    }
  } else {
    widget = OnBoarding();
  }

  runApp(AppStore(dark: dark, boolSaveSkip: saveSkipBool, widget: widget));
}
