abstract class StateLoginShop {}

class InInitialLogState extends StateLoginShop {}

class ChangeIndextBottomNBar extends StateLoginShop {
  int indextBottomNBar;

  ChangeIndextBottomNBar(this.indextBottomNBar);
}

class HomeUserloadingState extends StateLoginShop {}

class HomeUSuccessState extends StateLoginShop {
  // final  ShopLoginModel s2;
  // HomeUSseruccessState(ths.s2);
}

class HomeUserErrorState extends StateLoginShop {
  dynamic error;

  HomeUserErrorState(this.error);
}

class SeccessfullGetCategory extends StateLoginShop {}

class ChangeColorFavoriteState extends StateLoginShop {}

class ChangeSeccesfulColorFavoriteState extends StateLoginShop {
  final bool? stateF;
  final String? message;
  ChangeSeccesfulColorFavoriteState({this.stateF, this.message});
}

class SeccessfullGetFavorites extends StateLoginShop {}

class ErrorGetFavorites extends StateLoginShop {}

class LoadingchangeFav extends StateLoginShop {}

class SeccessfullGetProfile extends StateLoginShop {
  String? phone;
  String? email;
  String? name;

  SeccessfullGetProfile({this.phone, this.email, this.name});
}

class ErrorGetProfile extends StateLoginShop {}

class SuccessUpdateProfileState extends StateLoginShop {
  bool? state;
  String? message;
  SuccessUpdateProfileState(this.state, this.message);
}

class ErrorUpdateProfile extends StateLoginShop {}

class SeccessfullgetWeather extends StateLoginShop {}

class ErrorgetWeather extends StateLoginShop {}
