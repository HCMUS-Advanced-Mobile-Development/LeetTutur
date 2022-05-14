import 'package:flutter/material.dart';
import 'package:leet_tutur/models/user.dart';

class AvatarWithStatus extends StatelessWidget {
  final User user;
  const AvatarWithStatus({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isOnline = user.isOnline ?? false;

    return CircleAvatar(
      backgroundImage: Image
          .network(user.avatar ??
          "https://picsum.photos/seed/picsum/200")
          .image,
      child: Stack(children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Colors.white
              )
            ),
            child: CircleAvatar(
              backgroundColor: isOnline ? Colors.green : Colors.grey,
              radius: 5,
            ),
          ),
        ),
      ]),
    );
  }
}
