import 'package:flutter/material.dart';
import 'package:todo/model/task_list_model.dart';
import 'package:provider/provider.dart';
import 'task_list.dart';

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
    );
  }
}
