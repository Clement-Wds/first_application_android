import 'package:first_application/helper/firestorehelper.dart';
import 'package:flutter/material.dart';

import 'model/profile.dart';

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
  Profile utilisateur = Profile.Empty();
  @override
  void initState(){
    //TODO: implement initState
    super.initState();
    Firestorehelper().getProfil(widget.identifiant).then((value){
      setState(() {
        utilisateur = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        centerTitle: true,
      ),
      body: Image.network(utilisateur.image, width: 200, height: 200),
    );
  }
}