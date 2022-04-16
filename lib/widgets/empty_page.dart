import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:recase/recase.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/empty-box.png",
            width: 125,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.current.nothingHere.titleCase,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
