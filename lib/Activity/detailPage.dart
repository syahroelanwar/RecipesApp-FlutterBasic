import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/*
Inspire Ui Design from https://www.youtube.com/channel/UCjxPo_EJYtoj-Ho3jx_zQpQ - Ahmad Yunus Afghoni
 */
class DetailPage extends StatefulWidget {
  final String idMealmu,strMealmu,strImg;
  DetailPage({Key key, this.idMealmu='',this.strMealmu='',this.strImg=''}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _like = false;

  Future getDetail() async {
    var response = await http.get(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" +
            widget.idMealmu);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.strImg),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.9),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.strMealmu,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    FutureBuilder(
                        future: getDetail(),
                        //DefaultAssetBundle.of(context).loadString('assets/data.json'),
                        builder: (context, snapshot) {
                          var mydt = snapshot.data;
                          if (mydt == null) {
                            return Container(child: Center(
                                child: CircularProgressIndicator()));
                          } else {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Category : " +
                                        mydt["meals"][0]["strCategory"] +
                                        " | "),
                                    Text(mydt["meals"][0]["strArea"]),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strTags"] != null
                                        ? "Tags : " +
                                        mydt["meals"][0]["strTags"]
                                        : ""),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Ingredients",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient1"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient1"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure1"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure1"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient2"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient2"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure2"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure2"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient3"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient3"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure3"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure3"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient4"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient4"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure4"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure4"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient5"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient5"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure5"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure5"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient6"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient6"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure6"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure6"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient7"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient7"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure7"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure7"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient8"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient8"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure8"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure8"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        mydt["meals"][0]["strIngredient9"] != ""
                                            ? "-  " +
                                            mydt["meals"][0]["strIngredient9"]
                                            : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure9"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure9"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient10"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient10"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure10"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure10"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient11"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient11"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure11"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure11"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient12"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient12"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure12"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure12"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient13"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient13"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure13"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure13"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient14"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient14"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure14"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure14"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient15"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient15"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure15"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure15"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient16"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient16"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure16"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure16"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient17"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient17"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure17"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure17"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient18"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient18"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure18"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure18"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient19"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient19"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure19"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure19"]
                                        : ""),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(mydt["meals"][0]["strIngredient20"] !=
                                        ""
                                        ? "-  " +
                                        mydt["meals"][0]["strIngredient20"]
                                        : ""),
                                    SizedBox(width: 10,),
                                    Text(mydt["meals"][0]["strMeasure20"] != ""
                                        ? ":  " +
                                        mydt["meals"][0]["strMeasure20"]
                                        : ""),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'Instructions',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            mydt["meals"][0]["strInstructions"],),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Source : ", style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                    Text(mydt["meals"][0]["strSource"],
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),)
                                  ],
                                ),
                              ],
                            );
                          }
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 30,
                top: height * 0.46,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _like = !_like;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 1)
                        ]),
                    child: Icon(
                      Icons.favorite,
                      size: 35,
                      color: (_like) ? Colors.red : Colors.grey[600],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}