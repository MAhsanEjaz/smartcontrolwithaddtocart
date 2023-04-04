import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/cart_model.dart';
import 'package:smart_control/services/custom_post_service.dart';

class CheckOutService {
  Future checkoutService({
    required BuildContext context,
    String? total,
    List? products,
  }) async {
    try {
      Map body = {
        "name": "Swati",
        "email": "swati@gmail.com",
        "address": "harbanspura",
        "products": products,
        "total": total
      };

      print(json.encode(products));

      var res = await CustomPostService().customPostService(
          context: context,
          url: 'http://192.168.18.10:5000/routes/api/checkout',
          body: body);

      print(body);

      if (res != null) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
