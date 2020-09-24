import 'package:flutter/material.dart';


class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Favorite'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                Color(0xffc21500),
                Color(0xffffc500)
              ])
            ),
          ),
        ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "This Page is Empty :("
              ),
            ),
          ],
        ),
      ),
    );
  }
}
