import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poetry_app/view/screens/home_screen.dart';
import 'package:poetry_app/view/screens/poet_screen.dart';
import 'package:poetry_app/view/screens/read_screen.dart';

abstract class AppRoute {
  static const home = '/';
  static const poet = '/poet_screen';
  static const read = '/read_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case poet:
        return MaterialPageRoute(builder: (_) => const PoetScreen());
      case read:
        return MaterialPageRoute(builder: (_) => const ReadScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Page found')),
          ),
        );
    }
  }
}
