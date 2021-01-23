import 'package:cubitloginsample/views/fluro/tab/navigation_home.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RoutesHome {
  static final routeNotFoundHandler =
      Handler(handlerFunc: (context, Map<String, List<String>> params) {
    print("Route not found.");
    return Container(
      child: Center(
        child: Text("Router Not Found"),
      ),
    );
  });

  static final rootRoute = AppRoute("/flutterhometabview",
      Handler(handlerFunc: (context, parameters) => FluroHomeTabView()));

  static final fluroHomeTabSecondViewRoute = AppRoute("/flurohometabsecondview",
      Handler(handlerFunc: (context, parameters) => FluroHomeTabSecondView()));

  static final List<AppRoute> routes = [rootRoute, fluroHomeTabSecondViewRoute];
}
