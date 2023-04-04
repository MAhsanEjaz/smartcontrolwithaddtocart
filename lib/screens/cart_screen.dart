import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/model/cart_model.dart';
import 'package:smart_control/model/get_cart_model.dart';
import 'package:smart_control/model/product_model.dart';
import 'package:smart_control/provider/cart_provider.dart';
import 'package:smart_control/provider/login_provider.dart';
import 'package:smart_control/screens/get_order_screen.dart';
import 'package:smart_control/services/checkout_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  checkoutHandler(String? total, productList) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [CupertinoActivityIndicator()],
              ),
            ));

    await CheckOutService()
        .checkoutService(context: context, total: total, products: productList);

    Navigator.pop(context);
  }

  // List<CartProducts> product = [];

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, LoginProvider>(
        builder: (context, data, login, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.model!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Card(
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(data
                                                .model![index].thumbnail
                                                .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.model![index].title.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    data.model![index].qty--;
                                                    Provider.of<CartProvider>(
                                                            context,
                                                            listen: false)
                                                        .updateCartItems(
                                                            index: index,
                                                            qty: data
                                                                .model![index]
                                                                .qty);
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                      CupertinoIcons.minus)),
                                              Text(data.model![index].qty
                                                  .toString()),
                                              InkWell(
                                                  onTap: () {
                                                    data.model![index].qty++;

                                                    Provider.of<CartProvider>(
                                                            context,
                                                            listen: false)
                                                        .updateCartItems(
                                                            index: index,
                                                            qty: data
                                                                .model![index]
                                                                .qty);

                                                    setState(() {});
                                                  },
                                                  child: Icon(Icons.add)),
                                              Text(
                                                  '${double.parse(data.model![index].price.toString()).round() * data.model![index].qty}')
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              child: InkWell(
                                child: Icon(Icons.delete),
                                onTap: () {
                                  data.deleteData(index);
                                  setState(() {});
                                },
                              ),
                              right: 10,
                              top: 10,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    data.emptyCart();

                    // checkoutHandler(
                    //     data.totalCalculatedPrice.toString(),
                    //     Provider.of<CartProvider>(context, listen: false)
                    //         .model);
                  },
                  child: Text('Checkout')),
              Text(data.totalCalculatedPrice.toString()),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => GetOrderScreen()));
                  },
                  child: Text('Orders')),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: StatefulBuilder(
                                builder: (context, setstas) {
                                  return Column(
                                    children: [
                                      CupertinoSwitch(
                                          value: switch1,
                                          onChanged: (val) {
                                            switch1 = val;
                                            setstas(() {});
                                          })
                                    ],
                                  );
                                },
                              ),
                            ));
                  },
                  child: Text('Show'))
            ],
          ),
        ),
      );
    });
  }

  bool switch1 = false;
}
