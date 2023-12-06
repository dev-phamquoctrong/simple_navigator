import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../simple_navigator.dart';

class SimpleRouterInformationParser
    extends RouteInformationParser<SimpleRouteMatch> {
  final List<SimpleRoute> routes;

  SimpleRouterInformationParser({required this.routes});

  @override
  Future<SimpleRouteMatch> parseRouteInformation(
      RouteInformation routeInformation) {
    if (kDebugMode) {
      print('[parseRouteInformation] has been triggered.');
      print('[parseRouteInformation] has arguments: ${routeInformation.state}');
    }
    assert(routeInformation.state != null);
    late SimpleRouteMatch routeMatch;
    final state = routeInformation.state;
    if (state is SimpleRouteInformationState) {
      routeMatch = SimpleRouteMatch(
        uri: routeInformation.uri,
        state: state,
      );
    }
    return SynchronousFuture(routeMatch);
  }

  @override
  RouteInformation? restoreRouteInformation(SimpleRouteMatch configuration) {
    return RouteInformation(
      uri: configuration.uri,
    );
  }
}
