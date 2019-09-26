import 'package:aeo_uber/resources/constants/login_constant.dart';
import 'package:flutter/material.dart';

class OtpLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Hero(
              placeholderBuilder: (_, __, ___) => Container(),
              tag: LoginConstant.ENTER_NUMBER,
              child: Text(
                'Enter your mobile number',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
