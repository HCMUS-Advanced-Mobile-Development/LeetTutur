import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool? enabled;
  final TextEditingController? controller;

  const TextInput(
      {Key? key,
      this.hintText,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.labelText, this.enabled, this.controller})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        fillColor: Theme.of(context).cardColor,
        filled: true,
        labelText: widget.labelText,
      ),
    );
  }
}
