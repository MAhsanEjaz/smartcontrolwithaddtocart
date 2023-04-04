import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/product_model.dart';
import 'package:smart_control/provider/product_provider.dart';
import 'package:smart_control/services/custom_get_service.dart';

class GetAllProoductsService {
  Future getProducts({required BuildContext context}) async {
    try {
      var res = await CustomGetService().customGetService(
          context: context, url: 'https://dummyjson.com/products');

      if (res != null) {
        ProductModel productModel = ProductModel.fromJson(res);

        Provider.of<ProductProvider>(context, listen: false)
            .getProducts(newProducts: productModel.products);
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
