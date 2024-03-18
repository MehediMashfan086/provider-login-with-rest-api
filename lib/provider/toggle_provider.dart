import 'package:flutter/foundation.dart';

class ToggleProvider with ChangeNotifier {
  bool _toggle = true;
  bool get toggle => _toggle;
  setToggle(bool value) {
    _toggle = value;
    notifyListeners();
  }
}
