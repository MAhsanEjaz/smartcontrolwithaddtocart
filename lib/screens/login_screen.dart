import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_control/custom_widgets/custom_dialog.dart';
import 'package:smart_control/custom_widgets/custom_textfield.dart';
import 'package:smart_control/screens/edit_screen.dart';
import 'package:smart_control/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName =
      TextEditingController(text: 'admin@takweenit.net');
  TextEditingController password = TextEditingController(text: 'Abcd@1234');

  loginHandler() async {
    CustomDialog().showDia(context);
    bool res = await LoginService().loginService(
        context: context, PassWord: password.text, username: userName.text);
    CustomDialog().hideDialod(context);

    if (res) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => EditScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: userName, text: 'Email'),
            CustomTextField(
              controller: password,
              text: 'Password',
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      loginHandler();
                    },
                    child: Text('Login')))
          ],
        ),
      ),
    );
  }
}
