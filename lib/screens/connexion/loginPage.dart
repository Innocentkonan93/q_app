import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:q_app/screens/bottomNavBar.dart';
import 'package:q_app/screens/connexion/singup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final emailContrller = TextEditingController();
  final mdpContrller = TextEditingController();
  String message = '';
  String username = '';

  Future<List> login() async {
    final response = await http
        .post('http://192.168.64.2/Projects/AfrikappFlutter/login.php', body: {
      "email": emailContrller.text,
      "mdp": mdpContrller.text,
    });

    var dataUser = json.decode(response.body);

    if (dataUser.length == 1) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ),
        );
        setState(() {
          username = dataUser[0]['nom'];
        });
      });
    } else {
      setState(() {
        message = 'Connexion echouée';
      });
    }
    return dataUser;
  }

  @override
  void dispose() {
    emailContrller.dispose();
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset('assets/images/logo.png'),
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
                            prefixIcon: Icon(Icons.person,
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
                              login();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Connexion',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        'Créer un compte',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
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
