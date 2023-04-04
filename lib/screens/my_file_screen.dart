import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MyFileScreen extends StatefulWidget {
  const MyFileScreen({Key? key}) : super(key: key);

  @override
  State<MyFileScreen> createState() => _MyFileScreenState();
}

class _MyFileScreenState extends State<MyFileScreen> {
  List<String> picker = [];

  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  FilePickerResult? filePick =
                      await FilePicker.platform.pickFiles();

                  filePick!.files.forEach((element) {
                    picker.add(element.name);

                    setState(() {});
                  });
                },
                child: Text('Select File')),
            ListView.builder(
                shrinkWrap: true,
                itemCount: picker.length,
                itemBuilder: (context, index) {
                  return Text(picker[index]);
                })
          ],
        ),
      ),
    );
  }
}
