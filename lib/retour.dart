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
  var date;
  var image;
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
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            children: [
              recupererNom(),
              Text('Afficher prenom'),
              Text('Afficher date de naissance'),
              Text('Afficher image'),
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
        onChanged: (text){
          setState(() {
            nom = text;});
        });

  }


}
