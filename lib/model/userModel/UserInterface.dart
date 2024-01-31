


// Exemple de widget Flutter pour gérer l'interface utilisateur
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserController.dart';

class UserInterface extends StatelessWidget {
  final UserController userController;

  const UserInterface(this.userController);

  @override
  Widget build(BuildContext context) {
    if (userController.currentUser != null) {
      String userData = userController.currentUser!.readUserData();
      return Text("user data: $userData");
    } else {
      return ElevatedButton(
        onPressed: () {
          userController.loginUser("username");
          userController.currentUser!.writeUserData("use data...");
        },
        child: Text("connect "),
      );
    }
  }
}
