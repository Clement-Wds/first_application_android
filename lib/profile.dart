import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: const Text('Profile Page'),
        centerTitle: true,
      ),
        body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return StreamBuilder<QuerySnapshot>(
        stream: Firestorehelper().firestoreProfil.snapshots(),
        builder: (BuildContext context, snapshot){
          if (!snapshot.hasData){
            return const CircularProgressIndicator();
          }
          else
          {
            List documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index){
                Profile user = Profile(documents[index]) ;
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(user.name),
                          Text(" "),
                          Text(user.lastname)
                        ],
                      ),
                      Image.network(user.image, width: 200, height: 200),
                    ],

                  ),
                );
              },
            );

          }
        }
    );
  }
}