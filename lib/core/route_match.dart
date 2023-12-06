import '../simple_navigator.dart';

class SimpleRouteMatch<T> {
  final Uri uri;
  final SimpleRouteInformationState<T>? state;

  SimpleRouteMatch({
    required this.uri,
    this.state,
  });
}
