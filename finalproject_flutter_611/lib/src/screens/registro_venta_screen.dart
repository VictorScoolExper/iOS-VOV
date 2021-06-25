import 'package:finalproject_flutter_611/src/components/rounded_button.dart';
import 'package:finalproject_flutter_611/src/constants/constants.dart';
import 'package:flutter/material.dart';
import '../screens/menu_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class RegistroVentaScreen extends StatelessWidget {
  static const String id = 'RegistroVentaScreen';

  final User user = auth.currentUser;

  String productSpec = '';
  int saleValue = 0;

  Future<void> addRegistroVenta(){
    FirebaseFirestore.instance.collection('ventas').add({
      'SaleValue' : saleValue,
      'ProductSepcs' : productSpec,
      'IdStore': user.uid,
      'Date' : DateTime.now()
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

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
        title: Text('Registro'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Llenar campos de Venta!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spaceBox(),
                Container(
                  width: 300,
                  child:  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      saleValue = int.parse(value);
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Valor de producto!'),
                  ),
                ),
                spaceBox(),
                Container(
                  width: 300,
                  child:  TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      productSpec = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Specificaciones de producto!'),
                  ),
                ),
                spaceBox(),
                RoundedButton(
                  'Registro',
                  Colors.lightBlueAccent,
                      (){
                    addRegistroVenta();
                    Navigator.pushNamed(context, MenuScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class spaceBox extends StatelessWidget {
  const spaceBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
    );
  }
}