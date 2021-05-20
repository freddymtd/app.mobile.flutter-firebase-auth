import 'package:flutter/material.dart';
import 'package:uber_firebase/screens/loginScreen.dart';

class RegisterScreen extends StatelessWidget {
  static const String idScreen = "register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  height: 150,
                  child: Image.asset("lib/assets/images/register.png"),
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintStyle: TextStyle(color: Colors.amber, fontSize: 4),
                ),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
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
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone",
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
                  child: Text("Create Account"),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                onPressed: () {},
              ),
              TextButton(
                  child: Text(
                    "Already have an Account? Login Here",
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.idScreen, (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
