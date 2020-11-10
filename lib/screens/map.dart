import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Location(),
    );
  }
}

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  double lat;
  double long;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        actions: [
          FlatButton(
            onPressed: () {
              _getCurrentLocation();
            },
            child: Icon(
              Icons.location_history,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: FlutterMap(
          mapController: new MapController(),
          options: new MapOptions(
              minZoom: 10.0, center: new LatLng(37.785834, -122.406417)),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(markers: [
              new Marker(
                width: 45.0,
                height: 45.0,
                point: new LatLng(lat, long),
                builder: (context) => new Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                              color: Colors.white,
                              height: 400,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.purple,
                                        height: 50,
                                        width: 360,
                                        child: Text('data'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
