part of 'lgin_andr_cubit.dart';

sealed class LoginAndrState {}

final class LginAndrInitial extends LoginAndrState {}

class SeccessfullLogOut extends LoginAndrState {}

class ErrorLogOut extends LoginAndrState {}

class SuccessRegisterState extends LoginAndrState {
  final bool? state;
  final String? message;
  SuccessRegisterState(this.state, this.message);
}

class LoadRegister extends LoginAndrState {}

class ErrorRegister extends LoginAndrState {}

class ChangePasswdAndVisi extends LoginAndrState {}

class SuccessLoginShopState extends LoginAndrState {
  final ShopLoginModel s2;
  SuccessLoginShopState(this.s2);
}

class ErrorShopState extends LoginAndrState {
  final String error;

  ErrorShopState(this.error);
}

class LoadingLoginShopState extends LoginAndrState {}
