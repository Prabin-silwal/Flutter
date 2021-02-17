import 'package:MeroDin/login.dart';
import 'package:MeroDin/mainpage.dart';
import 'package:MeroDin/routing_constants.dart';

import 'package:flutter/material.dart';
import 'UnDefinedView.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final args = settings.arguments;
  switch (settings.name) {
    case LoginRouteView:
      return MaterialPageRoute(builder: (context) => Login());
    case MainPageView:
      return MaterialPageRoute(builder: (context) => Mainpage());
    default:
      return MaterialPageRoute(
          builder: (context) => UnDefinedView(name: settings.name));
  }
}
