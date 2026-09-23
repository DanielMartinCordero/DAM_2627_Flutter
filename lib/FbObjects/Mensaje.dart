import 'package:cloud_firestore/cloud_firestore.dart';

class Mensaje {

  String? uid;
  String? titulo;
  String? cuerpo;
  bool? leido;

  Mensaje({this.uid, this.titulo, this.cuerpo, this.leido});

  factory Mensaje.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Mensaje(
      uid:snapshot.id,
      titulo: data?['titulo'],
      cuerpo: data?['cuerpo'],
      leido: data?['leido'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (titulo != null) "name": titulo,
      if (cuerpo != null) "edad": cuerpo,
    };
  }


}