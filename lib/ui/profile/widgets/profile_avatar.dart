import 'package:flutter/material.dart';
import 'package:leet_tutur/models/user.dart';

class ProfileAvatar extends StatelessWidget {
  final User user;

  const ProfileAvatar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.2,
          backgroundImage: Image.network(
            user.avatar ?? "",
          ).image,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(user.name ?? "", style: Theme.of(context).textTheme.headline5)
      ],
    );
  }
}
