import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/features/account/widgets/below_app_bar.dart';
import 'package:amazon_admin_panel/features/account/widgets/orders.dart';
import 'package:amazon_admin_panel/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
            Container(
              padding: const EdgeInsets.only(
                right: 15
              ),
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.only(right: 15)),
                  Icon(Icons.notifications_outlined),
                  Icon(Icons.search)
                ],
              ),
            )
          ]),
        ), ),
    body: const Column(children:  [
       BelowAppBar(),
       SizedBox(height: 10),
       TopButtons(),
       SizedBox(height: 20),
       Orders()
    ],),
    );
  }
}