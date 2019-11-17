import 'package:flutter/material.dart';
import 'styles.dart';

class NewTaskModal extends StatefulWidget {
  @override
  State createState() => _NewTaskModalState();
}

class _NewTaskModalState extends State<NewTaskModal> {
  bool _detailsAdded = false;

  _addDetails() {
    setState(() {
      _detailsAdded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Styles.bottomSheetBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'New task',
                      border: InputBorder.none,
                    ),
                    autofocus: true,
//                    validator: (value) => 'Enter something',
                    // Close modal on submit.
                  ),
                ),
                _detailsAdded
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Add details',
                            border: InputBorder.none,
                          ),
                          autofocus: true,
                          style: TextStyle(fontSize: 14),
                          maxLines: null,
//                    validator: (value) => 'Enter something',
                          // Close modal on submit.
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
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
