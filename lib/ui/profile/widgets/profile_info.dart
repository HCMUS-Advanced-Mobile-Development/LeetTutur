import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leet_tutur/widgets/text_input.dart';

import '../../../generated/l10n.dart';
import '../../../models/user_model.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final userModel = UserModel(
      avatar: "https://picsum.photos/id/244/200/300",
      name: "Kafka Wanna Fly",
      email: "kafka@hcmus.com",
      nation: "Vietnam",
      phone: "0909123456",
      level: "Junior",
      birthDate: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.fullName,
            labelText: S.current.fullName,
            initialValue: userModel.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.email,
            labelText: S.current.email,
            initialValue: userModel.email,
            enabled: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.nation,
            labelText: S.current.nation,
            initialValue: userModel.nation,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.phone,
            labelText: S.current.phone,
            initialValue: userModel.phone,
            enabled: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.dateOfBirth,
            labelText: S.current.dateOfBirth,
            initialValue:
                DateFormat("dd-MMM-yyyy").format(userModel.birthDate!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextInput(
            hintText: S.current.level,
            labelText: S.current.level,
            initialValue: userModel.level,
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
