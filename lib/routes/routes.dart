import 'package:flutter/material.dart';
import 'package:test_uis/pages/cookbook.dart';

class AppRoute {
  static final Map<String, WidgetBuilder> routes = {
    "/cookbook": (BuildContext context) => UiCookBook(),
  };
}
