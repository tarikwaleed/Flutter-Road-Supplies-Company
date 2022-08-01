import 'package:flutter/material.dart';

class SourceIDProvider extends ChangeNotifier {
  String? _sourceId = '';

  String? get sourceId => _sourceId;

  setSourceId(String? value) {
    _sourceId = value;
    notifyListeners();
  }
}
