import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/authentification/login.dart';

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
