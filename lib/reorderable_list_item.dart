import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';

class ReorderableListItem extends StatelessWidget {
  ReorderableListItem({
    this.key,
    this.child,
    this.isFirst,
    this.isLast,
  });

  final Key key;
  final Widget child;
  final bool isFirst;
  final bool isLast;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like on iOS)
      decoration = BoxDecoration(color: Color(0xD0FFFFFF));
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context) //
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none //
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : Colors.white);
    }

    // Set a widget that will act as a dragHandle and place in content if desired.
//    Widget handle = ReorderableListener(
//      child: dragHandleWidget,
//    );

    // DelayedReorderableListener enable press and hold to drag.
    Widget content = DelayedReorderableListener(
      child: Container(
        decoration: decoration,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Opacity(
            // hide content for placeholder
            opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
            child: child,
          ),
        ),
      ),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: key, //
        childBuilder: _buildChild);
  }
}
