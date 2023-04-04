import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilePickerExample extends StatefulWidget {
  @override
  _FilePickerExampleState createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  List<String> _filePaths = [];

  @override
  void initState() {
    super.initState();
    _loadSavedFiles();
  }

  Future<void> _loadSavedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFiles = prefs.getStringList('files');
    if (savedFiles != null) {
      setState(() {
        _filePaths = savedFiles;
      });
    }
  }

  String? path;

  Future<void> _saveFiles() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('files', _filePaths);
  }

  Future<void> _pickFiles() async {
    final pickedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (pickedFiles != null) {
      setState(() {
        _filePaths == pickedFiles.paths;
      });
      await _saveFiles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Pick Files'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Selected Files:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _filePaths.length,
              itemBuilder: (BuildContext context, int index) {
                final fileName = _filePaths[index].split('/').last;
                return ListTile(
                  title: Text(fileName),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
