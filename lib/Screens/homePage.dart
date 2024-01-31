import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/authentification/login.dart';

import '../model/userModel/userModel.dart';
import 'Home/home.dart';
import 'authentification/register.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true;



  void toggle(){
    setState(() {
      visible = !visible; // ceci permet le basculement de login à register et de register à login
    });
  }


  @override
  Widget build(BuildContext context) {
    return visible? Login(toggle):Register(toggle);



  }
}

// Our loginpage  is considerated initially as the home page



/*class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true, login = false;

  isConnected() async{
    UserModel.getUser();
    if(UserModel.sessionUser == ""){
      setState((){
        login = false;

      });
    }else{
      setState(() {
        login = true;
      });
    }
  }

  void toggle(){
    setState(() {
      visible = !visible; // ceci permet le basculement de login à register et de register à login
    });
  }
  islogin(){
    setState(() {
      login =! login;

    });
  }
  @override
  void initState(){
    super.initState();
    isConnected();


  }


  @override
  Widget build(BuildContext context) {
    return login?Home(login: islogin):visible? Login(toggle, islogin):Register(toggle);



  }
}*/

