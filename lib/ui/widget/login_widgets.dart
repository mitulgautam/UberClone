import 'package:aeo_uber/main.dart';
import 'package:aeo_uber/resources/constants/login_constant.dart';
import 'package:aeo_uber/resources/constants/route_constant.dart';
import 'package:aeo_uber/resources/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class LoginWidget {
  static buildLogoArea() {
    return Container(
      color: AppColor.blueColor,
      child: Center(
        child: Container(
          width: size.width / 5,
          height: size.width / 5,
          color: Colors.white,
          child: Image.asset('assets/images/uber.png'),
        ),
      ),
    );
  }

  static buildLoginArea(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
            child: Text(
              'Get moving with Uber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/india.png',
                    height: 32,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '+91',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      prefix0.Navigator.pop(context);
                      Navigator.of(context)
                          .pushReplacementNamed(RouteConstant.OTP_VERIFICATION);
                    }
                    /*Navigator.pushNamed(context, RouteConstant.OTP)*/
                    ,
                    child: Hero(
                      tag: LoginConstant.ENTER_NUMBER,
                      child: Text(
                        'Enter your mobile number',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          InkWell(
            highlightColor: Colors.white,
            splashColor: Colors.transparent,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Or connect with social',
                style: TextStyle(
                    color: AppColor.blueColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
