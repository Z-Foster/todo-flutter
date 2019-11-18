import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task_list_model.dart';
import 'model/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({@required this.task});

  Widget _buildTitle() {
    return Text(
      task.text,
      style: task.isComplete
          ? TextStyle(decoration: TextDecoration.lineThrough)
          : null,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      task.details,
      style: task.isComplete
          ? TextStyle(decoration: TextDecoration.lineThrough)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(task.id),
      leading: Checkbox(
        value: task.isComplete,
        onChanged: (bool checked) {
          Provider.of<TaskListModel>(context, listen: false)
              .toggleComplete(task);
        },
      ),
      title: _buildTitle(),
      subtitle: task.details.isNotEmpty ? _buildSubtitle() : null,
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () =>
            Provider.of<TaskListModel>(context, listen: false).deleteTask(task),
      ),
    );
  }
}
