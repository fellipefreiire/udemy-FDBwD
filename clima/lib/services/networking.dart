import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '9f259c3c9d26b47799fd6f598a1f94f2';

class NetworkHelper {
  NetworkHelper(this.uri);

  final Uri uri;

  Future getData() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
