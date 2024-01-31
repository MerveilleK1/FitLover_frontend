import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Ranking.dart';

class Gamification extends StatefulWidget {
  final String water;
  final String sweetmeats;
  final String alcohol;
  final String stressLevel;
  final String activityLevel;


  const Gamification({super.key, required this.water, required this.sweetmeats, required this.alcohol, required this.stressLevel, required this.activityLevel});

  @override
  State<Gamification> createState() => _GamiState();
}



class _GamiState extends State<Gamification> {

  int points = 0;

  @override
  void initState() {
    super.initState();
    fetchUserPoints();
  }

  Future<void> fetchUserPoints() async {
   // final url = 'http://141.45.43.215/dashboard/mHealthProject/gamification.php';  // URL HTW
    final url = 'http://192.168.178.22/dashboard/mHealthProject/gamification.php'; // URL Homenetz

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'water': widget.water,
        'sweetmeats': widget.sweetmeats,
        'alcohol': widget.alcohol,
        'stressLevel': widget.stressLevel,
        'activityLevel': widget.activityLevel,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        points = data['points'] ?? 0;
      });
    } else {
      throw Exception('Failed to load user points');
    }
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Efface toutes les données enregistrées

    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login( widget.visible)));
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
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: [
            IconButton(
              onPressed: () {

                logOut(context);
                exit(0); // close the app
              },
              icon: Icon(Icons.logout),
            ),
          ],

        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Container(
                child: const Icon(FontAwesomeIcons.jetFighter, color: Colors.yellowAccent, size: 120),
              ),
              Text(
                "Your record !! ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text('Total Points: $points',
                style: TextStyle(fontSize: 24),),
              SizedBox(height: 30),

              Text(
                "See you tomorrow !",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),

                ),
              ),
              SizedBox(height: 20),

             /*  Next page should be the page of ranking


             ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Ranking()));
              }, child:  Text("My record"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),)*/

            ],
          ),
        ),
      ),
    );
  }
}
