import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:recipesapp/Activity/detailPage.dart';
import 'dart:convert';
import 'package:recipesapp/Model/Meal.dart';

class SecondPage extends StatefulWidget {
  final String text,img;
  SecondPage({Key key, this.text='', this.img=''}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<List<Meal>> _getMeal() async {
    var mealData = await http.get(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c="+widget.text);
    var jsonData = json.decode(mealData.body)['meals'] as List;
    List<Meal> meals = [];
    for (var m in jsonData) {
      Meal meal = Meal(m["strMeal"], m["strMealThumb"], m["idMeal"]);
      meals.add(meal);
    }
    return meals;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -12.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.img), radius: 20, backgroundColor: Colors.white,
            ),
            Container(
                padding: const EdgeInsets.all(5.0), child: Text(widget.text))
          ],

        ),
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
      ), ),
      body: Container(
        child: FutureBuilder(
          future: _getMeal(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(child: Center(child: CircularProgressIndicator()));
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: ListTile(
                        leading: ClipRect(
                          child: Image(image: NetworkImage(snapshot.data[index].strMealThumb),
                            fit: BoxFit.cover,
                            width: 76,
                            height: 76,
                          ),),
                        title: Text(snapshot.data[index].strMeal),
                        subtitle: Text("ID : "+snapshot.data[index].idMeal),

                        onTap: (){
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) => DetailPage(idMealmu:snapshot.data[index].idMeal,strMealmu:snapshot.data[index].strMeal,strImg: snapshot.data[index].strMealThumb))
                          );
                        },
                      ),
                    );
                  }
              );
            }
          },
        ),
      ),
    );
  }
}
