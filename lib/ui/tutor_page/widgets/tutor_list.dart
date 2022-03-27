import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/stores/tutor_store/tutor_store.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/tutor_card.dart';
import 'package:mobx/mobx.dart';

class TutorList extends StatefulWidget {
  const TutorList({Key? key}) : super(key: key);

  @override
  State<TutorList> createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  final tutorStore = GetIt.instance.get<TutorStore>();

  @override
  void initState() {
    tutorStore.searchTutors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tutorFuture = tutorStore.tutorResponseFuture;

    return Observer(builder: (context) {
      var rowOfTutor = tutorStore.rowOfTutor;
      return tutorFuture?.status == FutureStatus.fulfilled
          ? ListView.builder(
              itemBuilder: (conext, index) => Observer(builder: (context) {
                var tutor = rowOfTutor?.rows?[index];
                return tutor != null
                    ? TutorCard(tutor: tutor)
                    : const SizedBox.shrink();
              }),
              itemCount: rowOfTutor?.rows?.length,
            )
          : const Center(child: CircularProgressIndicator());
    });
  }
}
