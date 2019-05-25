import 'package:flutter/material.dart';
import 'ui/loginPage.dart';
import 'ui/regisPage.dart';
import 'ui/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(66, 165, 245, 1.0)
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Page_login(),
        "/register": (context) => Page_regis(),
        "/home": (context) => About(),
      },
    );
  }
}
