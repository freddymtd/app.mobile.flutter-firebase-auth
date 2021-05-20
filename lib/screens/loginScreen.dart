import 'package:flutter/material.dart';
import 'package:uber_firebase/screens/registerScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  height: 300,
                  child: Image.asset("lib/assets/images/login.png"),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintStyle: TextStyle(color: Colors.amber, fontSize: 4),
                ),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Passaword",
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintStyle: TextStyle(color: Colors.amber, fontSize: 4),
                ),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Container(
                  child: Text("Sing In"),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                onPressed: () => print("object"),
              ),
              TextButton(
                  child: Text(
                    "Do not have an Account? Register Here",
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RegisterScreen.idScreen, (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
