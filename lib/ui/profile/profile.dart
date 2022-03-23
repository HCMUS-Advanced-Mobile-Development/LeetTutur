import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/profile/widgets/profile_avatar.dart';
import 'package:leet_tutur/ui/profile/widgets/profile_info.dart';
import 'package:recase/recase.dart';

import '../../generated/l10n.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.profile.titleCase),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            left: 8,
            top: 8,
            bottom: 50,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ProfileAvatar(),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                const ProfileInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
