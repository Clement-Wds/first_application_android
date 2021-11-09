//Importation
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Firestoragehelper{
  //Variables
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  final firestore_profil = FirebaseFirestore.instance.collection("profil");

  //Méthodes
  register(String mail, String password) async{
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
    User user = result.user!;
    String uid = user.uid;
    Map <String, dynamic> map = {
      "nom": "Walsh de Serrant",
      "prenom" : "Clément"
    };
    addUser(map, uid);
  }

  Future <User> connect(String mail, String password) async{
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: password);
    User user = result.user!;
    return user;
  }

  addUser(Map<String, dynamic> map, String indentifiant){

  }
}