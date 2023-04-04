import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/registration_model.dart';

class RegistrationProvider extends ChangeNotifier {
  Registration? registration;

  getRegisterData({Registration? newRegistration}) {
    registration = newRegistration;
    notifyListeners();
  }
}
