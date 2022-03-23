import 'package:flutter/material.dart';

import '../../../models/user_model.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar({Key? key}) : super(key: key);

  final userModel = UserModel(
    avatar: "https://picsum.photos/id/244/200/300",
    name: "Kafka Wanna Fly",
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.2,
          backgroundImage: Image.network(
            userModel.avatar!,
          ).image,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(userModel.name!, style: Theme.of(context).textTheme.headline5)
      ],
    );
  }
}
