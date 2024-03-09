import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/feature/Shareit/bloc/cubit-change_theme/state_change_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CubitThemes extends Cubit<SuperChangeThemeState> {
  CubitThemes() : super(InitialStateChangeThemeState());

  static CubitThemes getCubitThemes(context) => BlocProvider.of(context);

  ///التارجت بين حاجتين يبقا بولين
  /// التارجت بين اكثر من حاجتين يبقا سوتش او اف

  // ThemeMode  ChangeColorThemeMode = ThemeMode.light ;

  bool dark = true;
  void chaneColorsThmes({bool? darKSaveMain}) {
    if (darKSaveMain != null) {
      dark = darKSaveMain; //print(darKSaveMain);
      emit(ChangeThemesState());
    } else {
      dark = !dark; /*print("$darKSaveMain  change :false $Dark");*/
      ShPreferences.putData(key: 'dark', value: dark)
          .then((value) => emit(ChangeThemesState()));
    }
  }

/*
  bool SaveboolsKip=false;

  void FunSavebool (  { bool?  bo   }  ){

        if ( bo != null){

          SaveboolsKip =bo ;

        }else{
         Sh_Preferences.SavesetDataLoginSharedprefernec('isBroding', true) ;


        }


  }


*/
}
