import 'package:cubitloginsample/views/login/login_view.dart';
import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Container(
        child: Column(
          children: [
            Text("Ini untuk splash view"),
            RaisedButton(
              child: Text("Menuju halaman login"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView())),
            )
          ],
        ),
      ),
    );
  }
}
