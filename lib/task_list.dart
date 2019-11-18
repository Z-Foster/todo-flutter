import 'package:flutter/material.dart';
import 'package:todo/model/task_list_model.dart';
import 'package:todo/task_list_item.dart';
import 'package:provider/provider.dart';
import 'model/task.dart';

class TaskList extends StatelessWidget {
  final List<TaskListItem> taskItems;

  TaskList({Key key, @required List<Task> tasks})
      : taskItems = tasks.map((task) => TaskListItem(task: task)).toList(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    _onReorder(int oldIndex, int newIndex) {
      int lastIndex = taskItems.length - 1;
      if (newIndex > lastIndex) {
        newIndex = lastIndex;
      }
      Provider.of<TaskListModel>(context, listen: false)
          .reorderTask(oldIndex, newIndex);
    }

    return taskItems.isEmpty
        ? _buildEmptyState()
        : ReorderableListView(
            onReorder: _onReorder,
            children: taskItems,
          );
  }

//  @override
//  Widget build(BuildContext context) {
//    return tasks.isEmpty
//        ? _buildEmptyState()
//        : ListView.separated(
//            itemBuilder: (context, index) {
//              return TaskListItem(task: tasks[index]);
//            },
//            separatorBuilder: (context, index) => Divider(),
//            itemCount: tasks.length,
//          );
//  }

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
}
