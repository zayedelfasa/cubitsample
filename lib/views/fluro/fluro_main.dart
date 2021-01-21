import 'package:cubitloginsample/views/fluro/routes/routes_app.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'config/app_router.dart';

class FluroMainView extends StatefulWidget {
  @override
  _FluroMainViewState createState() => _FluroMainViewState();
}

class _FluroMainViewState extends State<FluroMainView> {
  @override
  void initState() {
    super.initState();

    AppRouter appRouter = AppRouter(
        routes: RoutesApp.routes,
        notFoundHandler: RoutesApp.routeNotFoundHandler);

    appRouter.setupRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}
