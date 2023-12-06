part of 'router_delegate.dart';

// ignore: non_constant_identifier_names
final Simple = _ArgumentsManager();

class _ArgumentsManager {
  _ArgumentsManager._internal();

  static final _instance = _ArgumentsManager._internal();

  factory _ArgumentsManager() {
    return _instance;
  }

  final List<Object?> _arguments = [];

  void _addArgument(Object? argument) {
    _instance._arguments.add(argument);
  }

  void _removeArgument() {
    _instance._arguments.removeLast();
  }

  Object? get arguments => _instance._arguments.last;
}
