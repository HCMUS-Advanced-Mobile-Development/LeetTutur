import 'package:flutter/material.dart';

class TextPasswordInput extends StatefulWidget {
  late final String? _hintText;

  TextPasswordInput({Key? key, String? hintText}) : super(key: key) {
    _hintText = hintText;
  }

  @override
  _TextPasswordInputState createState() => _TextPasswordInputState();
}

class _TextPasswordInputState extends State<TextPasswordInput> {
  bool _passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget._hintText,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
          icon:
              Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility),
          color: Colors.black,
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
