import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task_list_model.dart';
import 'model/task.dart';
import 'styles.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Key key;

  TaskListItem({@required this.task}) : key = ValueKey(task.id);

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
    _onDismissed(DismissDirection direction) {
      switch (direction) {
        case DismissDirection.startToEnd:
          {
            Provider.of<TaskListModel>(context, listen: false)
                .toggleComplete(task);
          }
          break;
        case DismissDirection.endToStart:
          {
            Provider.of<TaskListModel>(context, listen: false).deleteTask(task);
          }
          break;
        default:
          break;
      }
    }

    return Dismissible(
      key: key,
      background: Container(
        child: Icon(Icons.check, color: Styles.secondaryAppColor),
        color: Styles.appColor,
        padding: EdgeInsets.only(left: 20),
        alignment: AlignmentDirectional.centerStart,
      ),
      secondaryBackground: Container(
        child: Icon(Icons.delete, color: Styles.secondaryAppColor),
        color: Styles.deleteColor,
        padding: EdgeInsets.only(right: 20),
        alignment: AlignmentDirectional.centerEnd,
      ),
      onDismissed: (direction) => _onDismissed(direction),
      child: ListTile(
//      key: key,
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
          onPressed: () => Provider.of<TaskListModel>(context, listen: false)
              .deleteTask(task),
        ),
      ),
    );
  }
}
