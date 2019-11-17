import 'package:flutter/material.dart';
import 'package:todo/add_task_fab.dart';
import 'package:todo/model/task_list_model.dart';
import 'package:provider/provider.dart';
import 'task_list.dart';
import 'add_task_fab.dart';

class TodoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
      ),
      body: Consumer<TaskListModel>(
        builder: (context, model, child) {
          return TaskList(tasks: model.tasks);
        },
      ),
      floatingActionButton: AddTaskFab(),
    );
  }
}
