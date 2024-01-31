import 'dart:convert';
import 'dart:io';


import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  final String email;

  UserModel(this.email);

  String get userFilePath => "C:/xampp/htdocs/dashboard/mHealthProject/Users and Entries/$email.txt";

  void writeUserData(String data) {
    File(userFilePath).writeAsStringSync(data);
  }

  String readUserData() {
    return File(userFilePath).readAsStringSync();
  }
}




/*
class UserModel {
  String id ;
  String username;
  String email;
  UserModel({ this.id = "", this.username= "", this.email= ""});

   static UserModel sessionUser = new UserModel();
  //   // deuxieme constructeur , qui lui peut retourner des valeurs, contrairement au constructer usermodel par défaut
  factory UserModel.fromJson(Map<String, dynamic> i) => UserModel(
      id: i["id"], username: i["username"], email: i["email"]
  );

  Map<String, dynamic> toMap()=> {
    "id": id,
    "username": username,
    "email": email
  };
 // méthode qui va récupérer un utilisateur et le sauvegarder dans la mémoire cache
static void saveUser(UserModel user) async{
  SharedPreferences pref  = await SharedPreferences.getInstance();
  // conversion de notre user en string
  // c est la méthode toMap qui va nous permettre de prendre les données en map et de les convertir en json string

  var data = json.encode(user.toMap());
  pref.setString("user", data);
  pref.commit();
}

// fonction qui doit faire un getuser
static void getUser() async {
  SharedPreferences pref  = await SharedPreferences.getInstance();
  var data = pref.getString("user"); // ici on met juste la clé user que nous avons mis lors de la sauvegarde des données
  if(data != null){
    var decode = json.decode(data!);
    var user = await UserModel.fromJson(decode);
    sessionUser = user;
  }else{
    sessionUser = null as UserModel;
  }
}

static void logOut() async{
  SharedPreferences p = await SharedPreferences.getInstance();
  p.setString("user", "");
  sessionUser = null as UserModel ;
  p.commit();
}

}*/
