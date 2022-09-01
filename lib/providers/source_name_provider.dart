import 'package:flutter/foundation.dart';

class SourceNameProvider extends ChangeNotifier {
  String _sourceName = '';

  String get sourceName => _sourceName;

  setSourceName(String value) {
    _sourceName = value;
    notifyListeners();
  }
}
