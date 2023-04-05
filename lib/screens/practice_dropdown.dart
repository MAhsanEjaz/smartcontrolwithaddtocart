import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/provider/customers_provider.dart';
import 'package:smart_control/services/customers_service.dart';

class AnimatedDropDown extends StatefulWidget {
  const AnimatedDropDown({Key? key}) : super(key: key);

  @override
  State<AnimatedDropDown> createState() => _AnimatedDropDownState();
}

class _AnimatedDropDownState extends State<AnimatedDropDown>
    with TickerProviderStateMixin {
  Map<int, Widget> data = {
    1: Icon(Icons.add),
    2: Icon(Icons.abc),
  };

  int selectIndex = 0;

  String? name;

  bool indicate = false;

  getCustomersHandler() async {
    indicate = true;
    setState(() {});
    await CustomerService().customersService(context: context);
    indicate = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCustomersHandler();
    });
  }

  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  DropdownButton(
                      items: data.customer!.map((e) {
                        return DropdownMenuItem(
                            value: e.firstName,
                            child: Text(e.firstName.toString()));
                      }).toList(),
                      onChanged: (_) {}),
                  InkWell(
                    onTap: () {
                      isExpand = !isExpand;

                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black26)),
                        child: Center(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(name == null
                                      ? 'Select Name'
                                      : name.toString()),
                                ))),
                      ),
                    ),
                  ),
                  isExpand
                      ? AnimatedSizeAndFade(
                          fadeOutCurve: Curves.decelerate,
                          sizeCurve: Curves.bounceInOut,
                          fadeInCurve: Curves.easeInOutCirc,
                          sizeDuration: Duration(seconds: 3),
                          fadeDuration: Duration(seconds: 3),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.black26)),
                                elevation: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var l in data.customer!)
                                      InkWell(
                                          onTap: () {
                                            name = l.firstName;
                                            isExpand = !isExpand;
                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              l.firstName.toString(),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
              indicate == true
                  ? Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black12),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ))
                  : Container()
            ],
          ),
        ),
      );
    });
  }
}
