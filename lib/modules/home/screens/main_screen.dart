import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sell_app/modules/chat/screens/user_chat.dart';
import 'package:sell_app/modules/home/controller/cubit/home_cubit.dart';
import 'package:sell_app/modules/home/controller/states/home_states.dart';

import 'package:sell_app/modules/home/widgets/home_tap.dart';

import 'package:sell_app/utils/themes/white_theme.dart';

class HomeScreen extends StatelessWidget {
  late PersistentTabController _controllerTab;

  List<Widget> _buildScreens = [
    HomeTab(),
    DefaultTabController(
      length: 3,
      child: TabBar(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.blue,
        tabs: [
          Container(
            color: Colors.green,
            width: double.infinity,
            child: Tab(
              icon: Icon(Icons.directions_car),
              child: Text('d'),
            ),
          ),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
    ),
    Column(
      children: [
        Text('zeco'),
        SizedBox(
          height: 123,
        ),
        Container(
          height: 200,
          child: GFAccordion(
            title: 'GF Accordion',
            content:
                'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
            collapsedTitleBackgroundColor: Colors.green,
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize),
          ),
        ),
      ],
    ),
    UserChatScreen(),
    Container(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        activeColorPrimary: Color(0xff423E5B),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance_wallet_rounded),
        activeColorPrimary: Color(0xff423E5B),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.add,
          color: primaryColorWhite,
        ),
        activeColorPrimary: Color(0xff423E5B),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        activeColorPrimary: Color(0xff423E5B),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.perm_identity_rounded),
        activeColorPrimary: Color(0xff423E5B),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _controllerTab = PersistentTabController(initialIndex: 0);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BlocConsumer<SellAppCubitHome, SellAppHomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return PersistentTabView(
            context,
            navBarHeight: 50,

            controller: _controllerTab,
            screens: _buildScreens,
            items: _navBarsItems(),
            confineInSafeArea: false,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: false,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInCirc,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style15,
            hideNavigationBar: !SellAppCubitHome.get(context).isBottomShow,
            // Choose the nav bar style with this property.
          );
        },
      ),
      body: _buildScreens[_controllerTab.index],
    );
  }
}
