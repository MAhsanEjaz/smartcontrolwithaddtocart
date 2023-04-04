import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDialog {
  void showDia(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        useRootNavigator: true,
        context: context,
        builder: (context) => AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [SpinKitDoubleBounce(color: Colors.pink)],
              ),
            ));
  }

  void hideDialod(BuildContext context) {
    Navigator.pop(context);
  }
}
