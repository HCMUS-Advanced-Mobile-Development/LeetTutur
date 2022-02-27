import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;

  const TextInput({Key? key, this.hintText, this.initialValue, this.onChanged}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.hintText,
            fillColor: Colors.white,
            filled: true));
  }
}
