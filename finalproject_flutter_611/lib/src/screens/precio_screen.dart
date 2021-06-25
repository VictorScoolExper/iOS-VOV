import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject_flutter_611/src/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import '../screens/menu_screen.dart';
import '../components/card_precio.dart';

class PrecioScreen extends StatelessWidget {
  static const String id = 'PrecioScreen';

  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('ventas').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pushNamed(context, MenuScreen.id);
              }),
        ],
        title: Text('Lista de Ventas'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _userStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return CardPrecio(Colors.white60, data, document.id);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
