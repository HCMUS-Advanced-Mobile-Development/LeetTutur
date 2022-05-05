import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final Icon? icon;
  final Text? text;
  final double? size;
  final void Function() onTap;

  const SquareButton(
      {Key? key, this.icon, this.text, this.size, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: size,
      child: Card(
        child: AspectRatio(
            aspectRatio: 1 / 1,
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  const SizedBox(
                    height: 10,
                  ),
                  text ?? const SizedBox.shrink(),
                ],
              ),
              onTap: onTap,
            )),
      ),
    );
  }
}
