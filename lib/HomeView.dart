import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DataHolder.dart';

class HomeView extends StatelessWidget{
  late BuildContext miContext;

  void funClickLogout(){
    FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(miContext, "/LoginView");
  }

  @override
  Widget build(BuildContext context) {
    miContext=context;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME VIEW"),
            // Mostramos el nombre guardado en el DataHolder
            Text("Bienvenido: ${DataHolder.instance.perfilUsuario.name ?? 'Usuario'}"),
            TextButton(onPressed: funClickLogout, child: Text("Logout"))
          ],
        )
    );
  }
}