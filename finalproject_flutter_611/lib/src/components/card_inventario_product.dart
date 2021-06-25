import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class CardInventarioListado extends StatelessWidget {
  final Color colour;
  final Map data;
  final String id;
  CardInventarioListado(this.colour, this.data, this.id);

  CollectionReference productos = FirebaseFirestore.instance.collection('productos');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 10.0,
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text(data['NameOfProduct']),
                  subtitle: Text('El precio es '+ data['precio'].toString()+'. Este producto es ' + data['description']),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        print(data.toString());
                        productos
                            .doc(id)
                            .delete()
                            .then((value) => print("User Deleted"))
                            .catchError((error) => print("Failed to delete user: $error"));
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
