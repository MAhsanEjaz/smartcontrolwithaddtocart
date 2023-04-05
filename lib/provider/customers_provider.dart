import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/customer_model.dart';

class CustomerProvider extends ChangeNotifier {
  List<Customers>? customer = [];

  getCustomer({List<Customers>? newCustomer}) {
    customer = newCustomer;
    notifyListeners();
  }
}
