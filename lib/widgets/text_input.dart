import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  late final String? _hintText;

  TextInput({Key? key, String? hintText}) : super(key: key) {
    _hintText = hintText;
  }

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget._hintText,
            fillColor: Colors.white,
            filled: true));
  }
}
