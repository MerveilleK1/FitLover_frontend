import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/AppPages/DailyRecap.dart';
import 'package:http/http.dart' as http;

import 'Recap&Emphelungen.dart';



class Entries extends StatefulWidget {
  const Entries({super.key});

  @override
  State<Entries> createState() => _EntriesState();
}

class _EntriesState extends State<Entries> {


  final _formKey = GlobalKey<FormState>();
  String selectedWaterQuantity = "1L";
  String selectedSmQuantity = "100 g";
  String selectedAlQuantity = "200 mL";
  String selectedStressLevel = "Normal";
  String selectedActivLevel = "Not active";
  DateTime selectedDate = DateTime.now();




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Daily consumption"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
              child: Column(
                children: [

                  SizedBox(height: 20,),


                  Text("Fit lover, let us check your daily consumption.", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontFamily: 'Poppins' /*fontWeight: FontWeight.bold*/, color: Colors.black),),
                  SizedBox(height: 20,),

                  Text("How fit where you today ?", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),

                  SizedBox(height: 30,),


                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note), // Pour avoir l 'icone du calendrier juste à coté
                      labelText: 'Select the date',
                    ),
                    mode: DateTimeFieldPickerMode.dateAndTime,
                    autovalidateMode: AutovalidateMode.always,

                    validator: (e) {
                      if (e == null) {
                        return 'Please select a date';
                      } else if (e.day == 1) {
                        return 'Please not the first day';
                      } else {
                        return null;
                      }
                    },
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                  ),

                  SizedBox(height: 20,),

                  Text("Water (in Liter)", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),


                  DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: "< 1L", child:  Text("< 1L")),
                        DropdownMenuItem(value: "1L", child:  Text(" 1L")),
                        DropdownMenuItem(value: "> 1L", child:  Text(" > 1L")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          selectedWaterQuantity = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),

                  Text("Sweetmeats (in gram) ", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: "- 100 g", child:  Text("- 100 g")),
                        DropdownMenuItem(value: "100 g", child:  Text("100 g")),
                        DropdownMenuItem(value: "+ 100 g", child:  Text("+ 100 g")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                      //value: selectedSmQuantity,
                      onChanged: (value){
                        setState(() {
                          selectedSmQuantity = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),

                  Text("Alcohol (in mL)", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: "[0 - 200 mL]", child:  Text("[0 - 200 mL]")),
                        DropdownMenuItem(value: "200 mL", child:  Text("200 mL")),
                        DropdownMenuItem(value: "+ 200 mL", child:  Text("+ 200 mL")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          selectedAlQuantity = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),

                  Text("Stress level( /3 )", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: "No stress", child:  Text("1= No stress ")),
                        DropdownMenuItem(value: "Normal", child:  Text("2= Normal")),
                        DropdownMenuItem(value: "Very stressed", child:  Text("3= Very stressed")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          selectedStressLevel = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),
                  Text("Physical activity level( /3 )", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: "Not active", child:  Text("1= Not active")),
                        DropdownMenuItem(value: "Active", child:  Text("2= Active")),
                        DropdownMenuItem(value: "Very active", child:  Text("3= Very active")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          selectedActivLevel = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: () async {
                    if(_formKey.currentState!.validate()){
                     /* ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Connecting....", style: TextStyle(color:  Colors.redAccent)))
                      );*/
                       // tastatur auszuklappenen
                      FocusScope.of(context).requestFocus(FocusNode());

                      print(" The user drunk  $selectedWaterQuantity of water today. ");

                      List<String> recommendations = [];

                      if (selectedDate != null) {
                         recommendations.add("$selectedDate");
                      }

                          switch (selectedWaterQuantity) {
                            case "< 1L":
                              recommendations.add(
                                  "- Increase your water intake.");
                              break;
                            case "1L":
                              recommendations.add("- You have good hydration.");
                              break;
                            case ">1L":
                              recommendations.add(
                                  "- Maintain your water consumption.");
                              break;
                          }

                          switch (selectedSmQuantity) {
                            case "- 100 g":
                              recommendations.add(
                                  "- Good that you did not eat too much sugar!\n");
                              break;
                            case "100 g":
                              recommendations.add(
                                  "- You have a moderate consumption of sweets and meats.\n");
                              break;
                            case "+ 100 g":
                              recommendations.add(
                                  "- Try to eat less sugar tomorrow fitLover .\n");
                              break;
                          }

                          switch (selectedAlQuantity) {
                            case "[0 - 200 mL]":
                              recommendations.add(
                                  "- Great job ! Maintain your alcohol consumption .\n");
                              break;
                            case "200 mL":
                              recommendations.add(
                                  "- You have a moderate alcohol consumption!\n");
                              break;
                            case "+ 200 mL":
                              recommendations.add(
                                  "- Reduce alcohol consumption.\n");
                              break;
                          }

                          switch (selectedStressLevel) {
                            case "1= No stress":
                              recommendations.add(
                                  "- You seem to be in a state of relaxation, keep it up.\n");
                              break;
                            case "2= Normal":
                              recommendations.add(
                                  "- You are in a normal state of stress, find ways to relax.\n");
                              break;
                            case "3= Very stressed":
                              recommendations.add(
                                  "- You are very stressed, take time to relax and destress.\n");
                              break;
                          }

                          switch (selectedActivLevel) {
                            case "1= Not active":
                              recommendations.add(
                                  "- You seem to be not really active. Activity is the Key Fitlover\n");
                              break;
                            case "2= Active":
                              recommendations.add(
                                  "- Great ! Maintain or be more active tomorrow .\n");
                              break;
                            case "3= Very active":
                              recommendations.add(
                                  "- Good Job fitlover ! Activity is the key !.\n");
                              break;
                          }
                      for (String recommendation in recommendations) {
                        print(recommendation);
                      }

                     Navigator.push(context, MaterialPageRoute(builder: (context)=>  Emphelungen(
                       recommendations: recommendations,
                       water: selectedWaterQuantity,
                       sweetmeats: selectedSmQuantity,
                       alcohol: selectedAlQuantity,
                       stressLevel: selectedStressLevel,
                       activityLevel: selectedActivLevel,

                     )));


                     await sendUserData();


                    }
                  },
                    child: Text("Finished"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                    ),

                  ),
                ],
              )
          ),
        ),
      ),


      );


  }



  Future<void> sendUserData() async {
    final response = await http.post(
     // Uri.parse('http://141.45.43.215/dashboard/mHealthProject/addDailyInfo.php'),
      Uri.parse('http://192.168.178.22/dashboard/mHealthProject/addDailyInfo.php'),

      body: json.encode({
        'date': selectedDate.toString(),
        'water': selectedWaterQuantity,
        'sweetmeats': selectedSmQuantity,
        'alcohol': selectedAlQuantity,
        'stressLevel': selectedStressLevel,
        'activityLevel': selectedActivLevel,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
/*

var data = jsonDecode(response.body);
        if (kDebugMode) {
           // on sait que à l indice 0 c est le message, et à l indice 1 c est la variable entière success et au 2 c est l utilisateur
          if (data['status'] == 'success') {
            await saveUserLoggedIn(true);
 */
      if (result['status'] == 'success') {
        print('Data sent and recorded successfully.');
        //print(result['message']); // C'est le message du serveur

/*

//recommendations in frontend bearbeiten

        // Traitement des données brutes pour afficher des recommandations
        Map<String, dynamic> rawData = result['rawData'];
        print('Raw Data: $rawData');

        // ... Ajoutez votre logique de recommandation ici en fonction des valeurs brutes

        List<String> recommendations = [];
        if(rawData['date'] != null) {
        //  recommendations.add("Today");
        }
        // Vérifier la consommation d'eau
        switch (rawData['water']) {
          case "< 1L":
            recommendations.add("Increase your water intake.");
            break;
          case "1L":
            recommendations.add("You have good hydration.");
            break;
          case ">1L":
            recommendations.add("Maintain your water consumption.");
            break;
        }

        switch (rawData['sweetmeats']) {
          case "- 100 g":
            recommendations.add("- Good that you did not eat too much sugar!\n");
            break;
          case "100 g":
            recommendations.add("- You have a moderate consumption of sweets and meats.\n");
            break;
          case "+ 100 g":
            recommendations.add("- Try to eat less sugar tomorrow fitLover .\n");
            break;
        }

        switch (rawData['alcohol']) {
        case "[0 - 200 mL]":
          recommendations.add( "- Great job ! Maintain your alcohol consumption .\n");
        break;
        case "200 mL":
          recommendations.add( "- You have a moderate alcohol consumption!\n");
        break;
        case "+ 200 mL":
          recommendations.add( "- Reduce alcohol consumption.\n");
        break;
        }

        switch (rawData['stressLevel']) {
        case "1= No stress":
        recommendations.add( "- You seem to be in a state of relaxation, keep it up.\n");
        break;
        case "2= Normal":
        recommendations.add( "- You are in a normal state of stress, find ways to relax.\n");
        break;
        case "3= Very stressed":
        recommendations.add( "- You are very stressed, take time to relax and destress.\n");
        break;
        }

        switch (rawData['activityLevel']) {
        case "1= Poor":
        recommendations.add("- You seem to be not really active. Activity is the Key Fitlover\n");
        break;
        case "2= Active":
        recommendations.add( "- Great ! Maintain or be more active tomorrow .\n");
        break;
        case "3= Very active":
        recommendations.add( "- Good Job fitlover ! Activity is the key !.\n");
        break;
        }


        // Affichez les recommandations dans la console
        for (String recommendation in recommendations) {
          print('Recommendation: $recommendation');
        }*/
      } else {
        print('Error sending or recording data.');
      }
    } else {
      print('Failed to send or record data. Status code: ${response.statusCode}');
    }
  }

}
