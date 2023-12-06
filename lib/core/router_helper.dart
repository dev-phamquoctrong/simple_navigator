part of 'router_delegate.dart';

extension SimpleRouterHepler on BuildContext {
  Future<T?> nextTo<T>(String newPath, {Object? arguments}) {
    final completer = Completer<T>();
    final state = SimpleRouteInformationState<T>(
      arguments: arguments,
      completer: completer,
    );
    final info = RouteInformation(
      uri: Uri.parse(newPath),
      state: state,
    );
    final router = SimpleRouter.of(this);
    router.routeInformationProvider?.updateRouteInformation(info);
    return completer.future;
  }

  void back<T extends Object>({T? result}) {
    final router = SimpleRouter.of(this);
    router.routerDelegate.currentConfiguration?.state?.completer
        ?.complete(result);
    router.routerDelegate.popRoute();
  }

  void removeRoute(SimpleRouteMatch match) {
    // Todo
    final router = SimpleRouter.of(this);
    router.routerDelegate.routes
        .removeWhere((element) => element.path == match.uri.toString());
  }

  // TODO: This method is not working.
  Future<void> nextToAndRemoveUntil<T>(String newPath, {Object? arguments}) async {
    final router = SimpleRouter.of(this);

    router.routerDelegate.navigatorKey.currentState?.popUntil((route) => false);
    final completer = Completer<T>();
    final state = SimpleRouteInformationState<T>(
      arguments: arguments,
      completer: completer,
    );
    final info = RouteInformation(
      uri: Uri.parse(newPath),
      state: state,
    );
    router.routeInformationProvider?.updateRouteInformation(info);
  }
}
