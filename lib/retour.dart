import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:file_picker/file_picker.dart';
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
  var imageProfil;
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
          padding: EdgeInsets.all(100),
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
            print("élément suivant");
          },
          child: Text('Suivant'),
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
          hintText: 'Entrez votre prénom',
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
      icon: Icon(Icons.access_time),
      label: Text('Date'),
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
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        final file = result.files.first;
      },
      icon: Icon(Icons.folder),
      label: Text('Image'),
    );
  }

}
