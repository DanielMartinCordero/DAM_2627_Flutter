import 'package:cloud_firestore/cloud_firestore.dart';

import 'Mensaje.dart';

class Perfil {

  final String? uid;
  final String? name;
  final int? edad;
  final double? altura;
  List<Mensaje> mensajes = List.empty();

  Perfil({this.uid, this.name, this.edad, this.altura});

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil(
      uid:snapshot.id,
      name: data?['name'],
      edad: data?['edad'],
      altura: data?['altura'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (edad != null) "edad": edad,
      if (altura != null) "altura": altura,
    };
  }
  Future<void> descargarMensajes() async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef=db.collection("Perfiles/"+uid!+"/Mensajes")
        .where("leído", isEqualTo: false ).limit(99)
        .withConverter(
        fromFirestore: Mensaje.fromFirestore,
        toFirestore: (Mensaje mensaje, _) => mensaje.toFirestore());

    final querySnapshot=await docRef.get();

    for (var docSnapshot in querySnapshot.docs) {
      mensajes.add(docSnapshot.data());
    }
    print("Hay en total: "+mensajes.length.toString());  }

}