import 'package:appstore/core/utils/network/dio_helper.dart';
import 'package:appstore/core/utils/end_Points.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/models/change_favorites.dart';
import 'package:appstore/feature/models/classSch.dart';
import 'package:appstore/feature/models/fa.dart';
import 'package:appstore/feature/models/get_Profile.dart';
import 'package:appstore/feature/models/hendel_get_weather.dart';
import 'package:appstore/feature/models/models_register.dart';
import 'package:appstore/feature/models/models_update_profile.dart';
import 'package:appstore/feature/models/parthing_category.dart';
import 'package:appstore/feature/models/parthing_get_favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<StateLoginShop> {
  ShopCubit() : super(InInitialLogState());

  static ShopCubit get(context) => BlocProvider.of(context);

///////////////////////////////////////
  int indextBottomNBar = 2;

//////////////////////////////////////
  int t11 = 5;
  bool changeFalseanTrue = true;
  String s1 = ' Error';
  bool passwd = true;
  IconData icoVi = Icons.visibility_off;

  ShopLoginModel? s2;

  void funChangeIndextBottomNBar(int indext) {
    indextBottomNBar = indext;
    // print(" indext : $indext");

    if (indextBottomNBar == 1) {
      getFav();
      //  print("GetFavorites");
    }
    if (indextBottomNBar == 3) {
      getProfile();
    }

    /*else
        if(indextBottomNBar ==2  ){
          USerHome();
          print("homeuser");
        }*/

    emit(ChangeIndextBottomNBar(indextBottomNBar));
    //   print(  'ChangeIndextBottomNBar :$indextBottomNBar' );
  }

  void shangeSufixRightVissPasswd() {
    passwd = !passwd;
    passwd ? icoVi = Icons.visibility_off : icoVi = Icons.visibility;

    emit(ChangePasswdAndVisi());
  }

  userLogin({required String email, required String passwd}) {
    emit(LoadingLoginShopState());
    return DioHelper.PostData(
        url: Login, Data: {'email': email, 'password': passwd}).then((value) {
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

///////////////////////////////
  HomeUser? obHomeUser;
  Map<int, bool> fav = {};

  uSerHome({String? tokin}) {
    // print('     token  $s1');
    //   Tokin =s1!;
    return DioHelper.get(url: Home, queryParameter: null, token: tokin)
        .then((value) {
      // print(value.data);
      obHomeUser = HomeUser.ofJson(value.data);

/*
      ObHomeUser!.data!.Listproducts!.forEach((element) {

        print(element.in_favorites);
      });
*/

      for (var element in obHomeUser!.data!.Listproducts!) {
        fav.addAll({element.id!: element.in_favorites!});

        //     print(   " ${element.id}   = > ${element.in_favorites}");

        //  print (fav.toString());
/*          if (element.id ==53)
          return  fav.addAll( {  element.id! : true  });
          fav.addAll( {  element.id! : element.in_favorites   });*/
      }
      //print("=== ?  fa v ${fav}");

      //   print(ObHomeUser!.data!.Listbanners![0].image);

      //  print(value.data);

      emit(HomeUSuccessState());
    }).catchError((e) {
      emit(HomeUserErrorState(e.toString()));
      //  print(e);
    });
  }

/////////////////////////////////
  CategoryModel? categ;

  userCategory() {
    DioHelper.get(url: get_category, token: tokin1, queryParameter: null)
        .then((value) {
      //print(value.data.toString());
      categ = CategoryModel.forjson(value.data);

      emit(SeccessfullGetCategory());
    }).catchError((e) {
      //   print(e);
    });
  }

//////////////get favorites -- بدى بينات ويرجع قيمه
  FavoritesModel? favoritesModel;

  Favorite? f;

  void getFav() {
    emit(LoadingchangeFav());

    DioHelper.get(
      url: Post_Favorite,
      token: tokin1,
    ).then((value) {
      //  print(value.data);
      favoritesModel = FavoritesModel.forjson(value.data);
      //  if (value.data != null ) f  =   favorite.fromJson(value.data) ;

      emit(SeccessfullGetFavorites());
    }).catchError((e) {
      //   print(e.toString());
      emit(ErrorGetFavorites());
    });
  }

  ///////////////////////////////

//////////////////////////set  favorites  -- بادى بيانات وباخد قيمه
  ChangeFavoritesModels? changeFavoritesModels;

  void postChangeColorFavorite(int idFavorites) {
    fav[idFavorites] = !fav[idFavorites]!;
    emit(ChangeColorFavoriteState());
    DioHelper.PostData(
            url: Post_Favorite,
            Data: {"product_id": idFavorites},
            token: tokin1)
        .then((value) {
      changeFavoritesModels = ChangeFavoritesModels(value.data);
      //  print(  "  =>>>> ${value.data}");
      /// هل كان ممكن انى اعتمد ع الستيتس ال جيالى
      /// change_favoritesModels!.Status
      /// علشان اغير ف لون الايقون  ب قال مكنت اعمل كدا
      /// بلسن ع اليوزمود  وباخد منه الاى دى  وبديه الماب ال هتدينى القيمه بناء ع الكي ال ادتهولها
      ///ShopCubit.get(context).fav[ImageForIndext.id];
      ///لا ليه لانى الستيتس ال جايه بتيجي بترو ديمن ف  حاله اذا ضفت للفيفريد او مسحت منها
      if (changeFavoritesModels!.status! == false) {
        fav[idFavorites] = !fav[idFavorites]!;
      } else {
        getFav();
      }
      //  print( change_favoritesModels!.Status );
      // print(change_favoritesModels!.message);

      emit(ChangeSeccesfulColorFavoriteState(
          stateF: changeFavoritesModels!.status,
          message: changeFavoritesModels!.message));
    }).catchError((e) {
      fav[idFavorites] = !fav[idFavorites]!;
      //    print("Favorites Error");
    });
  }

//////////////////////////////////////

  Autogenerated? modelsGetProfile;
  void getProfile() {
    DioHelper.get(url: Get_Favorites, token: tokin1).then((value) {
      modelsGetProfile = Autogenerated.fromJson(value.data);

      emit(SeccessfullGetProfile(
          email: modelsGetProfile!.data!.email,
          name: modelsGetProfile!.data!.name,
          phone: modelsGetProfile!.data!.phone));
      // print(value.data);
      //print(ModelsGetProfile!.data!.phone);
    }).catchError((e) {
      emit(ErrorGetProfile());
      //   print(e);
    });
  }

  ////////////////////  غير مستخدمه
  void logOut() {
    DioHelper.PostData(url: Post_LogOut, Data: {"fcm_token": tokin1})
        .then((value) {
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
    DioHelper.PostData(url: Post_Register, Data: {
      "ne": name,
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

  UpdateProfile? updateprofile;

//// post ==  but put + tokin
  void funUpdateProfile(
      {required String name, required String email, required String phone}) {
    DioHelper.PutData(url: Update_Profile, token: tokin1, Data: {
      "name": name,
      "phone": phone,
      "email": email,
    }).then((value) {
      updateprofile = UpdateProfile.fromJson(value.data);
      // print(value.data);
      emit(SuccessUpdateProfileState(
          updateprofile!.status, updateprofile!.message));
    }).catchError((e) {
      emit(ErrorUpdateProfile());
    });
  }

  Weather1? modelGetWeather;
  void getfunWeather({String? url, String? key, String? nameCountry}) {
    dioWeather.getWeather(Url: "search", queryParameter: {
      "key": "91a133d44eab4178b5c100237233004",
      "q": "$nameCountry"
    }).then((value) {
      modelGetWeather = Weather1.forJson(value.data);
      //print(value.data);

      emit(SeccessfullgetWeather());
    }).catchError((e) {
      emit(ErrorgetWeather());
      // print(e);
    });
  }
}
