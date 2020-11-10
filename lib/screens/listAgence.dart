import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:q_app/screens/agencePage.dart';

class ListAgence extends StatefulWidget {
  @override
  List list;
  int index;

  ListAgence({this.index, this.list});
  _ListAgenceState createState() => _ListAgenceState();
}

class _ListAgenceState extends State<ListAgence> {
  Future<List> getData() async {
    final id = 1;
    final url = await http.get(
        "http://192.168.64.2/Projects/AfrikappFlutter/getAgence.php?id=$id");
    return json.decode(url.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getData(),
      builder: (ctx, ss) {
        if (ss.hasError) {
          print("Erreur");
        }
        if (ss.hasData) {
          return Items(list: ss.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class Items extends StatelessWidget {
  List list;
  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return Container(
                child: Container(
              child: ListTile(
                title: Text(list[i]['nom_agences']),
                subtitle: Text('3km'),
                trailing: Container(
                  height: 30,
                  width: 85,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reserver',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AgencePage(
                        list: list,
                        index: i,
                      ),
                    ),
                  );
                },
              ),
            ));
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}

// return SingleChildScrollView(
//       child: Container(
//         height: 400,
//         child: ListView.builder(
//           itemBuilder: (ctx, i) {
//             return Container(
//               child: CompoAgence(
//                 label: 'MOi',
//               ),
//             );
//           },
//           itemCount: 40,
//         ),
//       ),
//     );
