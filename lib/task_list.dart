import 'package:flutter/material.dart';
import 'package:todo/task_list_item.dart';
import 'model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({@required this.tasks});

// Use Builders.
  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Text('You don\'t have any tasks.')
        : ListView.separated(
            itemBuilder: (context, index) {
              return TaskListItem(task: tasks[index]);
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: tasks.length);
  }
}
