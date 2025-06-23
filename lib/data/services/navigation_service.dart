import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentState!.context;

  Future<dynamic> navigateToRoute(Widget route) {
    return navigatorKey.currentState!.push(_buildPageRoute(route));
  }

  Future<dynamic> navigateToAndRemoveUntilWidget(Widget route) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      _buildPageRoute(route),
      (route) => false,
    );
  }

  goBack({dynamic value}) {
    navigatorKey.currentState?.pop(value);
  }

  MaterialPageRoute _buildPageRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
