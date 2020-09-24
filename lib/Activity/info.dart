import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {

  List<String> info = [
    "App Name",
    "Build Version",
    "Email",
    "Developer",
    "Copyright"
  ];
  List<String> sub = [
    "Recipes App",
    "Version 1.0",
    "syahrul.am9773@gmail.com",
    "MSA",
    "Copyright © 2019 All rights reserved"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About Us'),
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
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              final information = info[index].toString();
              final subt = sub[index].toString();
              return Card(
                child: ListTile(
                  leading: ClipRect(
                    child: Icon(
                      index==0?Icons.home:index==1?Icons.verified_user:index==2?Icons.mail:index==3?Icons.account_circle:Icons.copyright,
                      //size: 20,
                    ),
                  ),
                  title: Text(information, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),),
                  subtitle: Text(subt, style: TextStyle(fontStyle: FontStyle.italic),),
                ),
              );
            },
          ),
        ),
    );
  }
}
