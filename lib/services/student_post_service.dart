import 'package:flutter/cupertino.dart';
import 'package:smart_control/services/custom_post_service.dart';

class StudentPostService {
  Future studentPOstService(
      {required BuildContext context,
      String? reference,
      String? customer,
      String? natureOfService,
      String? amount,
      String? gender,
      String? cash,
      String? date,

      }) async {
    try {
      Map body = {
        "referenceNumber": reference,
        "first_name": customer,
        "natureService": natureOfService,
        "amount": amount,
        "gender": gender,
        "cash": cash,
        "date": date,
      };

      var res = await CustomPostService().customPostService(
          context: context,
          body: body,
          url: 'https://exmam.herokuapp.com/api/student');

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
