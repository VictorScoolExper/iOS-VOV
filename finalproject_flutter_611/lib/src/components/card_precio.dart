import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardPrecio extends StatelessWidget {

  CardPrecio(this.colour, this.data, this.id);
  final Color colour;
  final String id;
  final Map data;

  CollectionReference users = FirebaseFirestore.instance.collection('ventas');

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
                  leading: Icon(Icons.airline_seat_individual_suite_rounded),
                  title: Text(data['ProductSepcs']),
                  subtitle: Text('El precio total de este pedido fue de ' + data['SaleValue'].toString() + ' pesos'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('Edit'),
                      onPressed: () { /* ... */ },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        print(data.toString());
                        users
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