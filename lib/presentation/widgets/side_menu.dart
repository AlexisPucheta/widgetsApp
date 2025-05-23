import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetsapp/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({required this.scaffoldKey, super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        widget.scaffoldKey.currentState?.closeDrawer();
        context.push(menuItem.link);
      },
      selectedIndex: navDrawerIndex,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: const Text('Main Menu'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
      ],
    );
  }
}
