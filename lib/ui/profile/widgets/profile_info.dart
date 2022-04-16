import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/widgets/text_input.dart';

class ProfileInfo extends StatefulWidget {
  final User user;

  const ProfileInfo({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    var user = widget.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.fullName,
            labelText: S.current.fullName,
            initialValue: user.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.email,
            labelText: S.current.email,
            initialValue: user.email,
            enabled: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.nation,
            labelText: S.current.nation,
            initialValue: user.country,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.phone,
            labelText: S.current.phone,
            initialValue: user.phone,
            enabled: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.dateOfBirth,
            labelText: S.current.dateOfBirth,
            initialValue: user.birthday,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.level,
            labelText: S.current.level,
            initialValue: user.level,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _handleSave,
            child: Text(S.current.save.toUpperCase()),
          ),
        ),
      ],
    );
  }

  void _handleSave() {}
}
