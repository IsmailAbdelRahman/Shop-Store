import 'package:appstore/core/utils/themes/app_themes.dart';
import 'package:appstore/feature/Shareit/bloc/cubit-change_theme/cubit_change_theme.dart';
import 'package:appstore/feature/Shareit/bloc/cubit-change_theme/state_change_theme.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/registor_login/persentation/manger/login_r/lgin_andr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStore extends StatelessWidget {
  final bool? dark;
  final bool? boolSaveSkip;
  final Widget? widget;
  const AppStore({Key? key, required this.dark, this.boolSaveSkip, this.widget})
      : super(key: key);

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
        BlocProvider(create: (context) => LoginAndrCubit())
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
          home:
              Directionality(textDirection: TextDirection.ltr, child: widget!),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
