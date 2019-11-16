import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String text;
  bool isComplete;

  Task({
    this.text: '',
    this.isComplete: false,
  })  : assert(text != null),
        this.id = Uuid().v4();

  toggleComplete() {
    isComplete = !isComplete;
  }

  updateText(String text) {
    this.text = text;
  }
}
