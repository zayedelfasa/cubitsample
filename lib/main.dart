import 'package:cubitloginsample/views/counter/counter_view.dart';
import 'package:cubitloginsample/views/cupertino_tab/CupertinoTab.dart';
import 'package:cubitloginsample/views/fluro/fluro_first.dart';
import 'package:cubitloginsample/views/fluro/fluro_main.dart';
import 'package:cubitloginsample/views/login/login_view.dart';
import 'package:cubitloginsample/views/main/app_main.dart';
import 'package:cubitloginsample/views/movies/movies_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  // runApp(LoginView());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LoginView()
      // home: CounterView()
      // home: MoviesView()
      // home: Main(),
      // home: CupertinoTab()
      home: FluroMainView()
    );
  }
}
