import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  String identifiant;
  ProfilePage({required String this.identifiant});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        centerTitle: true,
      ),
      body: Text(widget.identifiant),
    );
  }
}