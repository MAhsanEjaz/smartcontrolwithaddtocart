import 'package:flutter/material.dart';
import 'package:smart_control/model/product_model.dart';
import 'package:smart_control/services/cart_service.dart';

class ProductDetailScreen extends StatefulWidget {
  CartProducts? products;

  ProductDetailScreen({this.products});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(images == null
                        ? widget.products!.thumbnail.toString()
                        : images.toString()),
                    fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var l in widget.products!.images!)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          images = l;
                          setState(() {});
                        },
                        child: Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(l), fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.products!.description.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
