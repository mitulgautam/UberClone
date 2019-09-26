import 'package:aeo_uber/resources/constants/route_constant.dart';
import 'package:aeo_uber/ui/view/dashboard.dart';
import 'package:aeo_uber/ui/view/login.dart';
import 'package:aeo_uber/ui/view/otp_login.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.LOGIN:
        return MaterialPageRoute(builder: (_) => Login());
      case RouteConstant.OTP:
        return MaterialPageRoute(builder: (_) => OtpLogin());
      case RouteConstant.OTP_VERIFICATION:
        return MaterialPageRoute(builder: (_) => OtpVerification());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('${settings.name} does not exists.'),
                  ),
                ));
    }
  }
}
