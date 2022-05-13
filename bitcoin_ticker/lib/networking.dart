import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'F37BA942-DD19-424B-A0FB-CC96D2B25729';

class NetworkHelper {
  NetworkHelper(this.uri);

  final Uri uri;

  Future getData() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)['rate'];
    } else {
      print(response.statusCode);
    }
  }
}
