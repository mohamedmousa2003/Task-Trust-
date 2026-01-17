import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_trust_development/cofig/routes/routes.dart';
import '../../features/navigation_bar_screen/view/main_layout.dart';

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

    /// Navigation Bar View
      case Routes.navigationBarView:
        return CupertinoPageRoute(
          builder: (_) => const NavigationBarScreen(),
        );




     ///////// Default (Unknown Route)
      default:
        return _errorRoute();
    }

  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
  
}
