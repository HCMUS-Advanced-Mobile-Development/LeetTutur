import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/models/topic.dart';
import 'package:leet_tutur/stores/course_store.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key}) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final _courseStore = GetIt.instance.get<CourseStore>();

  @override
  void initState() {
    _courseStore.selectedTopic ??= _courseStore.selectedCourse?.topics?[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final course = _courseStore.selectedCourse;
    final topics = _courseStore.selectedCourse?.topics ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) {
            return Text(_courseStore.selectedTopic?.name ?? "");
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      course?.imageUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                var topic = topics[index];
                return Observer(
                  builder: (context) {
                    return ListTile(
                      selected: topic.name! == _courseStore.selectedTopic!.name,
                      title: Text(topic.name ?? ""),
                      onTap: () {
                        _courseStore.selectedTopic = topic;
                      },
                    );
                  }
                );
              },
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (context) {
          final selectedTopic = _courseStore.selectedTopic;
          return SfPdfViewer.network(selectedTopic?.nameFile ?? "");
        }
      ),
    );
  }
}
