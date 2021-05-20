import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_firebase/main.dart';
import 'package:uber_firebase/screens/homeScreen.dart';
import 'package:uber_firebase/screens/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

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
                controller: nameTextEditingController,
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
                controller: phoneTextEditingController,
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
                  child: Text("Create Account"),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                onPressed: () {
                  if (nameTextEditingController.text.length < 4) {
                    displayToastMessage(
                        "Nome deve conter no mínimo 4 caracteres", context);
                  } else if (!emailTextEditingController.text.contains("@")) {
                    displayToastMessage(
                        "O endereço de e-mail não é válido", context);
                  } else if (phoneTextEditingController.text.isEmpty) {
                    displayToastMessage(
                        "O número de contato é obrigatório", context);
                  } else if (passwordTextEditingController.text.length < 6) {
                    displayToastMessage(
                        "A senha é obrigatório ter no mínimo 5 caracteres",
                        context);
                  } else {
                    registerNewUser(context);
                  }
                },
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errorMsg) {
      displayToastMessage("Error: " + errorMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Cadastro feito com sucesso!", context);
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.idScreen, (route) => false);
    } else {
      displayToastMessage("Usuário não cadastrado", context);
    }
  }
}

displayToastMessage(String msg, BuildContext context) {
  Fluttertoast.showToast(msg: msg);
}
