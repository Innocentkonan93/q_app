import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:q_app/screens/connexion/loginPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final nomContrller = TextEditingController();
  final emailContrller = TextEditingController();
  final numeroContrller = TextEditingController();
  final mdpContrller = TextEditingController();
  String message = '';
  String username = '';

  void addUser() {
    var url = "http://192.168.64.2/Projects/AfrikappFlutter/addUsers.php";
    http.post(url, body: {
      "nom": nomContrller.text,
      "email": emailContrller.text,
      "numero": numeroContrller.text,
      "mdp": mdpContrller.text,
    });
  }

  @override
  void dispose() {
    nomContrller.dispose();
    emailContrller.dispose();
    numeroContrller.dispose();
    mdpContrller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Inscription',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Q_App',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        new TextFormField(
                          controller: nomContrller,
                          decoration: InputDecoration(
                            labelText: "Votre nom et prenom",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Entrer votre nom et prenom';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          controller: emailContrller,
                          decoration: InputDecoration(
                            labelText: "Votre email",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.mail,
                                color: Theme.of(context).accentColor),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Entrer votre mail';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          controller: numeroContrller,
                          decoration: InputDecoration(
                            labelText: "Votre numero",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.call,
                                color: Theme.of(context).accentColor),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Entrer votre numero';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          controller: mdpContrller,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Votre mot de passe",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: Theme.of(context).accentColor),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Entrer votre mot de passe';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 80,
                          ),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              addUser();
                              setState(() {
                                message = 'Inscription réussie';
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Inscription',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          message,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// if (_formkey.currentState.validate()) {
//   var email = emailContrller.text;
//   var mdp = mdpContrller.text;
//   setState(() {
//     message = "Connexion en cours...";
//   });
//   var rsp = loginUser(email, mdp);
//   print(rsp.toString());
// }
