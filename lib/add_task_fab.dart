import 'package:flutter/material.dart';
import 'package:todo/new_task_modal.dart';
import 'styles.dart';

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
              var modalFuture = showModalBottomSheet(
                context: context,
                // isScrollControlled is necessary for modal to increase in
                // height dynamically with TextField.
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: Styles.bottomSheetBorderRadius,
                ),
                builder: (context) => NewTaskModal(),
              );
              _showFloatingActionButton(false);
              // Show fab on modal close.
              modalFuture.then((_) => _showFloatingActionButton(true));
            },
          )
        : Container();
  }

  _showFloatingActionButton(bool value) {
    setState(() {
      _showFab = value;
    });
  }
}
