import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_control/model/product_model.dart';
import 'package:smart_control/provider/cart_provider.dart';
import 'package:smart_control/provider/product_provider.dart';
import 'package:smart_control/screens/cart_screen.dart';
import 'package:smart_control/services/cart_service.dart';
import 'package:smart_control/services/get_all_products_service.dart';

import 'product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  productsHandler() {
    GetAllProoductsService().getProducts(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productsHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CartProvider>(
        builder: (context, data, cart, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[100],
          elevation: 0,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => CartScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Icon(Icons.add_shopping_cart),
                ))
          ],
          title: Text('${cart.model!.length}'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Wrap(
              children: [
                for (var l in data.products!)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(products: l)));
                    },
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width / 2.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(l.thumbnail.toString()),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Spacer(),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  addToCart(l, context);
                                },
                                child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.add),
                                    )),
                              ))
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
