import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Perfil.dart';

class ProfileView extends StatelessWidget{
  TextEditingController edadController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  FirebaseFirestore db= FirebaseFirestore.instance;

  void funConfirmar() {
    if (edadController.text.isNotEmpty && alturaController.text.isNotEmpty) {
      final perfiles = db.collection("Perfiles");
      final perfil = new Perfil(
          uid:FirebaseAuth.instance.currentUser!.uid,
          name: "Yony",
          edad: int.parse(edadController.text),
          altura: double.parse(alturaController.text)
      );
      perfiles.doc(FirebaseAuth.instance.currentUser!.uid).set(perfil.toFirestore());
    }
  }
  void funSalir(){
    exit(0);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}