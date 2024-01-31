import 'package:flutter/material.dart';

class Thanks extends StatefulWidget {
  const Thanks({super.key});

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
        ),
        backgroundColor: Colors.transparent,
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Congratulations ! ",  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white, fontFamily: 'Poppins'),

              ),

              SizedBox(height: 0),
              Text("See you tomorrow !",
                style:  TextStyle(
                    fontSize: 30, color: Colors.white
                ),

              ),
              SizedBox(height: 10,),



            ],
          ),
        ),


      ),



    );

  }
}
