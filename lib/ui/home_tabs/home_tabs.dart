import 'package:flutter/material.dart';

import '../../constants/route_constants.dart';

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
            items: RouteConstants.bottomBarItems,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: RouteConstants.tabScreens.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
