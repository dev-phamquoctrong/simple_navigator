import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../simple_navigator.dart';

part 'arguments_manager.dart';
part 'router_helper.dart';

class SimpleRouterDelegate extends RouterDelegate<SimpleRouteMatch>
    with PopNavigatorRouterDelegateMixin<SimpleRouteMatch>, ChangeNotifier {
  final List<SimpleRoute> routes;
  final SimpleRouter router;

  SimpleRouterDelegate({
    required this.routes,
    required this.router,
  });

  List<Page> _pages = [];
  SimpleRouteMatch? _currentMatch;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('[Widget build(BuildContext context)] has been triggered.');
      print('[List of pages] $_pages');
    }
    return SimpleInheritedRouter(
      router: router,
      child: Navigator(
        key: navigatorKey,
        pages: _pages,
        onPopPage: (route, result) {
          print('??????????? onPopPage');
          if (!route.didPop(result)) {
            return false;
          }
          if (_pages.isNotEmpty) {
            _pages.removeLast();
            _removeArgument();
            notifyListeners();
          }
          return true;
        },
      ),
    );
  }

  @override
  SimpleRouteMatch? get currentConfiguration => _currentMatch;

  void _addPageToStack(SimpleRouteMatch match) {
    final route =
        routes.firstWhere((element) => element.path == match.uri.toString());
    if (route.dependencies != null) {
      route.dependencies!();
    }
    final arguments = match.state?.arguments;
    _pages.add(
      MaterialPage(
        key: UniqueKey(),
        child: route.builder(arguments),
        name: route.path,
      ),
    );
    print('>>>>>>>>>>>>> _addPageToStack FINISHED');
  }

  void _addArguments(Object? argument) {
    Simple._addArgument(argument);
  }

  void _removeArgument() {
    Simple._removeArgument();
  }

  @override
  Future<void> setNewRoutePath(SimpleRouteMatch configuration) {
    if (kDebugMode) {
      print('[setNewRoutePath] ${configuration.uri} has been triggered.');
    }
    SimpleRouteInformationState? state;
    if (configuration.state != null) {
      state = configuration.state;
    }
    _addArguments(state?.arguments);
    _currentMatch = configuration;
    _addPageToStack(configuration);
    _pages = List.from(_pages);
    notifyListeners();
    return SynchronousFuture(null);
  }
}
