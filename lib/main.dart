import 'package:flutter/material.dart';
import 'package:uber_firebase/screens/loginScreen.dart';
import 'package:uber_firebase/screens/registerScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FirebaseApp',
      initialRoute: LoginScreen.idScreen,
      routes: {
        RegisterScreen.idScreen: (context) => RegisterScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
      },
    );
  }
}
