import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiBlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiBlocHome"),
      ),
      body: Container(
        child: Center(
          child: Text("Ini halaman multibloc home"),
        ),
      ),
    );
  }
}