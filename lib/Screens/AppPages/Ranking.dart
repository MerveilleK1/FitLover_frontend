import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}
class _RankingState extends State<Ranking> {
  List<Map<String, dynamic>> ranking = [];

  @override
  void initState() {
    super.initState();
    fetchRankingData();
  }

  Future<void> fetchRankingData() async {
    final userId = '65b04829a396b'; // id of the user with the email ch.com

    try {
      final response = await http.post(
        Uri.parse('http://192.168.178.22/dashboard/mHealthProject/gamification_ranking.php'),
        body: {'userId': userId},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> rankingData = json.decode(response.body);
        String userId = rankingData['id']; // Modification ici
        int points = rankingData['points']; // Modification ici

        setState(() {
          ranking = [
            {'userId': userId, 'points': points},
          ];
        });
      } else {
        print('Request error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
        actions: [
          IconButton(
            onPressed: () {
              logOut(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Position !",
              style: TextStyle(fontSize: 35, color: Colors.redAccent, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ranking.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('User ID: ${ranking[index]['userId']}'),
                  subtitle: Text('Points: ${ranking[index]['points']}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.clear(); // Efface toutes les données enregistrées

  }
}










/*
First test code of ranking

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Efface toutes les données enregistrées
    // exit(0);
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login( widget.visible)));
  }

  Future<void> fetchRankingData() async {
    final userId = '65b04829a396b';

    final response = await http.post('http://192.168.178.22/dashboard/mHealthProject/gamification.php' as Uri, body: {
      'userId': userId,
    });
    //final response = await http.post('http://192.168.178.22/dashboard/mHealthProject/gamification.php' as Uri);
    //Uri.parse("http://141.45.43.215/dashboard/mHealthProject/login.php"),

    if (response.statusCode == 200) {
      // Analyser la réponse JSON
      Map<String, dynamic> rankingData = json.decode(response.body);

      String userId = rankingData['userId'];
      int points = rankingData['points'];

      print('User ID: $userId, Points: $points');
    } else {
      print('Error : ${response.statusCode}');
    }
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
              Text("Your Position !",  style: TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'Poppins'),

              ),

              SizedBox(height: 20),

              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>  Entries() ));


              }, child: Icon(Icons.navigate_next, color: Colors.white, size: 30),

              ),
            ],
          ),
        ),  ),
 );
  }
}*/
