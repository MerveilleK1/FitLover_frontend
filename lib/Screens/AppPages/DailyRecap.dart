import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obesity_tracking_app2/Screens/AppPages/Thanks.dart';
import 'Recap&Emphelungen.dart';
import 'Entries.dart';
import 'gamification.dart';



class DailyRecap extends StatefulWidget {
  //final List<String> recommendations;

  final String water;
  final String sweetmeats;
  final String alcohol;
  final String stressLevel;
  final String activityLevel;

  const DailyRecap({
   // required this.recommendations,
    required this.water,
    required this.sweetmeats,
    required this.alcohol,
    required this.stressLevel,
    required this.activityLevel,
    Key? key,
  }) : super(key: key);
  @override
  State<DailyRecap> createState() => _DailyRecapState();
}

class _DailyRecapState extends State<DailyRecap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your recap"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 5, top: 10,right: 5,bottom: 5),

            child: Column(
              children: [
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        "Parameters",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.redAccent),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Values",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.redAccent),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(
                        Text(
                          "Water (L)",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800, color: Colors.blue),
                        ),
                      ),
                      DataCell(
                        Text(
                          widget.water,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text(
                          "Sweetmeats (in gramm)",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800, color: Colors.blue),
                        ),
                      ),
                      DataCell(
                        Text(
                          widget.sweetmeats,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text(
                          "Alcohol (in mL)",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800, color: Colors.blue),
                        ),
                      ),
                      DataCell(
                        Text(
                          widget.alcohol,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text(
                          "Stress level( /3)",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800, color: Colors.blue),
                        ),
                      ),
                      DataCell(
                        Text(
                          widget.stressLevel,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text(
                          "Activity level( /3)",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800, color: Colors.blue),
                        ),
                      ),
                      DataCell(
                        Text(
                          widget.activityLevel,
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ]),
                  ],
                  // Add borders around the entire table
                  // Set the `horizontalMargin` and `columnSpacing` as needed
                  border: TableBorder.all(
                    color: Colors.black26,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                SizedBox(height: 20),



                ElevatedButton(onPressed: () {

                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>  Emphelungen() ));

                },
                  child: Text("Validate"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  ),

                )


              ],


            ),

          ),
        ),
      ),
    );
  }
}







