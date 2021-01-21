import 'package:flutter/material.dart';

class FluroSecondView extends StatefulWidget {
  @override
  _FluroSecondViewState createState() => _FluroSecondViewState();
}

class _FluroSecondViewState extends State<FluroSecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluro Second Screen"),
      ),
      body: Container(child: Text("Ini halaman kedua")),
    );
  }
}
