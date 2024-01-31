import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obesity_tracking_app2/Screens/AppPages/Entries.dart';
import 'gamification.dart'; // Importez votre classe UserPoints ici

class Emphelungen extends StatefulWidget {
  final List<String> recommendations;
  final String water;
  final String sweetmeats;
  final String alcohol;
  final String stressLevel;
  final String activityLevel;

  Emphelungen({
    required this.recommendations,
    required this.water,
    required this.sweetmeats,
    required this.alcohol,
    required this.stressLevel,
    required this.activityLevel,
  });

  @override
  State<Emphelungen> createState() => _EmphelungenState();
}

class _EmphelungenState extends State<Emphelungen> {
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
        ),
        backgroundColor: Colors.transparent,
        body: Center(
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
                // for the table
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
                // Set the `horizontalMargin` and `columnSpacing`
                border: TableBorder.all(
                  color: Colors.black26,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              SizedBox(height: 10),

              Container(
                child: const Icon(FontAwesomeIcons.crown, color: Colors.yellowAccent, size: 120),
              ),
              Text(
                "Daily Recommendations !! ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: widget.recommendations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          widget.recommendations[index],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Gamification(
                        water: widget.water,
                        sweetmeats: widget.sweetmeats,
                        alcohol: widget.alcohol,
                        stressLevel: widget.stressLevel,
                        activityLevel: widget.activityLevel,
                      ),
                    ),
                  );

                },
                child: Text("My record"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
