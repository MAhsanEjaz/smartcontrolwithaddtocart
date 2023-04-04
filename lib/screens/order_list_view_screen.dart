import 'package:flutter/material.dart';
import 'package:smart_control/model/get_cart_model.dart';
import 'package:smart_control/screens/order_list_view_card.dart';

class OrderListView extends StatefulWidget {
  List<GetCartModel>? model = [];

  OrderListView({this.model});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.model!.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget
                                        .model![index].products![0].thumbnail
                                        .toString()),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 160,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        widget.model![index].products!.length,
                                    itemBuilder: (context, l) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                  widget.model![index]
                                                      .products![l].thumbnail
                                                      .toString()),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              widget.model![index].products![l]
                                                  .category
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.max,
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 20,
                  child: Text(
                    'Total: ${widget.model![index].total.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }
}
