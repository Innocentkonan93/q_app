import 'package:flutter/material.dart';
import 'package:q_app/screens/listAgence.dart';

class BanquePage extends StatefulWidget {
  List list;
  int index;

  BanquePage({this.index, this.list});
  @override
  _BanquePageState createState() => _BanquePageState();
}

class _BanquePageState extends State<BanquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 200,
            title: Text('Banque Name'),
            elevation: 2,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/NSIA.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${widget.list[widget.index]['nom_banques']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text('12 agences'),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: Image.asset('assets/images/${widget.list[widget.index]['banque_image']}'),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Agences',
                        ),
                        SizedBox(height: 20),
                        ListAgence()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
