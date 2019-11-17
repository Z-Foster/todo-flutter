import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskListModel extends ChangeNotifier {
  List<Task> _tasks = [
    Task(text: 'Do dishes.'),
    Task(text: 'Update calendar.'),
    Task(text: 'Work on todo app'),
    Task(text: 'Yoga'),
    Task(text: 'Relax with Runescape'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  createTask(String text, {String details}) {
    _tasks.add(Task(text: text, details: details));
    notifyListeners();
  }

  deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  toggleComplete(Task task) {
    int index = _tasks.indexOf(task);
    _tasks[index].toggleComplete();
    notifyListeners();
  }

  updateTaskText(Task task, String text) {
    task.updateText(text);
    notifyListeners();
  }
}
