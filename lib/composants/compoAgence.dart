import 'package:flutter/material.dart';
import 'package:q_app/screens/agencePage.dart';

// ignore: must_be_immutable
class CompoAgence extends StatelessWidget {
  final String label;
  Function onTap;

  CompoAgence({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(label),
        subtitle: Text('3km'),
        trailing: Container(
          height: 30,
          width: 85,
          decoration: BoxDecoration(
              color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reserver',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AgencePage()));
        },
      ),
    );
  }
}
