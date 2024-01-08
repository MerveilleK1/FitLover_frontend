import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';


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
                    mode: DateTimeFieldPickerMode.date,
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
                    /*validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      print(value);
                    },*/
                  ),

                  SizedBox(height: 20,),

                  Text("Water (in Liter)", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),

                  /*Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText:  "Water (L)" ,
                        ),
                      validator: (value){
                          if(value == null  || value.isEmpty){
                            return" Complete this field";
                          }
                          return null;
                      },
                    ),

                  ),*/


                  DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: "< 1L", child:  Text("< 1L")),
                        DropdownMenuItem(value: "1L", child:  Text(" 1L")),
                        DropdownMenuItem(value: ">1L", child:  Text(" > 1L")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                     // value: selectedWaterQuantity,
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
                        DropdownMenuItem(value: "- 200 mL", child:  Text("- 200 mL")),
                        DropdownMenuItem(value: "200 mL", child:  Text("200 mL")),
                        DropdownMenuItem(value: "+ 200 mL", child:  Text("+ 200 mL")),

                      ],
                      validator: (value){
                        if(value == null  || value.isEmpty){
                          return" Complete this field";
                        }
                        return null;
                      },
                      //value: selectedAlQuantity,
                      onChanged: (value){
                        setState(() {
                          selectedAlQuantity = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),

                  Text("Level of Stress( /3 )", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
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
                      //value: selectedStressLevel,
                      onChanged: (value){
                        setState(() {
                          selectedStressLevel = value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Connecting....", style: TextStyle(color:  Colors.redAccent)))
                      );
                       // pour fermer le clavier:
                      FocusScope.of(context).requestFocus(FocusNode());

                      print(" The user drunk  $selectedWaterQuantity of water today. ");
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
    /*return Container(
      margin: EdgeInsets.all(20),
      child: Form(
          child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText:  "Water (L)" ,
              )
            )
          ],
          )
      ),
    );*/

  }
}
