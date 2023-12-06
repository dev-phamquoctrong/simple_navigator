import 'package:flutter/widgets.dart';

import '../simple_navigator.dart';

class SimpleInheritedRouter extends InheritedWidget {
  final SimpleRouter router;

  const SimpleInheritedRouter({
    Key? key,
    required Widget child,
    required this.router,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
