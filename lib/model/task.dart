import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String text;
  String details;
  bool isComplete;

  Task({
    this.text: '',
    this.details: '',
    this.isComplete: false,
  }) : this.id = Uuid().v4();

  toggleComplete() {
    isComplete = !isComplete;
  }

  updateText(String text) {
    this.text = text;
  }

  updateDetails(String details) {
    this.details = details;
  }
}
