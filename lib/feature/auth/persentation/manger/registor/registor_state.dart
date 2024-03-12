part of 'registor_cubit.dart';

sealed class RegistorState {}

final class RegistorInitial extends RegistorState {}

class SuccessRegisterState extends RegistorState {
  final bool? state;
  final String? message;
  SuccessRegisterState(this.state, this.message);
}

class LoadRegister extends RegistorState {}

class ErrorRegister extends RegistorState {}

class ChangePasswdAndVisi extends RegistorState {}
