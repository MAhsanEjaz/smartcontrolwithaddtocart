import 'package:flutter/material.dart';

class PhoneNumberFormatter extends StatefulWidget {
  const PhoneNumberFormatter({Key? key}) : super(key: key);

  @override
  _PhoneNumberFormatterState createState() => _PhoneNumberFormatterState();
}

class _PhoneNumberFormatterState extends State<PhoneNumberFormatter> {
  final TextEditingController _controller = TextEditingController();
  String formattedPhoneNumber = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Formatter'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              scribbleEnabled: true,
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (value) {
                final formatted = _formatPhoneNumber(value);
                if (formatted != value) {
                  _controller.value = TextEditingValue(
                    text: formatted,
                    selection:
                        TextSelection.collapsed(offset: formatted.length),
                  );
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              'Formatted Phone Number: $formattedPhoneNumber',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return '';
    }

    String formatted = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (formatted.startsWith('1')) {
      formatted = formatted.substring(1);
    }

    if (formatted.length < 10) {
      return formatted;
    }

    formatted = formatted.substring(0, 10);

    final String countryCode = formatted.substring(0, 2);
    final String areaCode = formatted.substring(1, 4);
    final String prefix = formatted.substring(4, 7);
    final String lineNumber = formatted.substring(7);

    return '+$countryCode-$areaCode-$prefix-$lineNumber';
  }
}
