import 'dart:convert';

import 'package:smart_control/model/product_model.dart';

// String cartModelToJson(CartModel data) => json.encode(data.products!.toJson());

class CartModel {
  int? id;
  String? title;
  String? description;
  int? price;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  int qty = 1;
  double? totalPrice = 22;

  CartModel(
      {this.brand,
      this.title,
      this.id,
      this.category,
      this.thumbnail,
      this.stock,
      this.price,
      this.description,
      this.totalPrice = 22,
      this.qty = 1});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["id"] = this.id;
    data["title"] = this.title;
    data["price"] = this.price;
    data["stock"] = this.stock;
    data["brand"] = this.brand;
    data["category"] = this.category;
    data["thumbnail"] = this.thumbnail;
    data["totalPrice"] = this.totalPrice;
    data["description"] = this.description;
    data["qty"] = this.qty;
    return data;
  }

  // static CartModel fromJson(Map<String, dynamic> json) => CartModel(

  CartModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    qty = json['qty'] = 1;
    id = json['id'];
    brand = json['brand'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    thumbnail = json['thumbnail'];
    totalPrice = json['totalPrice'];
  }
}

// "title": title,
// "description": description,
// "price": price,
// "stock": stock,
// "brand": brand,
// "category": category,
// "thumbnail": thumbnail,
// "totalPrice": totalPrice

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['description'] = this.description;
//   data['price'] = this.price;
//   data['stock'] = this.stock;
//   data['brand'] = this.brand;
//   data['category'] = this.category;
//   data['thumbnail'] = this.thumbnail;
//   data['_id'] = this.sId;
//   return data;
// }
// }
