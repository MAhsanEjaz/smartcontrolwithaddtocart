import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CustomGetService {
  Future customGetService({required BuildContext context, String? url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url!));

      print('url----> ${url}');
      print('response----> ${response.body}');
      print('response----> ${response.statusCode}');

      var jsonDecode = json.decode(response.body);

      if (response.statusCode != 200) {
        return null;
      } else {
        return jsonDecode;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
