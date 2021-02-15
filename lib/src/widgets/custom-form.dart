import 'dart:ui';

import 'package:flutter/material.dart';

class FormDialog extends StatefulWidget {
  FormDialog({Key key, @required this.container}) : super(key: key);
  final Widget container;
  @override
  _FormDialogState createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: widget.container),
              ),
            ))),
      ),
    );
  }
}
