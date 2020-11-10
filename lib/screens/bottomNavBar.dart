import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:q_app/screens/Accueil.dart';
import 'package:q_app/screens/Favorit.dart';
import 'package:q_app/screens/Reservations.dart';
import 'package:q_app/screens/profil.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  final Accueil _accueil = Accueil();
  final Reservations _reservations = new Reservations();
  final Favorit _favorit = new Favorit();
  final Profil _profil = new Profil();

  Widget _affichage = new Accueil();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _accueil;
        break;
      case 1:
        return _reservations;
        break;
      case 2:
        return _favorit;
        break;
      case 3:
        return _profil;
        break;
      default:
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.confirmation_num_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_outline,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Colors.redAccent,
        buttonBackgroundColor: Colors.redAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 2),
        onTap: (indexTaped) {
          setState(() {
            _affichage = _pageChooser(indexTaped);
          });
        },
      ),
      body: Container(
        color: Colors.redAccent,
        child: Center(child: _affichage),
      ),
    );
  }
}
