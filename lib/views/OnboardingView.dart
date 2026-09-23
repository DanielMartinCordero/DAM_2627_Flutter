import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../DataHolder.dart';
import '../FbObjects/Perfil.dart';

class OnboardingView extends StatefulWidget{
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingView();
}

class _OnboardingView extends State<OnboardingView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  int _iProgress = 0;

  @override
  void initState() {
    super.initState();
    cargarRecursos();
  }

  void cargarRecursos() async {
    await recursos1();
    setState(() {
      _iProgress = 20;
    });
    await recursos2();
    setState(() {
      _iProgress = 80;
    });
    await recursos3();
    setState(() {
      _iProgress = 100;
    });

    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.popAndPushNamed(context, "/LoginView");
    } else {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final docRef = db.collection("Perfiles").doc(uid);
      
      final docSnap = await docRef.get();
      
      if (docSnap.exists) {
        final perfil = Perfil.fromFirestore(docSnap as DocumentSnapshot<Map<String, dynamic>>, null);
        DataHolder.instance.perfilUsuario = perfil;
        
        print("EL NOMBRE DEL USUARIO ES: ${DataHolder.instance.perfilUsuario.name}");
        Navigator.popAndPushNamed(context, "/HomeView");
      } else {
        // NO TIENE PERFIL EN LA BASE DE DATOS
        Navigator.popAndPushNamed(context, "/ProfileView");
      }
    }
  }

  Future<void> recursos1() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> recursos2() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> recursos3() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
            /*Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: CircularProgressIndicator(),
          ),*/
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: LinearProgressIndicator(value: _iProgress / 100,)
            ),
            Text("$_iProgress%")
          ],
        ),
      ),
    );
  }
}

