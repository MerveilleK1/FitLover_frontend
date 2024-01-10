import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/AppPages/DailyRecap.dart';
import 'package:obesity_tracking_app2/Screens/AppPages/transitionlogin-entries.dart';
import 'package:obesity_tracking_app2/Screens/homePage.dart';

import 'Screens/AppPages/Entries.dart';
import 'Screens/authentification/login.dart';
import 'Screens/authentification/login_connexion.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
 // late Future<Request> futureAlbum;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // pour faire disparaitre la banniere de Debug sur l'ecran
      home: //transitionLogin_Entries(),
      //Entries(),
      HomePage(),
      //DailyRecap(),
    );
  }
  }







