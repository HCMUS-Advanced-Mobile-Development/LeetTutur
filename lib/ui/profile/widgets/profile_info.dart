import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/stores/tutor_store.dart';
import 'package:leet_tutur/stores/user_store.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:leet_tutur/widgets/text_input.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class ProfileInfo extends StatefulWidget {
  final User user;

  const ProfileInfo({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final _userStore = GetIt.instance.get<UserStore>();
  final _tutorStore = GetIt.instance.get<TutorStore>();

  late final User user;
  late final TextEditingController birthController;

  @override
  void initState() {
    user = widget.user;
    birthController = TextEditingController(text: user.birthday);

    super.initState();
  }

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
            initialValue: user.name,
            onChanged: _handleChangeName,
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
          child: FutureBuilder(
            future: _tutorStore.getTutorCountryAsync(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: user.country ?? "VN",
                  items: _tutorStore.tutorCountryCodeMap.entries
                      .map((e) => DropdownMenuItem(
                            value: e.key.toUpperCase(),
                            child: Text(
                              e.value,
                            ),
                          ))
                      .toList(),
                  onChanged: _handleChangeCountry,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
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
          child: Row(
            children: [
              Expanded(
                child: TextInput(
                  enabled: false,
                  hintText: S.current.dateOfBirth,
                  labelText: S.current.dateOfBirth,
                  controller: birthController,
                ),
              ),
              CircularButton(
                icon: const Icon(Icons.event),
                onPressed: _handleSelectBirthDay,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField(
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: user.level?.toUpperCase(),
            items: _userStore.levelMap.entries
                .map((e) => DropdownMenuItem(
                      value: e.key,
                      child: Text(e.value),
                    ))
                .toList(),
            onChanged: _handleChangeLevel,
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

  void _handleSave() {
    _userStore.updateUserAsync(user);
  }

  void _handleChangeLevel(String? value) {
    user.level = value;
  }

  void _handleSelectBirthDay() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.tryParse(user.birthday ?? "1975-04-30"),
      onConfirm: (date) {
        user.birthday = DateTimeUtils.formatDate(date, format: "yyyy-MM-dd");
        birthController.text = user.birthday!;
      },
    );
  }

  void _handleChangeCountry(String? value) {
    user.country = value;
  }

  void _handleChangeName(String name) {
    user.name = name;
  }
}
