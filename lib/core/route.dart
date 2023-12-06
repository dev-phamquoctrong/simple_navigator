import 'package:flutter/widgets.dart';

class SimpleRoute {
  final String path;
  final Function? dependencies;
  final Widget Function(Object? arguments) builder;

  SimpleRoute({
    required this.path,
    required this.builder,
    this.dependencies,
  });
}
