import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/authentification/login_connexion.dart';
import 'package:obesity_tracking_app2/widgets/customTextField.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../AppPages/transitionlogin-entries.dart';

class Login extends StatefulWidget {

  final VoidCallback visible; // Je modifie la fonction visible dans les widgets login et register
  const Login(this.visible,{Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String error = "";

  void loginUser(String email, String password) async {
    setState(() {
      error= "";
    });
    try {
      final response = await http.post(
        Uri.parse("http://192.168.178.22/dashboard/mHealthProject/login.php"), // URL homenetz
       // Uri.parse("http://141.45.43.215/dashboard/mHealthProject/login.php"), // URL HTW

      body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (kDebugMode) {
           // on sait que à l indice 0 c est le message, et à l indice 1 c est la variable entière success et au 2 c est l utilisateur
          if (data['status'] == 'success') {
            await saveUserLoggedIn(true);
        //connexion réussie
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => transitionLogin_Entries()),
            );
          } else {
            setState(() {
              error = data['message'];

            });
           // print("Login failed: ${data['message']}");
          }
        }
      } else {
        print("HTTP request failed with status: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during HTTP request: $error");
    }
  }

  Future<void> saveUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(userData));
  }

  Future<void> logOut() async {
    await saveUserLoggedIn(false);
    await saveUserData({});
  }


  CustomTextField emailText  = CustomTextField(
    title: "Email",
    placeholder: "Enter Email",

  ) ;
  CustomTextField password  = CustomTextField(
    title: "Password",
    placeholder: "***********",
    ispass: true
  ) ;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "Enter email";
    password.err = "Enter password";

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child:  Form(
              key: _key, // Here, the initialized key
                child: Column(   // we took all from the Column and wrapped it into a Form
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.redAccent, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: Colors.redAccent, size: 120),
                    ),
                    SizedBox(height: 30,),
                    emailText.textFormField(),

                    SizedBox(height: 10,),
                    password.textFormField(),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      FocusScope.of(context).requestFocus(FocusNode());

                       if (_key.currentState != null) {
                       if ( _key.currentState!.validate()) {
                        loginUser(emailText.value, password.value);
                          print(emailText.value);
                          print(password.value); }}},
                      child: Text("Login"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                    ),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Text("No account? "),
                        TextButton(
                          onPressed: widget.visible,
                          child: Text('Register', style: TextStyle(color: Colors.redAccent),),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide.none), // For a button with no bordure = transparent button
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text(error, style:  TextStyle(color: Colors.redAccent), textAlign: TextAlign.center,)
                  ],
                ),
            )
          ),
        ),
      ),
    );
  }
}
