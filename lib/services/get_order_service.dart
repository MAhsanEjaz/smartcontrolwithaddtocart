import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/get_cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:smart_control/provider/get_cart_provider.dart';

class GetOrderService {
  Future getOrderService({required BuildContext context}) async {
    List<GetCartModel> model = [];

    try {
      http.Response response =
          await http.get(Uri.parse('http://192.168.18.10:5000/routes/data'));

      if (response.statusCode == 200) {
        log('response--->${response.body}');
        log('response--->${response.statusCode}');

        var l = response.body;

        jsonDecode(l).forEach((element) {
          model.add(GetCartModel.fromJson(element));
        });

        Provider.of<GetOrderProvider>(context, listen: false)
            .getModels(newModel: model);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print('exception----->$err');

      return false;
    }
  }
}
