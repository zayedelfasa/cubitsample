import 'package:cubitloginsample/routes/routes.dart';
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
              onPressed: () => Routes.routes.navigate<bool>("/LoginPage", params: {'id': 2345}),
            )
          ],
        ),
      ),
    );
  }
}
