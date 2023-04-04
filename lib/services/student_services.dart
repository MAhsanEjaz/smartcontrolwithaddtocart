import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smart_control/model/student_model.dart';
import 'package:smart_control/provider/student_provider.dart';

class StudentsService {
  Future studentServics({required BuildContext context}) async {
    List<Students> student = [];

    try {
      http.Response response =
          await http.get(Uri.parse('https://exmam.herokuapp.com/api/students'));

      // print('http://localhost:1932/api');
      
      
      
      Paint.enableDithering.toString();
      
      log('message---> ${response.statusCode}');

      log('response---> ${response.body}');

      if (response.statusCode == 200) {
        var l = response.body;

        jsonDecode(l).forEach((element) {
          student.add(Students.fromJson(element));
        });
        Provider.of<StudentProvider>(context, listen: false)
            .getStudents(newStudent: student);
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

class Class extends StatefulWidget {
  const Class({Key? key}) : super(key: key);

  @override
  _ClassState createState() => _ClassState();
}

class _ClassState extends State<Class> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
