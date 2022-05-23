import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/search_bar_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/stores/course_store.dart';
import 'package:leet_tutur/ui/courses_page/widgets/course_list.dart';
import 'package:leet_tutur/widgets/filter_chips.dart';
import 'package:leet_tutur/widgets/search_bar.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _courseStore = GetIt.instance.get<CourseStore>();

  @override
  void initState() {
    _courseStore.getCourseCategoriesAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
              10, SearchBarConstants.defaultHeight + 20, 10, 0),
          child: CourseList(),
        ),
        SearchBar(
          onFilterTapped: _openFilterDialog,
          onOrderChanged: _handleOrderChanged,
          onSubmitted: _handleSubmitQuery,
          onQueryChanged: _handleSubmitQuery,
        ),
      ]),
    );
  }

  void _openFilterDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          content: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Level Filter
                Text(
                  S.current.level.toUpperCase(),
                  textAlign: TextAlign.start,
                ),
                FilterChips(
                  optionMap: _courseStore.courseLevelMap,
                  initialSelectedItems: _courseStore.levelQuery,
                  onSelected: (level) => _courseStore.levelQuery.add(level),
                  onDeSelected: (level) =>
                      _courseStore.levelQuery.remove(level),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Category Filter
                Text(
                  S.current.category.toUpperCase(),
                  textAlign: TextAlign.start,
                ),
                Observer(builder: (context) {
                  return FilterChips(
                    optionMap: _courseStore.categoryMap,
                    initialSelectedItems: _courseStore.categoryQuery,
                    onSelected: (level) =>
                        _courseStore.categoryQuery.add(level),
                    onDeSelected: (level) =>
                        _courseStore.categoryQuery.remove(level),
                  );
                }),
                // Category Filter
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(S.current.ok.toUpperCase()),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _handleOrderChanged(String order) {
    _courseStore.orderByLevel = order;
  }

  _handleSubmitQuery(String query) {
    _courseStore.nameQuery = query;
  }
}
