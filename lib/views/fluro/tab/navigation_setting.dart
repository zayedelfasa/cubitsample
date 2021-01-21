import 'package:flutter/material.dart';

class SettingNavigation extends StatefulWidget {
  @override
  _SettingNavigationState createState() => _SettingNavigationState();
}

class _SettingNavigationState extends State<SettingNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SettingNavigation"),
      ),
      body: Container(
        child: Center(
          child: Text("SettingNavigation"),
        ),
      ),
    );
  }
}
