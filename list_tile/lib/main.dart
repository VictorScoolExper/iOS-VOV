import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './src/pages/homepage_alternativo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListTile App',
      home: HomePageAlternativo(),
    );
  }
}



