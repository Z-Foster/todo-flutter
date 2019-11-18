import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/task_list_model.dart';
import 'styles.dart';

class NewTaskModal extends StatefulWidget {
  @override
  State createState() => _NewTaskModalState();
}

class _NewTaskModalState extends State<NewTaskModal> {
  FocusNode _taskDetailsFocusNode =
      FocusNode(debugLabel: 'Task details focused');
  bool _detailsAdded = false;
  bool _detailsInitiallyFocused = false;
  String _taskText = '';
  String _detailText = '';

  @override
  Widget build(BuildContext context) {
    _setupFocus();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Styles.bottomSheetBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'New task',
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  onChanged: _setTaskText,
                  onSubmitted: (_) => _createTask(),
                ),
              ),
              _detailsAdded
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Add details',
                          border: InputBorder.none,
                        ),
                        focusNode: _taskDetailsFocusNode,
                        style: TextStyle(fontSize: 14),
                        maxLines: null,
                        onChanged: _setDetailText,
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.subject),
                      color: Colors.blue,
                      onPressed: _detailsAdded ? null : _addDetails,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.event_available),
                      color: Colors.blue,
                      onPressed: null,
                    ),
                    Spacer(),
                    FlatButton(
                      child: Text(
                        'Save',
                        style: Styles.buttonTextStyle,
                      ),
//                    color: Colors.blue,
                      onPressed: _createTask,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _setupFocus() {
    if (_detailsAdded && !_detailsInitiallyFocused) {
      FocusScope.of(context).requestFocus(_taskDetailsFocusNode);
      setState(() {
        _detailsInitiallyFocused = true;
      });
    }
  }

  _addDetails() {
    setState(() {
      _detailsAdded = true;
    });
  }

  _setTaskText(String text) {
    setState(() {
      _taskText = text;
    });
  }

  _setDetailText(String text) {
    setState(() {
      _detailText = text;
    });
  }

  _createTask() {
    if (_taskText.isNotEmpty | _detailText.isNotEmpty) {
      Provider.of<TaskListModel>(context, listen: false)
          .createTask(_taskText, details: _detailText);
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _taskDetailsFocusNode.dispose();
    super.dispose();
  }
}
