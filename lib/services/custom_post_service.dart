import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomPostService {
  Future customPostService(
      {required BuildContext context, String? url, Map? body}) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        // "Content-Length": "113",
      };

      http.Response response = await http.post(Uri.parse(url!),
          body: json.encode(body), headers: headers);

      log('response---> ${response.body}');
      log('statusCode---> ${response.statusCode}');
      log('url---> ${url}');

      var jsonDecode = json.decode(response.body);

      if (response.statusCode != 200) {
        return null;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${jsonDecode['msg']}')));

        return jsonDecode;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
