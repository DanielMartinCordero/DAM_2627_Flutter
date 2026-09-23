import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DataHolder.dart';

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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 146, 183, 123),
          title: Text("HOMEVIEW"),
          actions: [
            PopupMenuButton<String>(
              tooltip: 'Opciones',
              onSelected: (opcion) {
                if (opcion == 'buscar') print("BUSCAR");
                if (opcion == 'perfil') print("PERFIL");
                if (opcion == 'salir') funClickLogout();
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'buscar',
                  child: Row(
                    children: [Icon(Icons.search), SizedBox(width: 8), Text('Buscar')],
                  ),
                ),
                PopupMenuItem(
                  value: 'perfil',
                  child: Row(
                    children: [Icon(Icons.person), SizedBox(width: 8), Text('Perfil')],
                  ),
                ),
                PopupMenuItem(
                  value: 'salir',
                  child: Row(
                    children: [Icon(Icons.logout), SizedBox(width: 8), Text('Salir')],
                  ),
                ),
              ],
            ),
          ],
        ),
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