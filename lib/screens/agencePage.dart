import 'package:flutter/material.dart';
import 'package:q_app/screens/NewReservation.dart';

class AgencePage extends StatefulWidget {
  List list;
  int index;
  AgencePage({this.list, this.index});
  @override
  _AgencePageState createState() => _AgencePageState();
}

void _startNewTicket(BuildContext ctx) {
  showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewReservation(),
        );
      });
}

class _AgencePageState extends State<AgencePage> {
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
            elevation: 2,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/NSIA.jpg',
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  child: IconButton(icon: Icon(Icons.map), onPressed: null),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          SliverFillRemaining(
              child: ListView(
            children: [
              ListTile(
                title: Text(
                  '${widget.list[widget.index]['nom_agences']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Ouvert',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                trailing: Image.asset(
                  'assets/images/${widget.list[widget.index]['banque_image']}',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Horaire d\'ouverture',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '8h à 15h',
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Services',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text(
                  'Retrait',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'Achat de carte',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'Souscription',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'Gestionnaire',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startNewTicket(context),
        label: Text(
          'Reserver',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
