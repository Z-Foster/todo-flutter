import 'package:flutter/material.dart';
import 'package:todo/task_list_item.dart';
import 'model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({@required this.tasks});

  Widget _buildEmptyState() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(20),
      child: Text(
        'You don\'t have any tasks.',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

// Use Builders.
  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? _buildEmptyState()
        : ListView.separated(
            itemBuilder: (context, index) {
              return TaskListItem(task: tasks[index]);
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: tasks.length,
          );
  }
}
