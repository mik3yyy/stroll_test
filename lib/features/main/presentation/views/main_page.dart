import 'package:flutter/material.dart';
import 'package:stroll_test/core/extensions/context_extensions.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import '../blocs/main_bloc.dart';
import 'package:badges/badges.dart' as badges;

class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({super.key, required this.child});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<String> _tabs = [
    // Routes.homeName,
    // Routes.favouriteName,
    // Routes.settingsName,
    // Routes.blogName,
  ];

  void _onItemTapped(int index) {}

  void _navigateWithCustomTransition(BuildContext context, String routeName) {
    // context.goNamed(
    //   routeName,
    // );
  }
  String messages = "10";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: context.primaryColor,
        unselectedItemColor: context.colors.greyDecor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Assets.application.assets.images.bar1.svg(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -5, end: -1),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeContent:
                  const Icon(Icons.check, color: Colors.white, size: 3),
              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: context.primaryColor,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(2),
                elevation: 0,
              ),
              child: Assets.application.assets.images.bar2.svg(),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -10),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeContent: const Text(
                "10",
                style: TextStyle(fontSize: 10),
              ),
              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: context.primaryColor,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(2),
                elevation: 0,
              ),
              child: Assets.application.assets.images.bar3.svg(),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Assets.application.assets.images.bar4.svg(),
            label: '',
          ),
        ],
      ),
    );
  }
}
