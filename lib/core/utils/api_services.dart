import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post({required String url, required dynamic body}) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code${response.statusCode} with bode ${jsonDecode(response.body)}');
    }
  }
}
