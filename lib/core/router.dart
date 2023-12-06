import 'package:flutter/widgets.dart';

import '../simple_navigator.dart';

class SimpleRouter implements RouterConfig<SimpleRouteMatch> {
  SimpleRouter({
    String? initialPath,
    required List<SimpleRoute> routes,
  }) {
    routerDelegate = SimpleRouterDelegate(
      router: this,
      routes: routes,
    );
    routeInformationProvider = SimpleRouteInformationProvider(
      initialPath: initialPath ?? '/',
    );
    routeInformationParser = SimpleRouterInformationParser(routes: routes);
  }

  @override
  late SimpleRouterDelegate routerDelegate;

  @override
  late SimpleRouteInformationProvider? routeInformationProvider;

  @override
  late SimpleRouterInformationParser? routeInformationParser;

  @override
  BackButtonDispatcher? get backButtonDispatcher => RootBackButtonDispatcher();

  static SimpleRouter of(BuildContext context) {
    final inherited = maybeOf(context);
    assert(inherited != null, 'No AppRouter found in context');
    return inherited!.router;
  }

  static SimpleInheritedRouter? maybeOf(BuildContext context) {
    final SimpleInheritedRouter? inherited = context
        .getElementForInheritedWidgetOfExactType<SimpleInheritedRouter>()
        ?.widget as SimpleInheritedRouter?;
    return inherited;
  }
}
