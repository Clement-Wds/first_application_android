import 'package:cloud_firestore/cloud_firestore.dart';

class Profile{
  String name = "";
  String lastname = "";
  String image= "";
  DateTime birthday = DateTime.now();

  Profile(DocumentSnapshot snapshot){
    String uid = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    name = map["PRENOM"];
    lastname = map["NOM"];
    image = map["IMAGE"];

    //Timestamp time = map["BIRHTDAY"];
    //birthday = time.toDate();
  }

  Profile.Empty();
}