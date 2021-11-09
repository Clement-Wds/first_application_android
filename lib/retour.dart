import 'package:flutter/material.dart';

class Retour extends StatefulWidget{
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
      body: const Text('Bienvenue chez Clément'),
      backgroundColor: const Color(0xFF003296),
    );
  }

}