import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/requests/tutor_request.dart';
import 'package:leet_tutur/models/tutor_filter.dart';
import 'package:leet_tutur/stores/tutor_store.dart';

class SpecialtyList extends StatefulWidget {
  const SpecialtyList({Key? key}) : super(key: key);

  @override
  State<SpecialtyList> createState() => _SpecialtyListState();
}

class _SpecialtyListState extends State<SpecialtyList> {
  final _tutorStore = GetIt.instance.get<TutorStore>();

  @override
  void initState() {
    _tutorStore.getTutorSpecialtiesAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Observer(
        builder: (context) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                child: Observer(builder: (context) {
                  var map = _tutorStore.tutorSpecialties;

                  var key = map.keys.elementAt(index);
                  var name = map.values.elementAt(index);

                  return ChoiceChip(
                    label: Text(name),
                    selected: key == _tutorStore.selectedSpecialty,
                    onSelected: (selected) {
                      handleSelectSpecialty(selected, key);
                    },
                    selectedColor: Theme.of(context).primaryColor,
                  );
                }),
              );
            },
            itemCount: _tutorStore.tutorSpecialties.length,
          );
        },
      ),
    );
  }

  void handleSelectSpecialty(bool selected, String key) {
    if (selected) {
      _tutorStore.selectedSpecialty = key;
    } else {
      _tutorStore.selectedSpecialty = "";
    }
  }
}
