import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {@required this.onSaved,
      this.validator,
      this.labelText,
      this.icon,
      Key key})
      : super(key: key);

  final Function(String) onSaved;
  final Function(String) validator;
  final String labelText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1.0,
          ),
        ),
        labelText: labelText,
        prefixIcon: icon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
      ),
    );
  }
}
