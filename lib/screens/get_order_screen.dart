import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/provider/get_cart_provider.dart';
import 'package:smart_control/screens/order_list_view_screen.dart';
import 'package:smart_control/services/get_order_service.dart';

class GetOrderScreen extends StatefulWidget {
  const GetOrderScreen({Key? key}) : super(key: key);

  @override
  State<GetOrderScreen> createState() => _GetOrderScreenState();
}

class _GetOrderScreenState extends State<GetOrderScreen> {
  getOrdersHandler() {
    GetOrderService().getOrderService(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getOrdersHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetOrderProvider>(builder: (context, data, _) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    getOrdersHandler();
                  },
                  child: Text('Refresh'))
            ],
            title: Text(data.model![0].name.toString()),
          ),
          body: data.model!.isEmpty
              ? Center(child: Text("No Orders"))
              : OrderListView(
                  model: data.model,
                ));
    });
  }
}
