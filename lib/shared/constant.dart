import 'package:flutter/material.dart';

String appName = "KABACHI";

class Constant {
  // static const Color primaryColor = Color(0xff04448c);
  // static  Color primaryColor = Colors.orange.shade800;
  static Color primaryColor = Colors.orangeAccent;
  static Color? dividerColor = Colors.grey[500];

  static String name = '';
  static String img = '';
  static String email = '';
  static String phone = '';
  static String resendPhone = '';
}

class Images {
  static const AssetImage logoImg = AssetImage("assets/images/logo.png");
}

class NetworkUtil {
  static String baseUrl = "http://bbflightappapi.pythonanywhere.com/";
  static String saveLoginDetailsUrl = baseUrl + "login.php?";
  static String EndPoint="api/v1/flight/";
}
