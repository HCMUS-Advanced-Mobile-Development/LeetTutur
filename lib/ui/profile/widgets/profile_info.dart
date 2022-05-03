import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/learn_topic.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/stores/tutor_store.dart';
import 'package:leet_tutur/stores/user_store.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:leet_tutur/widgets/filter_chips.dart';
import 'package:leet_tutur/widgets/text_input.dart';

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
  late final TextEditingController wantToLearnController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    user = widget.user;

    birthController = TextEditingController(text: user.birthday);
    wantToLearnController = TextEditingController(text: user.getWantToLearn());

    _userStore.getLearnTopicsAsync();
    _userStore.getTestPreparationsAsync();

    super.initState();
  }

  @override
  void dispose() {
    birthController.dispose();
    wantToLearnController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                IconButton(
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
            child: TextInput(
              controller: wantToLearnController,
              labelText: S.current.wantToLearn,
              readOnly: true,
              onTap: _handleSelectWantToLearn,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.pleaseEnterSomeValue;
                }
                return null;
              },
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
      ),
    );
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      _userStore.updateUserAsync(user);
    }
  }

  void _handleChangeLevel(String? value) {
    user.level = value;
  }

  _handleSelectBirthDay() async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(user.birthday ?? "1975-04-30")!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      user.birthday = DateTimeUtils.formatDate(selectedDate, format: "yyyy-MM-dd");
      birthController.text = user.birthday!;
    }
  }

  void _handleChangeCountry(String? value) {
    user.country = value;
  }

  void _handleChangeName(String name) {
    user.name = name;
  }

  void _handleSelectWantToLearn() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            content: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.current.learnTopics.toUpperCase(),
                    textAlign: TextAlign.start,
                  ),
                  Observer(builder: (context) {
                    return FilterChips(
                      initialSelectedItems: Set.of(
                          user.learnTopics?.map((e) => e.id.toString()) ?? []),
                      optionMap: _userStore.learnTopicsFuture?.value?.fold(
                              <String, String>{},
                              (previousValue, element) => previousValue
                                ?..putIfAbsent(element.id.toString(),
                                    () => element.name ?? "")) ??
                          {},
                      onSelected: (value) {
                        var item = _userStore.learnTopicsFuture?.value
                            ?.firstWhere(
                                (element) => element.id.toString() == value);
                        user.learnTopics?.add(
                          LearnTopic(
                            key: value,
                            id: item?.id,
                            name: item?.name,
                          ),
                        );
                        wantToLearnController.text = user.getWantToLearn();
                      },
                      onDeSelected: (value) {
                        user.learnTopics?.removeWhere(
                            (element) => element.id.toString() == value);
                        wantToLearnController.text = user.getWantToLearn();
                      },
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.current.testPreparations.toUpperCase(),
                    textAlign: TextAlign.start,
                  ),
                  Observer(builder: (context) {
                    return FilterChips(
                      initialSelectedItems: Set.of(
                          user.testPreparations?.map((e) => e.id.toString()) ??
                              []),
                      optionMap: _userStore.testPreparations?.value?.fold(
                              <String, String>{},
                              (previousValue, element) => previousValue
                                ?..putIfAbsent(element.id.toString(),
                                    () => element.name ?? "")) ??
                          {},
                      onSelected: (value) {
                        var item = _userStore.testPreparations?.value
                            ?.firstWhere(
                                (element) => element.id.toString() == value);
                        user.testPreparations?.add(
                          LearnTopic(
                            key: value,
                            id: item?.id,
                            name: item?.name ?? "",
                          ),
                        );
                        wantToLearnController.text = user.getWantToLearn();
                      },
                      onDeSelected: (value) {
                        user.testPreparations?.removeWhere(
                            (element) => element.id.toString() == value);
                        wantToLearnController.text = user.getWantToLearn();
                      },
                    );
                  }),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text(S.current.ok.toUpperCase()),
                onPressed: () {
                  _formKey.currentState!.validate();
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        });
  }
}
