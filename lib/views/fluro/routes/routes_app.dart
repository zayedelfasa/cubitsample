import 'package:cubitloginsample/views/fluro/fluro_first.dart';
import 'package:cubitloginsample/views/fluro/fluro_second.dart';
import 'package:cubitloginsample/views/fluro/tab/fluro_tab.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RoutesApp {
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

  static final rootRoute =
      AppRoute("/", Handler(handlerFunc: (context, parameters) => FluroFirstView()));

  static final fluroSecondRoute =
      AppRoute("/flurosecond", Handler(handlerFunc: (context, Map<String, List<String>> params) {
    return FluroSecondView();
  }));

  static final fluroTabRoute = AppRoute("/flurotabview", Handler(handlerFunc: (context, params) {
    return FluroTabView();
  }));

  /// Primitive function to get one param detail route (i.e. id).
  static String getDetailRoute(String parentRoute, String id) {
    return "$parentRoute/$id";
  }

  static final List<AppRoute> routes = [rootRoute, fluroSecondRoute, fluroTabRoute];
}
