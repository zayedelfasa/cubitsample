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
  List<Object> get props => [isLogin, firstName, lastName];
}

class PayloadLoginState extends MultiBlocMainState {
  final String firstName;
  final String lastName;

  PayloadLoginState(this.firstName, this.lastName);

  @override
  List<Object> get props => [firstName, lastName];
}

abstract class HydraLoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class HydraLoadingLoginState extends HydraLoginState {}

class HydraNotLoginState extends HydraLoginState {
  final String valLogin;

  HydraNotLoginState(this.valLogin);

  @override
  List<Object> get props => [valLogin];
}

class HydraIsLoginState extends HydraLoginState {
  final String valLogin;

  HydraIsLoginState(this.valLogin);

  @override
  List<Object> get props => [valLogin];
}
