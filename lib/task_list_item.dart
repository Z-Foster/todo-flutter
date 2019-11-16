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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isComplete,
        // TODO - Dismiss focus when box is checked
        onChanged: (bool checked) {
          Provider.of<TaskListModel>(context, listen: false)
              .toggleComplete(task);
        },
      ),
      title: _buildTitle(),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () =>
            Provider.of<TaskListModel>(context, listen: false).deleteTask(task),
      ),
    );
  }
}
//class TaskListItem extends StatefulWidget {
//  final Task task;
//
//  TaskListItem({@required this.task});
//
//  @override
//  State createState() => _TaskListItemState();
//}

//class _TaskListItemState extends State<TaskListItem> {
//  bool _isEditing = false;
//  FocusNode _focusNode;
//  final TextEditingController _textEditingController = TextEditingController();
//
//  @override
//  initState() {
//    super.initState();
//    _textEditingController.text = widget.task.text;
//    _textEditingController.addListener(_handleTextFieldUpdate);
//    _focusNode = FocusNode(debugLabel: 'TaskListItem');
//    _focusNode.addListener(_handleFocusChange);
//  }
//
//  @override
//  void dispose() {
//    _focusNode.removeListener(_handleFocusChange);
//    _focusNode.dispose();
//    _textEditingController.dispose();
//    super.dispose();
//  }
//
//  _handleTextFieldUpdate() {
//    Provider.of<TaskListModel>(context, listen: false)
//        .updateTaskText(widget.task, _textEditingController.text);
//  }
//
//  // Update state to determine if Text or TextField widget is created in build().
//  _handleFocusChange() {
//    if (_focusNode.hasFocus) {
//      setState(() {
//        _isEditing = true;
//      });
//    } else {
//      setState(() {
//        _isEditing = false;
//      });
//    }
//  }
//
//  _handleTap() {
//    FocusScope.of(context).requestFocus(_focusNode);
//  }
//
//  Widget _buildTitle() {
//    return Row(
//      children: <Widget>[
//        Expanded(
//          // Create either TextField or Text based on _isEditing value.
//          child: _isEditing && !widget.task.isComplete
//              ? TextField(
////                  autofocus: true,
//                  focusNode: _focusNode,
//                  controller: _textEditingController,
//                )
//              : Text(
//                  widget.task.text,
//                  style: widget.task.isComplete
//                      ? TextStyle(decoration: TextDecoration.lineThrough)
//                      : null,
//                ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListTile(
//      leading: Checkbox(
//        value: widget.task.isComplete,
//        // TODO - Dismiss focus when box is checked
//        onChanged: (bool checked) {
//          _focusNode.unfocus();
//          Provider.of<TaskListModel>(context, listen: false)
//              .toggleComplete(widget.task);
//        },
//      ),
//      title: _buildTitle(),
//      trailing: IconButton(
//        icon: Icon(Icons.delete),
//        onPressed: () => Provider.of<TaskListModel>(context, listen: false)
//            .deleteTask(widget.task),
//      ),
//      onTap: _handleTap,
//    );
//  }
//}
