import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/get_cart_model.dart';

class GetOrderProvider extends ChangeNotifier {
  List<GetCartModel>? model = [];

  getModels({List<GetCartModel>? newModel}) {
    model = newModel;
    notifyListeners();
  }
}
