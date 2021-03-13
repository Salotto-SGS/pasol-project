import 'package:flutter/material.dart';
import 'package:gpoi/views/allLevels.dart';
import 'package:gpoi/views/level.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/AllLevels':
        return MaterialPageRoute(builder: (_) => AllLevelsPage());
      case '/Level':
        return MaterialPageRoute(builder: (_) => LevelPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
