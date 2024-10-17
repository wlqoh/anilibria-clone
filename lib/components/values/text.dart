import 'package:flutter/material.dart';

class TextValue extends ValueNotifier<String>{
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  TextValue(super.value) {
    controller.text = value;
    controller.addListener(() {
      if (value != controller.text) {
        value = controller.text;
        notifyListeners();
      }
    });
  }

  factory TextValue.defaultValue() {
    return TextValue("");
  }
}