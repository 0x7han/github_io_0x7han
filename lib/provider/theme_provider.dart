import 'package:flutter/material.dart';

enum HoverEnum {
  section,
  cardExperience,
}

class ThemeProvider with ChangeNotifier {
  Offset _posCursor = const Offset(0, 0);
  Offset get posCursor => _posCursor;

  void setPosCursor(Offset offset) {
    _posCursor = offset;
    notifyListeners();
  }

  Key? _hoverSection;
  Key? get hoverSection => _hoverSection;

  Key? _hoverCardExperience;
  Key? get hoverCardExperience => _hoverCardExperience;

  void setHover(HoverEnum hoverEnum, Key? value) {
    switch (hoverEnum) {
      case HoverEnum.section:
        _hoverSection = value;
        break;
      case HoverEnum.cardExperience:
        _hoverCardExperience = value;
        break;
    }

    notifyListeners();
  }
}
