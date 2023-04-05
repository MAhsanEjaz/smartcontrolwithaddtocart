import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/customer_model.dart';
import 'package:smart_control/provider/customers_provider.dart';
import 'package:smart_control/services/custom_get_service.dart';

class CustomerService {
  Future customersService({required BuildContext context}) async {
    try {
      var res = await CustomGetService().customGetService(
          context: context,
          url: 'http://45.35.85.135:8050/api/SaleRep/SaleRepCustomers2/1');

      if (res != null) {
        CustomerModel customerModel = CustomerModel.fromJson(res);

        Provider.of<CustomerProvider>(context, listen: false)
            .getCustomer(newCustomer: customerModel.data);
        return true;
      } else {
        return false;
      }
    } catch (er) {
      print(er);
      return false;
    }
  }
}
