import 'package:flutter/material.dart';
import 'package:shoes_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'shoe';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const ShoeScreen(),
    'shoe': (BuildContext context) => const ShoeDescScreen(),
  };
}
