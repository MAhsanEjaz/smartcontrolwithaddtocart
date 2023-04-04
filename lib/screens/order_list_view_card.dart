import 'package:flutter/material.dart';
import 'package:smart_control/model/get_cart_model.dart';

class OrderListViewCard extends StatefulWidget {
  GetCartModel? getCartModel;

  OrderListViewCard({this.getCartModel});

  @override
  State<OrderListViewCard> createState() => _OrderListViewCardState();
}

class _OrderListViewCardState extends State<OrderListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (var l in widget.getCartModel!.products!)
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget
                                    .getCartModel!.products![0].thumbnail
                                    .toString()),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      NetworkImage(l.thumbnail.toString()),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  l.category.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
        Positioned(
            right: 10,
            bottom: 20,
            child: Text(
              widget.getCartModel!.total.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Positioned(left: 0, right: 0, top: 100, child: Divider()),
      ],
    );
  }
}
