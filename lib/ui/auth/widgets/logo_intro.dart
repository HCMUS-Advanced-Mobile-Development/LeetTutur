// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class LogoIntro extends StatelessWidget {
  const LogoIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/logo.png", width: 125),
        const Expanded(
          flex: 0,
          child: Text(
            "Leet Tutur",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "IBM_Mono",
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
        Expanded(
          flex: 0,
          child: Text(S.current.intro,
              style: TextStyle(fontFamily: "IBM_Mono", fontSize: 14)),
        ),
      ],
    );
  }
}
