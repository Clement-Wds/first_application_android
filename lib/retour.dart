import 'package:flutter/material.dart';

class Retour extends StatefulWidget{
  String mail;
  String password;
  Retour({required this.mail, required this.password});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RetourState();
  }

}

class RetourState extends State<Retour>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deuxième page'),
        centerTitle: true,
      ),
      body: Text('mon adresse mail est la suivante : ${widget.mail} et le mot de passe est ${widget.password}'),
      backgroundColor: const Color(0xFF003296),
    );
  }

}