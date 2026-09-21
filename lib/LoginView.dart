import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
  var faInstance = FirebaseAuth.instance;
  late BuildContext miContexto;
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

void funClickLogin() async {
  String usuario = userController.text;
  String pass = passwordController.text;
  print("---->>>>>>>> LOGIN PRESIONADO " + usuario + "   " + pass);

  try {
    await faInstance.signInWithEmailAndPassword(
        email: usuario,
        password: pass
    );
    print("LOGIN BIEN!!!");
    Navigator.popAndPushNamed(miContexto, "/HomeView");
  } on FirebaseAuthException catch (e) {
    print("----------------->>>>>> " + e.toString());
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

  void funClickRegistrarse(){
    print("---->>>>>>>> REGISTRO PRESIONADO");
    Navigator.popAndPushNamed(miContexto, "/RegisterView");
  }
  TextStyle estiloTexto = TextStyle(fontSize: 50, backgroundColor:Colors.orange);

  @override
  Widget build(BuildContext context) {
    miContexto = context;
    return Scaffold(
        appBar: AppBar(title: Text("MI APP"),),
        body: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("LOGIN", style: estiloTexto),
              TextField(controller: userController, decoration: InputDecoration(hintText: "Usuario")),
              TextField(controller: passwordController, obscureText : true, decoration: InputDecoration(hintText: "Contraseña")),
              Row(
                  children: [
                    TextButton(onPressed: funClickLogin, child: Text("Login")),
                    TextButton(onPressed: funClickRegistrarse, child: Text("Registrarse"))
                  ]
              )
            ]
        )
    );
  }
  
}