import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/student_model.dart';

class StudentProvider extends ChangeNotifier {
  List<Students>? student = [];

  getStudents({List<Students>? newStudent}) {
    student = newStudent;
    notifyListeners();
  }
}
