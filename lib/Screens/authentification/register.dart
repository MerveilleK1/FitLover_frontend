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









import 'package:flutter/material.dart';
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
}

