import 'package:equatable/equatable.dart';

abstract class MultiLoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialMultiLoginState extends MultiLoginState {}

class FetchMultiLoginState extends MultiLoginState {}

class SuccessLoginState extends MultiLoginState {
  final bool isLogin;

  SuccessLoginState(this.isLogin);

  @override
  List<Object> get props => [isLogin];
}

class ErroLoginState extends MultiLoginState {
  final String errorMessage;

  ErroLoginState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}