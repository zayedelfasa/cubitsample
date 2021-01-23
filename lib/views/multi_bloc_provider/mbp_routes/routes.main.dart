import 'package:cubitloginsample/views/multi_bloc_provider/home/multi_bloc_home.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/login/multi_bloc_login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteMainMultiBloc {
  static final routeNotFoundHandler =
      Handler(handlerFunc: (context, Map<String, List<String>> params) {
    print("Route not found.");
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Router Not Found"),
        ),
      ),
    );
  });

  static final mmultiblochomeRoute = AppRoute(
      "/multiblochome", Handler(handlerFunc: (context, parameters) => MultiBlocHome()),
      transitionType: TransitionType.fadeIn);

  static final multiblocloginRoute = AppRoute(
      "/multiblocloginroute", Handler(handlerFunc: (context, parameters) => MultiBlocLogin()),
      transitionType: TransitionType.fadeIn);

  static final List<AppRoute> routes = [mmultiblochomeRoute, multiblocloginRoute];
}
