import 'package:flutter/material.dart';
import 'package:techlify_core/src/widgets/custom-form.dart';

class Dialog {
  Dialog({@required this.container, @required this.context}) {
    formDialog(container, context);
  }
  final Widget container;
  final BuildContext context;

  static Future formDialog(Widget container, BuildContext context) {
    return Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return FormDialog(container: container);
            }));
  }
}
