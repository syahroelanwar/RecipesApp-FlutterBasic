import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipesapp/Activity/secondPage.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          overflow: Overflow.visible,
          fit: StackFit.loose,
          children: <Widget>[
            ClipPath(
              clipper: ClippingClass(),
              child: Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 3.5 / 7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffc21500), Color(0xffffc500)],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/imghome.jpg'), radius: 40,
                    ),
                    Text('Recipes App', style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,fontWeight: FontWeight.bold
                    )),
                    Text('Find your best recipe here :)', style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 190),
              child: Expanded(
                child: GridView.count(
                  childAspectRatio: .85,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  primary: false,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      child: InkWell(
                        onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(text: 'Chicken',img: 'assets/images/chicken.png'),
                            ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/chicken.png'),
                              width: 100,),
                            Padding(
                                padding: EdgeInsets.only(bottom: 30,top: 20),
                                child: Text('Chicken', style: TextStyle(fontSize: 16, color: Colors.black54),)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      child: InkWell(
                        onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(text: 'Seafood', img: 'assets/images/seafood.png'),
                            ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image(image: AssetImage('assets/images/seafood.png'),
                              width: 100,),
                            Padding(
                                padding: EdgeInsets.only(bottom: 30,top: 10),
                                child: Text('Seafood', style: TextStyle(fontSize: 16, color: Colors.black54),)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      child: InkWell(
                        onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(text: 'Dessert',img: 'assets/images/dessert.png'),
                            ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image(image: AssetImage('assets/images/dessert.png'),
                              width: 100,),
                            Padding(
                                padding: EdgeInsets.only(bottom: 30,top: 20),
                                child: Text('Dessert', style: TextStyle(fontSize: 16, color: Colors.black54),)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      child: InkWell(
                        onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(text: 'Beef',img: 'assets/images/beef.png'),
                            ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/beef.png'),
                              width: 100,),
                            Padding(
                                padding: EdgeInsets.only(bottom: 30,top: 20),
                                child: Text('Beef', style: TextStyle(fontSize: 16, color: Colors.black54),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                  crossAxisCount: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0.0, size.height*0.85);
    //var controlPoint = Offset(size.width - (size.width / 2), size.height - 120);
    //var endPoint = Offset(size.width, size.height);
    //path.quadraticBezierTo(size.width/2, size.height, size.width, size.height*0.85); //quadraticBezier

    //cubic simple
    //path.cubicTo(size.width/3, size.height, 2*size.width/3, size.height*0.7, size.width, size.height*0.85);

    //cubic generate online tool
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 363.15;
    path.lineTo(-0.003999999999997783 * _xScaling,341.78499999999997 * _yScaling);
    path.cubicTo(-0.003999999999997783 * _xScaling,341.78499999999997 * _yScaling,23.461000000000002 * _xScaling,363.15099999999995 * _yScaling,71.553 * _xScaling,363.15099999999995 * _yScaling,);
    path.cubicTo(119.645 * _xScaling,363.15099999999995 * _yScaling,142.21699999999998 * _xScaling,300.186 * _yScaling,203.29500000000002 * _xScaling,307.21 * _yScaling,);
    path.cubicTo(264.373 * _xScaling,314.234 * _yScaling,282.666 * _xScaling,333.47299999999996 * _yScaling,338.408 * _xScaling,333.47299999999996 * _yScaling,);
    path.cubicTo(394.15000000000003 * _xScaling,333.47299999999996 * _yScaling,413.99600000000004 * _xScaling,254.199 * _yScaling,413.99600000000004 * _xScaling,254.199 * _yScaling,);
    path.cubicTo(413.99600000000004 * _xScaling,254.199 * _yScaling,413.99600000000004 * _xScaling,0 * _yScaling,413.99600000000004 * _xScaling,0 * _yScaling,);
    path.cubicTo(413.99600000000004 * _xScaling,0 * _yScaling,-0.003999999999976467 * _xScaling,0 * _yScaling,-0.003999999999976467 * _xScaling,0 * _yScaling,);
    path.cubicTo(-0.003999999999976467 * _xScaling,0 * _yScaling,-0.003999999999997783 * _xScaling,341.78499999999997 * _yScaling,-0.003999999999997783 * _xScaling,341.78499999999997 * _yScaling,);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
