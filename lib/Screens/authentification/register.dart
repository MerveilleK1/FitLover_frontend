/*import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/widgets/customTextField.dart';

class Register extends StatefulWidget {
  final VoidCallback visible;
  const Register(this.visible, {Key? key}) : super(key: key);


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  CustomTextField  userName = CustomTextField(
    title: "Username",
    placeholder: "Enter your username",
  ) ;
  CustomTextField age  = CustomTextField(
      title: "Age",
      placeholder: "Enter your age",
      //ispass: true
  ) ;
  CustomTextField emailText  = CustomTextField(
    title: "Email",
    placeholder: "Enter your Email",
  ) ;
  CustomTextField weight  = CustomTextField(
    title: "Weight(in kg)",
    placeholder: "Enter your weight",
  ) ;
  CustomTextField height  = CustomTextField(
    title: "Height(in cm)",
    placeholder: "Enter your height",                    // Text("Login", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),

  ) ;
  CustomTextField gender  = CustomTextField(
    title: "Gender(M/F)",
    placeholder: "Enter your gender",

  ) ;
  CustomTextField password  = CustomTextField(
    title: "Password",
    placeholder: "*************",
    ispass: true

  ) ;
  CustomTextField password2  = CustomTextField(
    title: "Confirm password",
    placeholder: "************",
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
                key: _key, // Ici je mets ma clé que j'ai initialisé
                child: Column( // On a pris tout ce qui est dans le column et on l'a wrap dans un Form
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                     Text("Register", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                    SizedBox(height: 30,),
                    userName.textFormField(),
                    SizedBox(height: 10,),
                    age.textFormField(),
                    SizedBox(height: 10,),
                    emailText.textFormField(),
                    SizedBox(height: 10,),
                    weight.textFormField(),
                    SizedBox(height: 10,),
                    height.textFormField(),
                    SizedBox(height: 10,),
                    gender.textFormField(),
                    SizedBox(height: 10,),
                    password.textFormField(),
                    SizedBox(height: 10,),
                    password2.textFormField(),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      if (_key.currentState != null) {
                        if (_key.currentState!.validate()) {
                          print(emailText.value);
                          print(password);

                        }
                      }
                    },
                      child: Text("Register"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),

                    ),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Text("Do you have an account? "),
                        TextButton(
                          onPressed: widget.visible,
                          child: Text('Login', style: TextStyle(color: Colors.redAccent),),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide.none), // Aucune bordure
                          ),
                        ),
                      ],
                    )


                  ],
                ),)
          ),
        ),
      ),
    );
  }
}*/









/*import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/widgets/customTextField.dart';

class Register extends StatefulWidget {
  final VoidCallback visible;
  const Register(this.visible, {Key? key}) : super(key: key);


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  CustomTextField  userName = CustomTextField(
    title: "Username",
    placeholder: "Enter your username",
  ) ;
  CustomTextField age  = CustomTextField(
    title: "Age",
    placeholder: "Enter your age",
    //ispass: true
  ) ;
  CustomTextField emailText  = CustomTextField(
    title: "Email",
    placeholder: "Enter your Email",
  ) ;
  CustomTextField weight  = CustomTextField(
    title: "Weight(in kg)",
    placeholder: "Enter your weight",
  ) ;
  CustomTextField height  = CustomTextField(
    title: "Height(in cm)",
    placeholder: "Enter your height",                    // Text("Login", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),

  ) ;
  CustomTextField gender  = CustomTextField(
    title: "Gender(M/F)",
    placeholder: "Enter your gender",

  ) ;
  CustomTextField password  = CustomTextField(
      title: "Password",
      placeholder: "*************",
      ispass: true

  ) ;
  CustomTextField password2  = CustomTextField(
      title: "Confirm password",
      placeholder: "************",
      ispass: true

  ) ;

  String selectedStatus = 'female';




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
                key: _key, // Ici je mets ma clé que j'ai initialisé
                child: Column( // On a pris tout ce qui est dans le column et on l'a wrap dans un Form
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Text("Register", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                    SizedBox(height: 30,),
                    userName.textFormField(),
                    SizedBox(height: 10,),
                    age.textFormField(),
                    SizedBox(height: 10,),
                    emailText.textFormField(),
                    SizedBox(height: 10,),
                    weight.textFormField(),
                    SizedBox(height: 10,),
                    height.textFormField(),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only (bottom: 10),
                      child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(value: 'female', child: Text("Female")),
                            DropdownMenuItem(value: 'male', child: Text("Male"))
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                          value:selectedStatus,
                          onChanged: (value){
                            setState(() {
                              selectedStatus = value!;
                            });
                          }
                      ),
                    ),                    SizedBox(height: 10,),
                    password.textFormField(),
                    SizedBox(height: 10,),
                    password2.textFormField(),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      if (_key.currentState != null) {
                        if (_key.currentState!.validate()) {
                          print(emailText.value);
                          print(password);

                        }
                      }
                    },
                      child: Text("Register"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),

                    ),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Text("Do you have an account? "),
                        TextButton(
                          onPressed: widget.visible,
                          child: Text('Login', style: TextStyle(color: Colors.redAccent),),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide.none), // Aucune bordure
                          ),
                        ),
                      ],
                    )


                  ],
                ),)
          ),
        ),
      ),
    );
  }
}*/





import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/authentification/login.dart';
import 'package:obesity_tracking_app2/widgets/customTextField.dart';
import 'package:http/http.dart' as http;


class Register extends StatefulWidget {
  final VoidCallback visible;
  const Register(this.visible, {Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  void registerUser(Map<String, dynamic> userData) async {
    // here we call the register API and send the data to the backend


    String apiUrl = "http://192.168.178.22//dashboard/mHealthProject/registrierung.php";
    //String apiUrl = "http://141.45.43.215//dashboard/mHealthProject/registrierung.php";

 //En-tete de la requete
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      // here is the conversion the object in JSON format
      String jsonUserData = jsonEncode(userData);

      // request sended
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonUserData,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 'success') {

          print("Inscription réussie: ${jsonResponse['message']}");
          Navigator.pop(context); // to come back to the login page

        } else {
          print("Erreur d'inscription: ${jsonResponse['message']}");
        }
      } else {
        print("Erreur de requête: ${response.statusCode}");
      }
    } catch (e) {
      print("Erreur lors de l'envoi de la requête: $e");
    }



  }


  CustomTextField userName = CustomTextField(
    title: "Username",
    placeholder: "Enter your username",
  );
  CustomTextField age = CustomTextField(
    title: "Age",
    placeholder: "Enter your age",
  );
  CustomTextField emailText = CustomTextField(
    title: "Email",
    placeholder: "Enter your Email",
  );
  CustomTextField weight = CustomTextField(
    title: "Weight(in kg)",
    placeholder: "Enter your weight",
  );
  CustomTextField height = CustomTextField(
    title: "Height(in cm)",
    placeholder: "Enter your height",
  );
  CustomTextField gender = CustomTextField(
    title: "Gender(M/F)",
    placeholder: "Enter your gender",
  );
  CustomTextField password = CustomTextField(
    title: "Password",
    placeholder: "*************",
    ispass: true,
  );
  /*CustomTextField password2 = CustomTextField(
    title: "Confirm password",
    placeholder: "************",
    ispass: true,
  );*/

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
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 30),
                  userName.textFormField(),
                  SizedBox(height: 10),
                  age.textFormField(),
                  SizedBox(height: 10),
                  emailText.textFormField(),
                  SizedBox(height: 10),
                  weight.textFormField(),
                  SizedBox(height: 10),
                  height.textFormField(),
                  SizedBox(height: 10),
                  gender.textFormField(),
                  SizedBox(height: 10),
                  password.textFormField(),
                  SizedBox(height: 10),
                  //password2.textFormField(),
                  //SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState != null) {
                        if (_key.currentState!.validate()) {
                          // Créer un objet représentant les données de l'utilisateur
                          Map<String, dynamic> userData = {
                            "username": userName.value,
                            "age": age.value,
                            "email": emailText.value,
                            "weight": weight.value,
                            "height": height.value,
                            "gender": gender.value,
                            "password": password.value,
                          };

                          // Utiliser userData pour envoyer les données à votre backend (API, etc.)
                          // Appeler la fonction d'enregistrement sur le backend
                          registerUser(userData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login(() { })),
                          );

                        }
                      }
                    },
                    child: Text("Register"),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you have an account? "),
                      TextButton(
                        onPressed: widget.visible,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide.none),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}


