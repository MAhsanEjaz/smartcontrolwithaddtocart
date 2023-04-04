import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/login_model.dart';
import 'package:smart_control/provider/login_provider.dart';
import 'package:smart_control/services/custom_post_service.dart';

class LoginService {
  Future loginService(
      {required BuildContext context,
      String? username,
      String? PassWord}) async {
    try {
      Map body = {"username": username, "PassWord": PassWord};

      var res = await CustomPostService().customPostService(
          context: context,
          url:
              'https://service.msxroadshow.com/api/User/Login?username=${username}&PassWord=${PassWord}',
          body: body);

      if (res != null) {
        LoginModel loginModel = LoginModel.fromJson(res);

        Provider.of<LoginProvider>(context, listen: false)
            .getUser(newLoginModel: loginModel);
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
