import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  SubmitButton({@required this.onPressed, @required this.text});
  @override
  _SubmitButtonState createState() => _SubmitButtonState(this.text);
}

class _SubmitButtonState extends State<SubmitButton> {
  String _buttonText;
  _SubmitButtonState(this._buttonText);

  _doSubmit() {
    this.setState(() {});
    widget.onPressed();
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 8,
      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
      onPressed: () {
        _doSubmit();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          _buttonText,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
