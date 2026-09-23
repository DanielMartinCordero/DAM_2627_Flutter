import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsBotBarStyle1 extends StatefulWidget {
  bool _isNotificationBadgeEnable = true;
  bool _isMessagesBadgeEnable = true;

  int _bottomNavIndex = 0;
  Widget build(BuildContext context){
    return NavigationBar(
      onDestinationSelected: (int index) {
        switch (index){
          case 0: print("HOME");
          case 1: {
            print("NOTIFICATION");
            setState(() {
              _isNotificationBadgeEnable=false;
            });
          }
          case 2: {
            print("MESSAGES");
            setState(() {
              _isMessagesBadgeEnable=false;
            });
          }

        }
        setState(() {
          _bottomNavIndex = index;
        });
      },
      indicatorColor: Colors.amber,
      selectedIndex: _bottomNavIndex,
      destinations: <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(isLabelVisible:_isNotificationBadgeEnable, child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Badge(isLabelVisible:_isMessagesBadgeEnable, label: Text('2'), child: Icon(Icons.messenger_sharp)),
          label: 'Messages',
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}