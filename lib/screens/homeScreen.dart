import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String idScreen = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: Text("Logado com sucesso!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
