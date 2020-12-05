import 'package:chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  /*Firestore.instance.collection("mensagens").document().setData({
    "texto": "Tudo bem? ccccc",
    'from': 'Maria',
    'read': false,
  });*/

/*  Firestore.instance
      .collection('mensagens')
      .document('ddaaqqq89898198883')
      .updateData(
    {"read": true},
  );*/
/*
  QuerySnapshot snapshot =
      await Firestore.instance.collection('mensagens').getDocuments();
  snapshot.documents.forEach((d) {
    d.reference.updateData({"lido": false});
    //print(d.data);
    //print(d.documentID);
  });
*/
  /*
  DocumentSnapshot snapshot =
      await Firestore.instance.collection('mensagens').document('msg2').get();
  print(snapshot.data);
  print(snapshot.documentID);
  */

  Firestore.instance.collection('mensagens').snapshots().listen((dado) {
    dado.documents.forEach((d) {
      print(d.data);
    });

    Firestore.instance
        .collection('mensagens')
        .document('msg2')
        .snapshots()
        .listen((dado) {
      print(dado.data);
    });
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat - Fatec Ferraz",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.blue,
          )),
      home: ChatScreen(),
    );
  }
}
