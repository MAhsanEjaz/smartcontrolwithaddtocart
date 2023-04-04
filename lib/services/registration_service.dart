import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/registration_model.dart';
import 'package:smart_control/provider/registration_provider.dart';
import 'package:smart_control/services/custom_post_service.dart';

class RegistrationService {
  Future registrationService(
      {required BuildContext context,
      String? name,
      String? email,
      String? dob,
      String? gender,
      String? phone,
      String? password,
        String? phone_code}) async {
    try {
      Map body = {
        "name": name,
        "email": email,
        "dob": dob,
        "gender": gender,
        "phone": phone,
        "password": password,
        "phone_code": phone_code
      };

      var res = await CustomPostService().customPostService(
          context: context,
          body: body,
          url: 'https://rehab.intellitaxtrust.com/api/doctor_register');

      if (res != null) {
        Registration registration = Registration.fromJson(res);
        Provider.of<RegistrationProvider>(context, listen: false)
            .getRegisterData(newRegistration: registration);
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
