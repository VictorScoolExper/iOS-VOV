import 'package:finalproject_flutter_611/src/screens/emailsignup_screen.dart';
import 'package:finalproject_flutter_611/src/screens/listado_screen.dart';
import 'package:finalproject_flutter_611/src/screens/menu_screen.dart';
import 'package:finalproject_flutter_611/src/screens/precio_screen.dart';
import 'package:finalproject_flutter_611/src/screens/registro_inventario_screen.dart';
import 'package:finalproject_flutter_611/src/screens/registro_venta_screen.dart';
import 'package:finalproject_flutter_611/src/screens/welcome_screen.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(context){
    return MaterialApp(
      initialRoute: user != null ? MenuScreen.id : WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        EmailSignUp.id: (context) => EmailSignUp(),
        MenuScreen.id: (context) => MenuScreen(),
        ListadoScreen.id: (context) => ListadoScreen(),
        PrecioScreen.id: (context) => PrecioScreen(),
        RegistroInventarioScreen.id: (context) => RegistroInventarioScreen(),
        RegistroVentaScreen.id: (context) => RegistroVentaScreen()
      },
    );
  }
}