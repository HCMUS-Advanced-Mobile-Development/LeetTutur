import 'package:flutter/material.dart';

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
        const Expanded(
          flex: 0,
          child: Text("1 on 1 online education platform",
              style: TextStyle(fontFamily: "IBM_Mono", fontSize: 14)),
        ),
      ],
    );
  }
}
