import 'package:flutter/material.dart';
import 'package:todo/model/task_list_model.dart';
import 'package:todo/reorderable_list_item.dart';
import 'package:todo/task_list_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'model/task.dart';

class TaskList extends StatelessWidget {
  final List<TaskListItem> _taskItems;

  TaskList({Key key, @required List<Task> tasks})
      : _taskItems = tasks.map((task) => TaskListItem(task: task)).toList(),
        super(key: key);

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return _taskItems.indexWhere((TaskListItem item) => item.key == key);
  }

  @override
  Widget build(BuildContext context) {
    bool _reorderCallback(Key item, Key newPosition) {
      int draggingIndex = _indexOfKey(item);
      int newPositionIndex = _indexOfKey(newPosition);

      // Uncomment to allow only even target reorder position
      // if (newPositionIndex % 2 == 1)
      //   return false;
      Provider.of<TaskListModel>(context, listen: false)
          .reorderTask(draggingIndex, newPositionIndex);
//    final draggedItem = _taskItems[draggingIndex];
//    setState(() {
//      debugPrint("Reordering $item -> $newPosition");
//      _items.removeAt(draggingIndex);
//      _items.insert(newPositionIndex, draggedItem);
//    });
      return true;
    }

    return _taskItems.isEmpty
        ? _buildEmptyState()
        : ReorderableList(
            onReorder: _reorderCallback,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ReorderableListItem(
                            key: _taskItems[index].key,
                            child: _taskItems[index],
                            isFirst: index == 0,
                            isLast: index == _taskItems.length - 1,
                          );
                        },
                        childCount: _taskItems.length,
                      ),
                    )),
              ],
            ),
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
