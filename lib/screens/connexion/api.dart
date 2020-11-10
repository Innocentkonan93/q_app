import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String id) async {
  String url = 'http://192.168.64.2/Projects/AfrikappFlutter/getAgence.php';
  final response = await http.post(url, headers: {
    "Accept": "Application/json"
  }, body: {
    'id': id,
  });
  var convertDataToJson = jsonDecode(response.body);
  return convertDataToJson;
}
