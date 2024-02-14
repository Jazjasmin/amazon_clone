import 'package:amazon_admin_panel/features/account/screens/account_screen.dart';
import 'package:amazon_admin_panel/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';
import '../../../constants/global_variable.dart';
import '../../home/screens/home_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(child: Text("Analytics Page"),),
    const Center(child: Text("Cart Page"),)
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
       preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/amazon_in.png',
              width: 120,height: 45,color: Colors.black,),
            ),
            const Text("Admin", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),)
          ]),
        ), ),
     body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: updatePage ,
        items: [
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,            
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                color: _page == 0 
                ? GlobalVariable.selectedNavBarColor!
                :GlobalVariable.backgroundColor,
                width: bottomBarBorderWidth,
              ))
            ),
            child: const Icon(Icons.home_outlined),
          ),
          label: ''
          
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,            
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                color: _page == 1 
                ? GlobalVariable.selectedNavBarColor!
                :GlobalVariable.backgroundColor,
                width: bottomBarBorderWidth,
              ))
            ),
            child: const Icon(Icons.account_balance),
          ),
          label: ''
          
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,            
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                color: _page == 2 
                ? GlobalVariable.selectedNavBarColor!
                :GlobalVariable.backgroundColor,
                width: bottomBarBorderWidth,
              ))
            ),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          label: ''
          
          )
        ]
      ),
    );

  }
}