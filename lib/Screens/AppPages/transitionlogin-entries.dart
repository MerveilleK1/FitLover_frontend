import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentification/login.dart';
import '../homePage.dart';
import 'Entries.dart';

class transitionLogin_Entries extends StatelessWidget {
  const transitionLogin_Entries({ // Ajoutez cette ligne
    Key? key,
  }) : super(key: key);


  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   // await prefs.clear(); // delete all the saved informations
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.red,
            ],
          )
      ),
      child:  Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            IconButton(
              onPressed: () {
             logOut(context);
             exit(0);
              },
              icon: Icon(Icons.logout),
            ),
          ],

        ),
        backgroundColor: Colors.transparent,
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Welcome Fitlover !",  style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Poppins'),

              ),

              SizedBox(height: 20),
              Text("Learn, taking care of yourself !",
                style:  TextStyle(
                    fontSize: 20, color: Colors.white
                ),

              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  Entries() ));

                }, child: Icon(Icons.navigate_next, color: Colors.white, size: 30),

              ),
            ],
          ),
        ),
      ),
    );
  }
}