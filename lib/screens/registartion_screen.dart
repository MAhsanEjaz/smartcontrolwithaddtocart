import 'package:flutter/material.dart';
import 'package:smart_control/custom_widgets/custom_dialog.dart';
import 'package:smart_control/custom_widgets/custom_textfield.dart';
import 'package:smart_control/services/registration_service.dart';

class RegistartionScreen extends StatefulWidget {
  const RegistartionScreen({Key? key}) : super(key: key);

  @override
  _RegistartionScreenState createState() => _RegistartionScreenState();
}

class _RegistartionScreenState extends State<RegistartionScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneCode = TextEditingController();

  registartionHandler() async {
    CustomDialog().showDia(context);
    await RegistrationService().registrationService(
        context: context,
        gender: gender.text,
        email: email.text,
        password: password.text,
        name: name.text,
        dob: dob.text,
        phone: phone.text,
        phone_code: phoneCode.text);
    CustomDialog().hideDialod(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(controller: name),
              CustomTextField(
                controller: email,
              ),
              CustomTextField(
                controller: dob,
              ),
              CustomTextField(
                controller: password,
              ),
              CustomTextField(
                controller: gender,
              ),
              CustomTextField(
                controller: phone,
              ),
              CustomTextField(
                controller: phoneCode,
              ),
              ElevatedButton(
                  onPressed: () {
                    registartionHandler();
                  },
                  child: Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
