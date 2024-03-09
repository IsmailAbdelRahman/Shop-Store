import 'package:appstore/core/utils/themes/app_themes.dart';
import 'package:appstore/core/utils/network/dio_helper.dart';
import 'package:appstore/core/utils/end_Points.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/core/widget/bottom_navigator_bar_app.dart';
import 'package:appstore/feature/Shareit/bloc/Observer.dart';
import 'package:appstore/feature/Shareit/bloc/cubit-change_theme/cubit_change_theme.dart';
import 'package:appstore/feature/Shareit/bloc/cubit-change_theme/state_change_theme.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/boarding_screen.dart';
import 'package:appstore/feature/login_shoping.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/cubit_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* texes*/ /// التحجيم هذا الاضافه يمكنها ايضا عمل بوتن للتكبير والتصغير تشاهدها ف برجكت
/*  doWhenWindowReady(() {
    appWindow.size =Size(320, 850);
    appWindow.minSize= Size(320, 800);
    appWindow.title= "Story_api";
    appWindow.show();

  });*/
//////////////
  Bloc.observer = MyBlocObserver();
///////////////////////////////
  DioHelper.Init();
  dioWeather.FunInitaltionDio();
  await ShPreferences.initialShPreferen();
  ///////////////////////////////////////////////////get share preference
  bool? dark =
      ShPreferences.getData(key: 'dark') ?? true; //     print('dart :$dark');
  bool? saveSkipBool =
      ShPreferences.getDataLoginSharedprefernec(key: 'isBoarding');
  tokin1 = ShPreferences.getDataLoginSharedprefernec(
      key: 'token'); // اول مره بتبقا بنل
  ////////////////////////////////////////////////////////////////////Page
  Widget widget = OnBoarding();
  if (saveSkipBool != null) {
    //هو البردنج فيه قيمه يعني تخطيتو
    if (tokin1 != null) {
      // طيب  انا كدا عرفت انى مش اول مره افتح ومدخلتش ع البورد طيب هل اروح للوجن ولا ادخل المتجر الانى عامل لاوجن قبل كدا بالفعل؟
      // هشوف بقا التوكن في قيمه يعني سجلت الدخول وعطاني قيمتو اذن ادخل ع الهوم
      /*widget =HomeScreen();*/
      widget = const BottomNavigationBarView();
    } else {
      widget = LoginShopState();
    } // التوكن مفهوش قميه يعني مدخلتش ع صفحتي يبقا لسه ف الوجن خليك
  } else {
    //     مفيش قيمه ف الشير ريفيرنس
    // بستنتج من كدا انو بيفتح لاول مره بالتالى افتح ع صفحه الاون بورد
    widget = OnBoarding();
  } // البردنج مفهوش قيمه يعني خليك لسه فيه

  //   if (SaveSkipBool ==null)   SaveSkipBool =false;
  runApp(AppStore(dark: dark, boolSaveSkip: saveSkipBool, widget: widget));
}

class AppStore extends StatelessWidget {
  final bool? dark; // variable or attribute
  bool? boolSaveSkip;
  Widget? widget;
  AppStore({Key? key, required this.dark, this.boolSaveSkip, this.widget})
      : super(key: key); // constructor

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CubitThemes()..chaneColorsThmes(darKSaveMain: dark)),
        BlocProvider(
            create: (context) => ShopCubit()
              ..uSerHome()
              ..userCategory()
              ..getFav()),
        BlocProvider<CubitSearch>(create: (context) => CubitSearch()),
      ],
      child: BlocConsumer<CubitThemes, SuperChangeThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: themesLight,

          ///////////////////////////

          darkTheme: themesDark,

          //////////////////////////
//    themeMode: CubitThemes.getCubitThemes(context).Dark ? ThemeMode.dark:ThemeMode.light,

          themeMode: ThemeMode.light,
          ////////////////

          home: /*ScreensD.ScreenTypeLayout(

      mobile: Directionality(
          textDirection: TextDirection.ltr, child: widget!  ) ,
      desktop: Container(
        color: Colors.white,
        child:
            Column(

              children: [
                WindowTitleBarBox(   child: Row( children: [  Expanded(child: MoveWindow()) ,WindowBouttons() ],)),
                Expanded(child: widget!)
              ],

            ),



      ),
   //   breakpoints: ScreensD.ScreenBreakpoints(desktop:950 ,tablet: 500 ,watch: 1200 ),


    )*/
              Directionality(textDirection: TextDirection.ltr, child: widget!),

          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
