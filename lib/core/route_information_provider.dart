import 'package:flutter/widgets.dart';

import '../simple_navigator.dart';

class SimpleRouteInformationProvider extends PlatformRouteInformationProvider {
  SimpleRouteInformationProvider({required String initialPath})
      : _value = RouteInformation(
          uri: Uri.parse(initialPath),
          state: SimpleRouteInformationState(),
        ),
        super(
          initialRouteInformation: RouteInformation(
            uri: Uri.parse(initialPath),
            state: SimpleRouteInformationState(),
          ),
        );

  @override
  RouteInformation get value => _value;

  RouteInformation _value;

  void updateRouteInformation(RouteInformation information) {
    _value = information;
    notifyListeners();
  }
}
