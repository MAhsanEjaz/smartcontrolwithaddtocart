import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:smart_control/custom_widgets/cash_card.dart';
import 'package:smart_control/custom_widgets/custom_dialog.dart';
import 'package:smart_control/custom_widgets/custom_textfield.dart';
import 'package:smart_control/custom_widgets/tab_card.dart';
import 'package:smart_control/provider/login_provider.dart';
import 'package:smart_control/screens/home_screen.dart';
import 'package:smart_control/services/student_post_service.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  List<String> gender = ['Male', 'Female'];
  String hintGender = 'Select Gender';
  int select = 1;
  String? cashHint;
  int? bank;



  TextEditingController refernce = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController natureofservice = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController dateControl = TextEditingController();

  handler() async {
    CustomDialog().showDia(context);
    await StudentPostService().studentPOstService(
        context: context,
        gender: hintGender,
        amount: amount.text,
        cash: cashHint,
        customer: customerName.text,
        date: dateControl.text,
        natureOfService: natureofservice.text,
        reference: refernce.text);

    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('Data inserted successfully')));

    CustomDialog().hideDialod(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart Control',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: NeumorphicColors.background,
      ),
      backgroundColor: NeumorphicColors.background,
      body: Consumer<LoginProvider>(builder: (context, data, _) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (select == 1)
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        // Text(data.loginModel!.userName.toString()),
                        CustomTextField(
                            text: 'Reference No', controller: refernce),
                        CustomTextField(
                          text: 'Customer Name',
                          controller: customerName,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                depth: NeumorphicTheme.embossDepth(context),
                                shadowLightColor: Colors.white,
                                shadowDarkColorEmboss: Colors.black54,
                                shadowLightColorEmboss: Colors.white,
                                shadowDarkColor: Colors.black54,
                                color: NeumorphicColors.background),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: DropdownButton(
                                  hint: Text(hintGender),
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  items: gender.map((e) {
                                    return DropdownMenuItem(
                                        value: e, child: Text(e));
                                  }).toList(),
                                  onChanged: (dynamic value) {
                                    hintGender = value;
                                    setState(() {});
                                  }),
                            ),
                          ),
                        ),
                        CustomTextField(
                            text: 'Nature of Service',
                            controller: natureofservice),
                        CustomTextField(text: 'Amount', controller: amount),
                        CustomTextField(
                            controller: dateControl,
                            text: '12/12/2012',
                            iconData: CupertinoIcons.calendar,
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now());
                              dateControl.text =
                                  date.toString().substring(0, 10);
                            }),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CashCard(
                              color: bank == 0 ? true : false,
                              onTap: () {
                                bank = 0;

                                cashHint = 'Cash';

                                setState(() {});
                              },
                              text: 'Cash',
                            ),
                            const SizedBox(width: 20),
                            CashCard(
                              color: bank == 1 ? true : false,
                              onTap: () {
                                bank = 1;
                                cashHint = 'Bank';

                                setState(() {});
                              },
                              text: 'Bank',
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: NeumorphicButton(
                            onPressed: () {
                              handler();
                              amount.clear();
                              natureofservice.clear();
                              dateControl.clear();
                              customerName.clear();
                              refernce.clear();
                            },
                            child: NeumorphicText('Save',
                                style:
                                    const NeumorphicStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 30)
                      ],
                    ),

                  if (select == 2) HomeScreen()

                  // TextField(
                  //   controller: name,
                  // ),
                  // TextField(
                  //   controller: lastName,
                  // ),
                  // TextField(
                  //   controller: gender,
                  // ),
                  // TextField(
                  //   controller: email,
                  // ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       handler();
                  //     },
                  //     child: Text('Save')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(context,
                  //           CupertinoPageRoute(builder: (context) => HomeScreen()));
                  //     },
                  //     child: Text('GO'))
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Neumorphic(
          // style: NeumorphicStyle(
          //     depth: NeumorphicTheme.embossDepth(context),
          //     shadowLightColor: Colors.white,
          //     shadowDarkColorEmboss: Colors.black54,
          //     shadowLightColorEmboss: Colors.white,
          //     shadowDarkColor: Colors.black54,
          //     color: NeumorphicColors.background),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabCard(
                    Color: select == 1 ? true : false,
                    onTap: () {
                      select = 1;
                      setState(() {});
                    },
                    iconData: CupertinoIcons.home),
                const SizedBox(
                  width: 100,
                ),
                TabCard(
                    Color: select == 2 ? true : false,
                    onTap: () {
                      select = 2;
                      setState(() {});
                    },
                    iconData: CupertinoIcons.square_list),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
