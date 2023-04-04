import 'package:flutter/cupertino.dart';
import 'package:smart_control/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<CartProducts>? products = [];

  getProducts({List<CartProducts>? newProducts}) {
    products = newProducts;
    notifyListeners();
  }
}
