import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTab extends StatefulWidget {
  @override
  _CupertinoTabState createState() => _CupertinoTabState();
}

class _CupertinoTabState extends State<CupertinoTab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Bottom Tab'),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.settings))
          ],
        ),
        tabBuilder: (context, index) {
          List<Widget> _pages = [FrontPage(), SettingsPage()];
          return _pages[index];
        },
      ),
    );
  }
}

// Front Page
class FrontPage extends StatelessWidget {
  final destinationPageRoute =
      MaterialPageRoute(builder: (context) => FrontPageSecond(), fullscreenDialog: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Halaman 1"),
            ),
            body: Center(
              child: RaisedButton(
                child: Text("Menuju Halaman 2"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/signup");
                },
              ),
            ),
          );
        },
        "/signup": (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Halaman 2"),
            ),
          );
        }
      },
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}

class FrontPageSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Ini halaman ke dua"),
      ),
    );
  }
}
