import 'package:flutter/material.dart';

extension NavigationHelpers on BuildContext {
  void push(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => screen));
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushReplacement(Widget screen) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => screen));
  }
}
