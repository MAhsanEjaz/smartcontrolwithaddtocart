import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/student_model.dart';
import 'package:smart_control/provider/student_provider.dart';
import 'package:smart_control/services/custom_get_service.dart';

class DummyService {
  Future dummyService({required BuildContext context}) async {
    try {
      var res = await CustomGetService().customGetService(
          context: context, url: 'https://exmam.herokuapp.com/api/students');

      if (res != null) {
        List<Students> manageCompany =
            (res).map<Students>((m) => Students.fromJson(m)).toList();

        Provider.of<StudentProvider>(context, listen: false)
            .getStudents(newStudent: manageCompany);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print("err-----> $err");
      return false;
    }
  }
}
