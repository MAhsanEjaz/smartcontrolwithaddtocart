import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/custom_widgets/custom_dialog.dart';
import 'package:smart_control/provider/student_provider.dart';
import 'package:smart_control/services/dummy_service.dart';
import 'package:smart_control/services/student_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  studentsHandler() async {
    CustomDialog().showDia(context);
    await StudentsService().studentServics(context: context);
    CustomDialog().hideDialod(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      studentsHandler();
    });
  }

  Future<void> _refresh() async {
    await studentsHandler();
    print('handler----->');
    setState(() {});
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Consumer<StudentProvider>(builder: (context, data, _) {
        return SafeArea(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.student!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Neumorphic(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            RowData(
                              text1: 'Sr',
                              text2: data.student![index].id.toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Reference Number',
                              text2: data.student![index].referenceNumber
                                  .toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Customer Name',
                              text2: data.student![index].firstName.toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Gender',
                              text2: data.student![index].gender.toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Nature of Service',
                              text2:
                                  data.student![index].natureService.toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Amount',
                              text2: data.student![index].amount.toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Date',
                              text2: data.student![index].date.toString(),
                            ),
                            CustomDivider(),
                            RowData(
                              text1: 'Payment',
                              text2: data.student![index].cash.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
      }),
    );
  }
}

class CustomDivider extends StatefulWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  _CustomDividerState createState() => _CustomDividerState();
}

class _CustomDividerState extends State<CustomDivider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 2, width: double.infinity, child: Neumorphic());
  }
}

class RowData extends StatefulWidget {
  String? text1;
  String? text2;

  RowData({this.text1, this.text2});

  @override
  _RowDataState createState() => _RowDataState();
}

class _RowDataState extends State<RowData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text1!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Text(widget.text2!),
        ],
      ),
    );
  }
}
