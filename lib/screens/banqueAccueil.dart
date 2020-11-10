import 'package:flutter/material.dart';
import 'package:q_app/composants/compoBanque.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:q_app/screens/banquePage.dart';

class BanqueAccueil extends StatefulWidget {
  List list;
  int index;

  BanqueAccueil({this.index, this.list});
  @override
  _BanqueAccueilState createState() => _BanqueAccueilState();
}

class _BanqueAccueilState extends State<BanqueAccueil> {
  Future<List> getData() async {
    final res = await http
        .get("http://192.168.64.2/Projects/AfrikappFlutter/getBanque.php");
    return json.decode(res.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Erreur");
          }
          if (ss.hasData) {
            return Items(list: ss.data);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;

  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: CompoBanque(
                    label: list[i]['nom_banques'],
                    nombreAgence: '',
                    image:
                        Image.asset('assets/images/${list[i]['banque_image']}'),
                  ),
                  onTap: () {
                    // var id = list[i]['id_banque'];
                    // loginUser(id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: RouteSettings(),
                        builder: (BuildContext context) =>
                            BanquePage(list: list, index: i),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        itemCount: list == null ? 0 : list.length,
      ),
    );
  }
}

List<String> service = [
  "Retrait",
  "Achat de carte",
  "Souscription",
  "Gestionnaire",
];
