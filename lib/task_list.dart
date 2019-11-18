import 'package:flutter/material.dart';
import 'package:todo/model/task_list_model.dart';
import 'package:todo/task_list_item.dart';
import 'package:reorderables/reorderables.dart';
import 'package:provider/provider.dart';
import 'model/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({Key key, @required this.tasks}) : super(key: key);

  @override
  State createState() {
    return _TaskListState();
  }
}

class _TaskListState extends State<TaskList> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _onReorder(int oldIndex, int newIndex) {
      Provider.of<TaskListModel>(context, listen: false)
          .reorderTask(oldIndex, newIndex);
    }

    return widget.tasks.isEmpty
        ? _buildEmptyState()
        : CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              ReorderableSliverList(
                onReorder: _onReorder,
                onNoReorder: (index) => print('eh'),
                delegate: ReorderableSliverChildBuilderDelegate(
                  (context, index) => TaskListItem(
                    task: widget.tasks[index],
                  ),
                  childCount: widget.tasks.length,
                ),
              )
            ],
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
