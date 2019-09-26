import 'package:aeo_uber/main.dart';
import 'package:aeo_uber/ui/widget/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //move this line to splash when created
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: LoginWidget.buildLogoArea(),
            ),
            LoginWidget.buildLoginArea(
              context,
            )
          ],
        ),
      ),
    );
  }
}
