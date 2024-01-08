import 'package:flutter/material.dart';

import 'Entries.dart';

class transitionLogin_Entries extends StatelessWidget {

  const transitionLogin_Entries({
    super.key});



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
          // Ajoutez d'autres propriétés de AppBar selon vos besoins
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

              )


            ],
          ),
        ),


      ),



    );



    //return const Login();

    /*return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Column(


          children:[
            Text("Welcome fitLover !", style: TextStyle(fontSize: 35,
              fontFamily: 'Poppins'),
            ),
    ],

          ),

    ),

    );*/

    /*return Container(
      color: Colors.white,

      child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome fitLover !",
                style: TextStyle(
                    fontSize:  35,
                    fontFamily: 'Poppins'
                ),
              ),
              SizedBox(height: 20),
              Text("Learn, taking care of yourself !",
                style:  TextStyle(
                    fontSize: 20
                ),
                //textAlign:  TextAlign.center,
              ),
              //Padding(padding: EdgeInsets.only(top: 20)),

            ],
          )
      ),
    );*/

  }
}