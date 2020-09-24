import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipesapp/Activity/favorite.dart';
import 'package:recipesapp/Activity/home_menu.dart';
import 'package:recipesapp/Activity/info.dart';

class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            primaryColor: Colors.black,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.black))),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) => setState((){_currentIndex = newIndex;}),
          type: BottomNavigationBarType.fixed,
          items: [BottomNavigationBarItem(
            icon: _currentIndex==0?SvgPicture.asset(
              "assets/icons/home.svg",width: 20,):SvgPicture.asset(
        "assets/icons/home-outline.svg",width: 20,),
            title: Text('Home'),
          ),
            BottomNavigationBarItem(
              icon: _currentIndex==1?Icon(Icons.favorite):Icon(Icons.favorite_border),
              title: Text('Favorite'),
            ),
            BottomNavigationBarItem(
              icon: _currentIndex==2?Icon(Icons.info):Icon(Icons.info_outline),
              title: Text('Info'),
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomeMenu(),
          Favorite(),
          Info(),
        ],
      ),
    );
  }
}

