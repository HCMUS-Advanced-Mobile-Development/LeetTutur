import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/ui/chat_page/chat_page.dart';
import 'package:leet_tutur/ui/courses_page/courses_page.dart';
import 'package:leet_tutur/ui/schedule_page/schedule_page.dart';
import 'package:leet_tutur/ui/settings_page/settings_page.dart';
import 'package:leet_tutur/ui/tutor_page/tuitor_page.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).bottomAppBarColor,
            selectedItemColor: Colors.indigoAccent,
            unselectedItemColor: Theme.of(context).unselectedWidgetColor,
            items: bottomBarItems(),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: tabScreens.elementAt(_selectedIndex),
        ),
      ),
    );
  }

  var tabScreens = <Widget>[
    const TutorPage(),
    const ChatPage(),
    const SchedulePage(),
    const CoursesPage(),
    const SettingsPage(),
  ];

  List<BottomNavigationBarItem> bottomBarItems() => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.school), label: S.of(context).tutor),
        BottomNavigationBarItem(
            icon: const Icon(Icons.chat), label: S.of(context).chat),
        BottomNavigationBarItem(
            icon: const Icon(Icons.event_note), label: S.of(context).schedule),
        BottomNavigationBarItem(
            icon: const Icon(Icons.book), label: S.of(context).courses),
        BottomNavigationBarItem(
            icon: const Icon(Icons.settings), label: S.of(context).settings),
      ];
}
