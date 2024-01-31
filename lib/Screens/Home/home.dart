import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userModel/userModel.dart';

/*class Home extends StatefulWidget {
  final VoidCallback login;
  //Home({this.login});
   Home({required this.login, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var user = UserModel.fromJson({
    "id" : "1",
    "name":"Merveille",
    "email": "merveille.com"
  });

   save () async{
    SharedPreferences p  = await SharedPreferences.getInstance();
    // conversion de notre user en string
    // c est la méthode toMap qui va nous permettre de prendre les données en map et de les convertir en json string
    p.setString("user", "Merveille");
    p.commit();
  }

  getTest() async{
    String t = "" ;
    var p = await SharedPreferences.getInstance();
    t = p.getString("user")!;
    print(t);
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton( icon: Icon(FontAwesomeIcons.signOutAlt, color: Colors.white,), onPressed: (){
           widget.login.call();
           UserModel.logOut();
          })
        ],
      ),
      body:Container(
        child: Center(
          child:  ElevatedButton(onPressed: (){
            UserModel.getUser();

          }, child: null,),
        ),
      ) ,
    )  ;
  }
}
*/