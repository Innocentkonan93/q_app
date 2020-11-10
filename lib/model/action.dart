// import 'package:http/http.dart' as http;
// import 'dart:convert';
// class Reservations {
//   static const ROOT =
//       'http://192.168.64.2/Projects/AfrikappFlutter/reservations_action.php';

//   static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
//   static const _GET_ALL_ACTION = 'GET_RESERV';
//   static const _ADD_RESERV_ACTION = 'ADD_RESERV';
//   static const _UPD_RESERV_ACTION = 'UPD_RESERV';
//   static const _DEL_RESERV_ACTION = 'DEL_RESERV';

//   static Future<String> createTable() async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _CREATE_TABLE_ACTION;
//       final response = await http.post(ROOT, body: map);
//       print('Table créée');
//       return response.body;
//     } catch (e) {
//       return "erreur";
//     }
//   }

//   static Future<List<Reservations>> getReservations() async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _GET_ALL_ACTION;
//       final response = await http.post(ROOT, body: map);
//       if (200 == response.statusCode) {
//         List<Reservations> list = parseResponse(response.body);
//         return list;
//       }
//     } catch (e) {
//       return List<Reservations>();
//     }
//   }

//   static List<Reservations> parseResponse(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed
//         .map<Reservations>((json) => Reservations.fromJson(json))
//         .tolist();
//   }

//   static Future<String> addReservation(
//       String agenceService, DateTime dateRdv) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _ADD_RESERV_ACTION;
//       final response = await http.post(ROOT, body: map);
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return 'erreur';
//       }
//     } catch (e) {
//       return 'erreur';
//     }
//   }
// }
