import 'package:flutter/material.dart';

class AddDateModal extends StatefulWidget {
  @override
  _AddDateModalState createState() => _AddDateModalState();
}

class _AddDateModalState extends State<AddDateModal>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Rad!'),
      ),
    );
  }
}
