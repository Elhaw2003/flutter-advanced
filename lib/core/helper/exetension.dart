import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplaceMentNamed(String routName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routName, {
    Object? arguments,
    required RoutePredicate routePredicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routName, routePredicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
