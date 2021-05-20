import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_firebase/main.dart';
import 'package:uber_firebase/screens/homeScreen.dart';
import 'package:uber_firebase/screens/registerScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
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
                controller: emailTextEditingController,
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
                controller: passwordTextEditingController,
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
                onPressed: () {
                  if (!emailTextEditingController.text.contains("@")) {
                    displayToastMessage(
                        "O endereço de e-mail não é válido", context);
                  } else if (passwordTextEditingController.text.isEmpty) {
                    displayToastMessage("A senha é obrigatório", context);
                  } else {
                    loginAndAuthenticateUser(context);
                  }
                },
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errorMsg) {
      displayToastMessage("Error: " + errorMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.idScreen, (route) => false);
          displayToastMessage("Logado com sucesso", context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              "Usuário não registrado, Por favor crie uma conta", context);
        }
      });
    } else {
      displayToastMessage("Erro não login não realizado", context);
    }
  }
}
