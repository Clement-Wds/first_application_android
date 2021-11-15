//Importation
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Firestorehelper{
  //Variables
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final cloudFirestore = FirebaseFirestore.instance;
  final firestoreProfil = FirebaseFirestore.instance.collection("profil");
  final firestockageImage = FirebaseStorage.instance.ref("imageProfil");

  //Méthodes
  register(String mail, String password, Map<String, dynamic> map) async{
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
    User user = result.user!;
    String uid = user.uid;
    addUser(map, uid);
  }

  Future <User> connect(String mail, String password) async{
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: password);
    User user = result.user!;
    return user;
  }

  addUser(Map<String, dynamic> map, String identifiant){
    firestoreProfil.doc(identifiant).set(map);
  }

  Future stockageImage(String name, Uint8List bytes) async{
    //Stockage de l'image dans la base de données
    TaskSnapshot download = await FirebaseStorage.instance.ref("profil/$name").putData(bytes);
    //récupération du chemin de l'image dans la base de données
    String url = await download.ref.getDownloadURL();
    return url;
  }

}