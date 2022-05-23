import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/requests/report_request.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/stores/tutor_store.dart';
import 'package:leet_tutur/widgets/filter_chips.dart';

class ReportDialog extends StatefulWidget {
  final BuildContext context;
  final Tutor tutor;

  const ReportDialog({Key? key, required this.tutor, required this.context})
      : super(key: key);

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  final _tutorStore = GetIt.instance.get<TutorStore>();
  final selectedItems = <String>{};

  @override
  Widget build(BuildContext context) {
    const options = [
      "This tutor is annoying me",
      "Fake profile",
      "Inappropriate profile photo"
    ];
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.report),
          Text("${S.current.report} ${widget.tutor.user?.name}"),
        ],
      ),
      content: Align(
        heightFactor: 1,
        child: FilterChips(
          optionMap: Map.fromIterables(options, options),
          onSelected: (value) => selectedItems.add(value),
          onDeSelected: (value) => selectedItems.remove(value),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(widget.context, rootNavigator: true).pop();
            if (selectedItems.isNotEmpty) {
              _submitReport();
            }
          },
          child: Text(S.current.ok),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(widget.context, rootNavigator: true).pop();
          },
          child: Text(
            S.current.cancel,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  _submitReport() {
    showDialog(
      context: widget.context,
      builder: (context) {
        _tutorStore
            .reportTutorAsync(
              ReportRequest(
                tutorId: widget.tutor.userId,
                content: selectedItems.join("\n"),
              ),
            )
            .whenComplete(() => Navigator.of(context, rootNavigator: true).pop())
            .then((value) async => await _handleSuccess(context))
            .catchError((err) => _handleError(context, err));

        return AlertDialog(
          title: Center(
            child: Text(S.current.processing),
          ),
          content: const Align(
            heightFactor: 1,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  _handleSuccess(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            content: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  Text(S.current.done),
                ],
              ),
            ),
          );
        });
  }

  _handleError(BuildContext context, err) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            content: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  Text(err),
                ],
              ),
            ),
          );
        });
  }
}
