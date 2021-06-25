import 'package:finalproject_flutter_611/src/screens/emailsignup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/menu_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only( bottom: 15),
                child: Center(
                  child: Text(
                    'Equipo Los Relieros',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Image.network(
                'https://images.discotech.me/artists/3218/0bc507e1-eef8-49d5-ae87-b782f667c212.jpg?auto=format%2Ccompress&w=1000',
                height: 200,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Enter Email Address",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Email Address';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Password';
                          } else if (value.length < 6) {
                            return 'Password must be atleast 6 characters!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            logInToFb();
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue)),
                        onPressed: () {
                          Navigator.pushNamed(context, EmailSignUp.id);
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuScreen(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

}



