import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:q_app/screens/banqueAccueil.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewReservation extends StatefulWidget {
  @override
  _NewReservationState createState() => _NewReservationState();
}

class _NewReservationState extends State<NewReservation> {
  final selectedService = TextEditingController();
  final selectedDate = TextEditingController();
  final selectedTime = TextEditingController();
  DateTime pickedDate;
  TimeOfDay pickedTime;
  final format = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    pickedTime = TimeOfDay.now();
  }

  _pickDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 30),
      initialDate: pickedDate,
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  _pickTime() {
    showTimePicker(
      context: context,
      initialTime: pickedTime,
    ).then(
      (selectedTime) {
        if (selectedTime == null) {
          return;
        }
        setState(() {
          selectedTime = pickedTime;
        });
      },
    );
  }

  void addReserv() {
    var url = "http://192.168.64.2/Projects/AfrikappFlutter/addReserv.php";
    http.post(url, body: {
      "serviceAgence": selectedService.text,
      "jourRdv": pickedDate.toString(),
      "heureRdv": pickedTime.toString(),
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              DropDownField(
                controller: selectedService,
                hintText: 'Choisir un service',
                items: service,
                textStyle: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
                width: 50,
              ),
              SizedBox(
                height: 15,
                width: 50,
              ),
              ListTile(
                leading: Text(
                  'Date:',
                  style: TextStyle(fontSize: 20),
                ),
                title: Text(
                  "${pickedDate.day} ${pickedDate.month} ${pickedDate.year}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickDate,
              ),
              ListTile(
                leading: Text(
                  'Heure:',
                  style: TextStyle(fontSize: 20),
                ),
                title: Text(
                  "${pickedTime.hour} : ${pickedTime.minute}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickTime,
              ),
              SizedBox(
                height: 10,
                width: 50,
              ),
              SizedBox(
                height: 15,
                width: 50,
              ),
              SizedBox(
                height: 10,
                width: 50,
              ),
              FlatButton(
                child: Text("Reserver", style: TextStyle(fontSize: 15)),
                onPressed: () {
                  addReserv();
                },
                color: Colors.redAccent,
                textColor: Colors.white,
                splashColor: Colors.grey,
                shape: StadiumBorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
