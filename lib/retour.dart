import 'dart:typed_data';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:file_picker/file_picker.dart';
import 'package:first_application/helper/firestorehelper.dart';
import 'package:flutter/cupertino.dart';
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
  String nom = "";
  String prenom = "";
  DateTime dateNaissance = DateTime.now() ;
  String nameImage ="";
  late Uint8List? byteImage;
  String pathImage = "";
  PageController controller = PageController(initialPage : 0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Inscription'),
        centerTitle: true,
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(100),
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width,

          child: PageView(

            controller: controller,
            //scrollDirection: Axis.vertical,
            children: [
              Center(
                  child: recupererNom()
              ),

              Center(
                  child: recupererPrenom()
              ),
              Center(
                  child: recupererDate()
              ),
              Center(
                child: recupererImage()
              ),
            ],
          ),
        ),

        ElevatedButton(
          onPressed: (){
            Map <String, dynamic> map ={
              "PRENOM": prenom,
              "NOM": nom,
              "BIRTHDAY": dateNaissance,
              "IMAGE": pathImage,
            };
            Firestorehelper().register(widget.mail, widget.password, map);
          },
          child: const Text('Enregistrement'),
        ),

      ],
    );

  }
  Widget recupererNom(){
    return TextField(
        decoration: InputDecoration(
          hintText: 'Entrez votre nom',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onChanged: (text){
          setState(() {
            nom = text;});
        });

  }
  Widget recupererPrenom(){
    return TextField(
        decoration: InputDecoration(
          hintText: 'Entrez votre pr??nom',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onChanged: (text){
          setState(() {
            prenom = text;});
        });

  }
  Widget recupererDate(){
    return ElevatedButton.icon(
      onPressed: (){
        dialogHeure();
      },
      icon: const Icon(Icons.access_time),
      label: const Text('Date'),
    );
  }

  dialogHeure(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            content: Container(
              height: 100,
              width: 400,
              color: Colors.white,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.black,
                onDateChange: (date){
                  setState(() {
                    dateNaissance = date;
                  });
                },
              ),
            ),

            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Annuler'),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Valider'),
              ),
            ],
          );
        }
    );
  }

  Widget recupererImage() {
    return ElevatedButton.icon(
      onPressed: () {
        importImages();
      },
      icon: Icon(Icons.upload),
      label: Text('Image'),
    );
  }

  importImages() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );
    if(result!=null){
      setState(() {
        byteImage = result.files.first.bytes;
        nameImage = result.files.first.name;
      });
      afficherImage();
    }
  }
  
  afficherImage(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            content: Image.memory(byteImage!, width: 250, height: 250,),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () async{
                  //Stocker l'image dans la DB
                  await Firestorehelper().stockageImage(nameImage, byteImage!).then((value){
                    setState(() {
                      pathImage = value;
                    });
                  });
                  Navigator.pop(context);
                },
                child: const Text('Enregistrer'),
              ),
            ],
          );
        }
    );
  }

}
