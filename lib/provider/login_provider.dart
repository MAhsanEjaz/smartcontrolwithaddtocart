import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel? loginModel;

  getUser({LoginModel? newLoginModel}) {
    loginModel = newLoginModel;
    notifyListeners();
  }
}
