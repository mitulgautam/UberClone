import 'package:aeo_uber/resources/constants/route_constant.dart';
import 'package:aeo_uber/resources/routes.dart';
import 'package:flutter/material.dart';

//Global Variable for size
Size size;

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.onGenerateRoute,
      initialRoute: RouteConstant.LOGIN,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'QS'),
    );
  }
}
