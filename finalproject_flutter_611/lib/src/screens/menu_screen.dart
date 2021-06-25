import 'package:finalproject_flutter_611/src/screens/listado_screen.dart';
import 'package:finalproject_flutter_611/src/screens/precio_screen.dart';
import 'package:finalproject_flutter_611/src/screens/registro_inventario_screen.dart';
import 'package:finalproject_flutter_611/src/screens/registro_venta_screen.dart';
import 'package:finalproject_flutter_611/src/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';

import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MenuScreen extends StatefulWidget {
  static const String id = 'MenuScreen';

  MenuScreen({this.uid});
  final String uid;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  'Inventario',
                  Colors.lightBlueAccent,
                      (){
                        Navigator.pushNamed(context, ListadoScreen.id);
                      },
                ),
                RoundedButton(
                  'Vendido',
                  Colors.lightBlueAccent,
                      (){
                        Navigator.pushNamed(context, PrecioScreen.id);
                      },
                ),
                RoundedButton(
                  'Registro Inventario',
                  Colors.lightBlueAccent,
                      (){
                        Navigator.pushNamed(context, RegistroInventarioScreen.id);
                      },
                ),
                RoundedButton(
                  'Registro Venta',
                  Colors.lightBlueAccent,
                      (){
                    Navigator.pushNamed(context, RegistroVentaScreen.id);
                  },
                ),
                SizedBox(
                  height: 150,
                ),
                RoundedButton(
                  'Salir',
                  Colors.lightBlueAccent,
                      () async {
                        await _auth.signOut();
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
