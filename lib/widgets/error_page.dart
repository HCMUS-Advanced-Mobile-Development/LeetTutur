import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:recase/recase.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/warning.gif",
            width: 125,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.current.error.titleCase,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ),
        ],
      ),
    );
  }
}
