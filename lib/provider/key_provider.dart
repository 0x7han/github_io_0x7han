import 'package:flutter/material.dart';

class KeyProvider extends InheritedWidget {
  const KeyProvider({super.key, required super.child});

    static KeyProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KeyProvider>();
  }

  @override
  bool updateShouldNotify(KeyProvider oldWidget) {
    return key != oldWidget.key;
  }

}
