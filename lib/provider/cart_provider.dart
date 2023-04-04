import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_control/model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel>? model = [];

  List<CartModel>? get items => model;
  double totalCalculatedPrice = 0;

  getCartItems({List<CartModel>? newModel}) {
    model = newModel;
    _totalCalculatedPrice();
    notifyListeners();
    _saveCartItems;
  }

  addCartItemWithQunatity({CartModel? cartModel}) {
    for (int i = 0; i < model!.length; i++) {
      if (model![i].id == cartModel!.id) {
        model![i].qty++;
        model![i].totalPrice =
            double.parse(model![i].qty.toString()) * model![i].price!;
        _totalCalculatedPrice();
        notifyListeners();
        _saveCartItems;
        return;
      } else {
        notifyListeners();
        _saveCartItems;
      }
    }

    model!.add(cartModel!);
    _totalCalculatedPrice();
    notifyListeners();
    _saveCartItems;
  }

  _totalCalculatedPrice() {
    double tempTotal = 0;
    model!.forEach((element) {
      tempTotal = tempTotal + element.totalPrice!;
    });

    totalCalculatedPrice = tempTotal;

    notifyListeners();
    _saveCartItems();
  }

  updateCartItems({required int index, required int qty}) {
    model![index].qty = qty;
    model![index].totalPrice = qty *
        double.parse(
          model![index].price.toString(),
        );

    _totalCalculatedPrice();
    notifyListeners();
    _saveCartItems;
  }

  deleteData(int index) {
    model!.removeAt(index);
    _totalCalculatedPrice();
    notifyListeners();
    _saveCartItems;
  }

  emptyCart() {
    model = [];
    _totalCalculatedPrice();
    notifyListeners();
    _saveCartItems();
  }

  // Saving cart items to shared preferences
  Future<void> _saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = model!
        .map((item) => {
              'title': item.title,
              'price': item.price,
              'qty': item.qty,
              'category': item.category,
              'thumbnail': item.thumbnail,
              'description': item.description,
              'id': item.id,
              'brand': item.brand,
              'stock': item.stock,
              'totalPrice': item.totalPrice,
            })
        .toList();
    await prefs.setString('cartItems', json.encode(cartData));
  }

  // Loading cart items from shared preferences
  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItems = prefs.getString('cartItems');
    if (cartItems != null) {
      final List<dynamic> decodedData = json.decode(cartItems);
      model = decodedData
          .map((item) => CartModel(
                category: item['category'],
                brand: item['brand'],
                description: item['description'],
                stock: item['stock'],
                thumbnail: item['thumbnail'],
                totalPrice: item['totalPrice'],
                id: item['id'],
                title: item['title'],
                price: item['price'],
                qty: item['qty'],
              ))
          .toList();
      notifyListeners();
    }
  }
}
