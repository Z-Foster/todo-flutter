import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/task_list_model.dart';
import 'todo_page.dart';
import 'styles.dart';

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskListModel(),
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(
          primarySwatch: Styles.appColor,
        ),
        home: TodoPage(),
      ),
    );
  }
}
