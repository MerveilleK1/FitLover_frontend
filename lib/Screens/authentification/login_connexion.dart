/*import 'dart:convert';


import 'package:http/http.dart' as http;


Future<Request> login_Connexion() async {
  final response = await http
  .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Request.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
// This class contains the data from the network request




class Request {
  final String email;
  final String password;


  const Request({
  required this.email,
  required this.password,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'email': String email,
      'password': String password,
      } =>
          Request(
            email: email,
            password: password,
          ),
      _ => throw const FormatException('Failed to load request.'),
    };
  }


}*/


