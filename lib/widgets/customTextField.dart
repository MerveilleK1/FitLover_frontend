import 'package:flutter/material.dart';

class CustomTextField{
  final String  title;
  final String placeholder;
  final bool ispass;
  String  err="";
  String _value = "";

  CustomTextField({ this.title="" , this.placeholder="", this.ispass=false , this.err="Please complete the field"});
  TextFormField textFormField(){
    return TextFormField(
      onChanged: (e){
        _value = e ;
      },
      validator: (e) {
        if (_value.isEmpty) {
          return err;
        }
        return null;
      },
      obscureText: this.ispass,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
        labelStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
      ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent)
        )
        ),
      );

  }

  // Ecrivons la méthode qui va récupérer le value
String get value {
    return _value;
}
}