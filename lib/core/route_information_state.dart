import 'dart:async';

class SimpleRouteInformationState<T> {
  final Object? arguments;
  final Completer<T>? completer;

  SimpleRouteInformationState({
    this.arguments,
    this.completer,
  });
}
