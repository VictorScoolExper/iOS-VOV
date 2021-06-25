import 'package:finalproject_flutter_611/src/components/rounded_button.dart';
import 'package:finalproject_flutter_611/src/constants/constants.dart';
import 'package:flutter/material.dart';
import '../screens/menu_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class RegistroInventarioScreen extends StatelessWidget {
  static const String id = 'RegistroInventarioScreen';

  final User user = auth.currentUser;

  String nameOfProduct = '';
  int amount = 0;
  String descripcion = '';
  int precio = 0;

  Future<void> addRegistro(){
    FirebaseFirestore.instance.collection('productos').add({
      'NameOfProduct' : nameOfProduct,
      'IdStore' : user.uid,
      'precio' : precio,
      'description': descripcion,
      'Date' : DateTime.now(),
      'Amount' : amount
    })
        .then((value) => print("product Added"))
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
                    'Llenar campos!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
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
                          nameOfProduct = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: 'Nombre de Producto'),
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
                        precio = int.parse(value);
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: 'Precio por unidad o kilo'),
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
                        descripcion = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: 'Descripcion de producto'),
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
                        amount = int.parse(value);
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: 'Peso/Contenido'),
                    ),
                  ),
                  spaceBox(),
                  RoundedButton(
                    'Registro',
                    Colors.lightBlueAccent,
                        (){
                      addRegistro();
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
      height: 20,
    );
  }
}
