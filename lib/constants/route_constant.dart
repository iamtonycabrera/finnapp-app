// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:finnapp/pages/home/home_page.dart';
import 'package:finnapp/pages/login/login_page.dart';
import 'package:finnapp/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class RouteConstants {
  //LOGIN
  static const String WELCOME_PAGE = '/welcome_page';
  static const String LOGIN_PAGE = '/login_page';
  //STATE
  static const String INTERNET_DISABLED = '/disabled_internet_page';
  //HOME
  static const String HOME_PAGE = '/home_page';

  static var ALL_ROUTES = <String, WidgetBuilder>{
    //LOGIN
    RouteConstants.WELCOME_PAGE: (context) => const WelcomePage(),
    RouteConstants.LOGIN_PAGE: (context) => const LoginPage(),
    //STATE
    RouteConstants.INTERNET_DISABLED: (context) => const WelcomePage(),
    //HOME
    RouteConstants.HOME_PAGE: (context) => const HomePage(),
  };
}
