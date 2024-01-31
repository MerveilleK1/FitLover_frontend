// Exemple de classe contrôleur pour gérer la session utilisateur
import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/model/userModel/userModel.dart';

class UserController {
  UserModel? currentUser;

  void loginUser(String username) {
    currentUser = UserModel(username);
  }

  void logoutUser() {
    currentUser = null;
  }
}
