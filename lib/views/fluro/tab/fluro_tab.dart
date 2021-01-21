import 'package:cubitloginsample/views/fluro/tab/navigation_home.dart';
import 'package:cubitloginsample/views/fluro/tab/navigation_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/**
 * *this view for main tab
 */
class FluroTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.settings))
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        List<Widget> _pages = [HomeNavigation(), SettingNavigation()];
        return _pages[index];
      },
    ));
  }
}
