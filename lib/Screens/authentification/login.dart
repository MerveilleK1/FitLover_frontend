import 'package:flutter/material.dart';
import 'package:obesity_tracking_app2/Screens/authentification/login_connexion.dart';
import 'package:obesity_tracking_app2/widgets/customTextField.dart';
import 'package:http/http.dart' as http;
import '../AppPages/transitionlogin-entries.dart';

class Login extends StatefulWidget {
  final VoidCallback visible; // Je modifie la fonction visible dans les widgets login et register
  const Login(this.visible, {Key? key}) : super(key: key);



  // const Login(this.visible,{super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  
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
              key: _key, // Ici je mets ma clé que j'ai initialisé
                child: Column( // On a pris tout ce qui est dans le column et on l'a wrap dans un Form
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.redAccent, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: Colors.redAccent, size: 120),
                    ),
                    // Text("Login", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                    SizedBox(height: 30,),
                    emailText.textFormField(),

                    SizedBox(height: 10,),
                    password.textFormField(),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){

                      if (_key.currentState != null) {
                        if ( _key.currentState!.validate()) {
                          print(emailText.value);
                          print(password.value);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  transitionLogin_Entries() ));

                        }
                      }

                    },
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
                            side: MaterialStateProperty.all(BorderSide.none), // Aucune bordure
                          ),
                        ),
                      ],
                    )


                  ],
                ),
            )
          ),
        ),
      ),
    );
  }
}
