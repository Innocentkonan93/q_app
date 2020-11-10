import 'package:flutter/material.dart';

class CompoBanque extends StatelessWidget {
  final String label;
  final String nombreAgence;
  Function onTap;
  Image image;

  CompoBanque({this.onTap, this.label, this.nombreAgence, this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
              child: image,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              nombreAgence,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
