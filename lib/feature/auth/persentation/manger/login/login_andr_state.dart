part of 'login_andr_cubit.dart';

sealed class LoginState {}

final class LoginAndrInitial extends LoginState {}

class SeccessfullLogOut extends LoginState {}

class ErrorLogOut extends LoginState {}

class ChangePasswdAndVisi extends LoginState {}

class SuccessLoginShopState extends LoginState {
  final ShopLoginModel s2;
  SuccessLoginShopState(this.s2);
}

class ErrorShopState extends LoginState {
  final String error;

  ErrorShopState(this.error);
}

class LoadingLoginShopState extends LoginState {}
