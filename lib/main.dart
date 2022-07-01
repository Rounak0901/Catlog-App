import 'package:flutter/material.dart';
import 'package:my_app/pages/cart_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
