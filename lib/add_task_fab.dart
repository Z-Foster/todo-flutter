import 'package:flutter/material.dart';
import 'package:todo/add_task_modal.dart';

class AddTaskFab extends StatefulWidget {
  @override
  State createState() => _AddTaskFabState();
}

class _AddTaskFabState extends State<AddTaskFab> {
  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    return _showFab
        ? FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // modalFuture resolves when modal closes.
              var controller = showBottomSheet(
                context: context,
                builder: (context) => AddTaskModal(),
              );
              _showFloatingActionButton(false);
              controller.closed.then((_) => _showFloatingActionButton(true));
            })
        : Container();
  }

  _showFloatingActionButton(bool value) {
    setState(() {
      _showFab = value;
    });
  }
}
