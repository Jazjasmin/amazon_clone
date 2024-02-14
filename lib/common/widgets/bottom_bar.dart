import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/features/account/screens/account_screen.dart';
import 'package:amazon_admin_panel/features/cart/screens/cart_screen.dart';
import 'package:amazon_admin_panel/features/home/screens/home_screen.dart';
import 'package:amazon_admin_panel/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariable.selectedNavBarColor,
          unselectedItemColor: GlobalVariable.unselectedNavBarColor,
          backgroundColor: GlobalVariable.backgroundColor,
          iconSize: 28,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _page == 0
                        ? GlobalVariable.selectedNavBarColor!
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderWidth,
                  ))),
                  child: const Icon(Icons.home_outlined),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _page == 1
                        ? GlobalVariable.selectedNavBarColor!
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderWidth,
                  ))),
                  child: const Icon(Icons.account_balance),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _page == 2
                        ? GlobalVariable.selectedNavBarColor!
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderWidth,
                  ))),
                  child: badges.Badge(
                      badgeContent: Text(userCartLen.toString()),
                      child: const Icon(Icons.shopping_cart_outlined)),
                ),
                label: '')
          ]),
    );
  }
}
