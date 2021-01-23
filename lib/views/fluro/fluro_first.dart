import 'package:cubitloginsample/views/fluro/config/app_router.dart';
import 'package:cubitloginsample/views/fluro/routes/routes_app.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FluroFirstView extends StatefulWidget {
  @override
  _FluroFirstViewState createState() => _FluroFirstViewState();
}

class _FluroFirstViewState extends State<FluroFirstView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasi Fluro"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  AppRouter.router.navigateTo(
                      context, 
                      RoutesApp.fluroSecondRoute.route,
                      transition: TransitionType.cupertino);
                },
                child: Text("Go to Second Fluro View"),
              ),
              TextButton(
                  onPressed: () {                    
                    AppRouter.router.navigateTo(
                        context, 
                        RoutesApp.fluroTabRoute.route,
                        transition: TransitionType.cupertino);
                  },
                  child: Text("Go to Tab Fluro View"))
            ],
          ),
        ),
      ),
    );
  }
}
