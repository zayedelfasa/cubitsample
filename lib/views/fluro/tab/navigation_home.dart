import 'package:cubitloginsample/views/fluro/config/app_router.dart';
import 'package:cubitloginsample/views/fluro/routes/routes_home.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  void initState() {
    super.initState();

    AppRouter homeRouter = AppRouter(
        routes: RoutesHome.routes,
        notFoundHandler: RoutesHome.routeNotFoundHandler);

    homeRouter.setupRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Navigation",
      debugShowCheckedModeBanner: false,
      home: FluroHomeTabView(),
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}

class FluroHomeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluroHomeTabView"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text("FluroHomeTabView"),
            ),
            TextButton(
                onPressed: () {
                  AppRouter.router.navigateTo(
                      context, 
                      RoutesHome.fluroHomeTabSecondViewRoute.route,
                      transition: TransitionType.cupertino);
                },
                child: Text("Klik untuk menuju halaman ke dua"))
          ],
        ),
      ),
    );
  }
}

class FluroHomeTabSecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluroHomeTabSecondView"),
      ),
      body: Container(
        child: Center(
          child: Text("Ini FluroHomeTabSecondView"),
        ),
      ),
    );
  }
}
