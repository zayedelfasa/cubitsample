import 'package:equatable/equatable.dart';

abstract class MultiBlocMainState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingIsLoginState extends MultiBlocMainState {}

class IsLoginState extends MultiBlocMainState {
  final bool isLogin;
  final String firstName;
  final String lastName;

  IsLoginState(this.isLogin, this.firstName, this.lastName);

  @override
  List<Object> get props => [isLogin];
}

class PayloadLoginState extends MultiBlocMainState {
  final String firstName;
  final String lastName;

  PayloadLoginState(
    this.firstName, this.lastName
  );

  @override
  List<Object> get props => [firstName, lastName];
}