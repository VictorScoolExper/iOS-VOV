import 'package:flutter/material.dart';

class HomePageAlternativo extends StatelessWidget {
  final opciones = [
    {"title": "Numero Uno", "description": "Hola", "leading" : Icon(Icons.account_balance_outlined),"trailing": Icon(Icons.keyboard_arrow_right) },
    {"title": "Numero Dos", "description": "Como estas", "leading" : Icon(Icons.remove_circle),"trailing": Icon(Icons.keyboard_arrow_left)},
    {"title": "Numero Tres", "description": "Dedo", "leading" : Icon(Icons.email),"trailing": Icon(Icons.keyboard)},
    {"title": "Numero Cuatro", "description": "Casa", "leading" : Icon(Icons.height),"trailing": Icon(Icons.add)},
    {"title": "Numero Cinco", "description": "Monopolio", "leading" : Icon(Icons.ac_unit_rounded),"trailing": Icon(Icons.account_balance)}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'listTile',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
        ),
      ),
      body: ListView(children: _crearItemsCorto()),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = new List<Widget>();
  //   for (var opt in opciones) {
  //     final tempWidget = ListTile(title: Text(opt));
  //     // lista.add(tempWidget);
  //     // lista.add(Divider());
  //     lista..add(tempWidget)..add(Divider());
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(
              item['title'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              item['description'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
              ),
            ),
            leading: item['leading'],
            trailing: item['trailing'],
            tileColor: Colors.red,

          ),
          Divider()
        ],
      );
    }).toList();
  }
}
