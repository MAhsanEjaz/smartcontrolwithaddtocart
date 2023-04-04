import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/cart_model.dart';
import 'package:smart_control/model/product_model.dart';
import 'package:smart_control/provider/cart_provider.dart';

// class CartService {
//   Future<bool> cartItemService(
//       {required BuildContext context, CartProducts? products}) async {
//     CartModel cartModel = CartModel(
//         products: products,
//         totalPrice: double.parse(products!.price.toString()),
//         qty: 1);
//
//     Provider.of<CartProvider>(context, listen: false)
//         .addCartItemWithQunatity(cartModel: cartModel);
//
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text('Item Added Successfully')));
//
//     return true;
//   }
// }

bool addToCart(CartProducts? item, BuildContext context) {
// int quantity = 0;

  CartModel cartModel = CartModel(
      thumbnail: item!.thumbnail,
      stock: item.stock,
      price: item.price,
      description: item.description,
      category: item.category,
      brand: item.brand,
      id: item.id,
      title: item.title,
      qty: 1,
      totalPrice: double.parse(item.price.toString()));

  Provider.of<CartProvider>(context, listen: false)
      .addCartItemWithQunatity(cartModel: cartModel);
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Successfully')));
  return true;

  // cartStorage.addCartItem(item: cartItem, customerId: customerId);
  // Provider.of<CartCounterProvider>(context, listen: false).incrementCount();
}
