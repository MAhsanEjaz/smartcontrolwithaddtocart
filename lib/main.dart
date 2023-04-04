import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_control/provider/cart_provider.dart';
import 'package:smart_control/provider/get_cart_provider.dart';
import 'package:smart_control/provider/login_provider.dart';
import 'package:smart_control/provider/product_provider.dart';
import 'package:smart_control/provider/registration_provider.dart';
import 'package:smart_control/provider/student_provider.dart';
import 'package:smart_control/screens/product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  final cartProvider = CartProvider();
  await cartProvider.loadCartItems();

  runApp(MyApp(cartProvider: cartProvider));
}

class MyApp extends StatefulWidget {
  CartProvider? cartProvider;

  MyApp({this.cartProvider});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.cartProvider,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => StudentProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
          ChangeNotifierProvider(create: (context) => RegistrationProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => GetOrderProvider()),
        ],
        child: MaterialApp(
          // home: EditScreen(),
          // home: RegistartionScreen(),
          home: ProductScreen(),
          // home: LoginScreen()
          // home: MyFileScreen(),
          // home: CaptilizationScreen(),
          // home: PhoneNumberFormatter(),
        ),
      ),
    );
  }
}
