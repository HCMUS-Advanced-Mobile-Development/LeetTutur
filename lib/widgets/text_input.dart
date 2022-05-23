import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String? hintText;
  final String? initialValue;
  final String? labelText;
  final bool? enabled;
  final bool? readOnly;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const TextInput(
      {Key? key,
      this.hintText,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.labelText, this.enabled, this.controller, this.readOnly, this.onTap})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    var readOnly = widget.readOnly ?? false;
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      readOnly: readOnly,
      onTap: widget.onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )
        ),
        hintText: widget.hintText,
        fillColor: Theme.of(context).cardColor,
        filled: true,
        labelText: widget.labelText,
      ),
    );
  }
}
