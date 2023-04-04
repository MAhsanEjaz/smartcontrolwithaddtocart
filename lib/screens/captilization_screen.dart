import 'package:flutter/material.dart';

class CaptilizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitalization Snack Bar Demo'),
      ),
      body: Center(
        child: TextField(
          onChanged: (text) {
            if (text.isNotEmpty && text == text.toUpperCase()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Capitalization is on!'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
          decoration: InputDecoration(
            hintText: 'Type something...',
          ),
        ),
      ),
    );
  }
}
