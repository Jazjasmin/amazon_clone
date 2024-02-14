import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

   List list = [
    'https://www.google.com/aclk?sa=l&ai=DChcSEwiog_7_1OaCAxW5j1AGHXp3DxAYABAJGgJkZw&ase=2&gclid=CjwKCAiAvJarBhA1EiwAGgZl0OS39fyAx7RW2GKZfFe5a05MTl-T5KffmKpCASr78gIUyRJB0PnRDRoCCosQAvD_BwE&sig=AOD64_1asYkTZA5Uwce2x-9xmNvuTx2cag&ctype=5&nis=6&adurl&ved=2ahUKEwikmPP_1OaCAxUgXaQEHfZCAygQvhd6BQgBEIUB',
    'https://www.google.com/aclk?sa=l&ai=DChcSEwiog_7_1OaCAxW5j1AGHXp3DxAYABAJGgJkZw&ase=2&gclid=CjwKCAiAvJarBhA1EiwAGgZl0OS39fyAx7RW2GKZfFe5a05MTl-T5KffmKpCASr78gIUyRJB0PnRDRoCCosQAvD_BwE&sig=AOD64_1asYkTZA5Uwce2x-9xmNvuTx2cag&ctype=5&nis=6&adurl&ved=2ahUKEwikmPP_1OaCAxUgXaQEHfZCAygQvhd6BQgBEIUB',
    'https://www.google.com/aclk?sa=l&ai=DChcSEwiog_7_1OaCAxW5j1AGHXp3DxAYABAJGgJkZw&ase=2&gclid=CjwKCAiAvJarBhA1EiwAGgZl0OS39fyAx7RW2GKZfFe5a05MTl-T5KffmKpCASr78gIUyRJB0PnRDRoCCosQAvD_BwE&sig=AOD64_1asYkTZA5Uwce2x-9xmNvuTx2cag&ctype=5&nis=6&adurl&ved=2ahUKEwikmPP_1OaCAxUgXaQEHfZCAygQvhd6BQgBEIUB',
    'https://www.google.com/aclk?sa=l&ai=DChcSEwiog_7_1OaCAxW5j1AGHXp3DxAYABAJGgJkZw&ase=2&gclid=CjwKCAiAvJarBhA1EiwAGgZl0OS39fyAx7RW2GKZfFe5a05MTl-T5KffmKpCASr78gIUyRJB0PnRDRoCCosQAvD_BwE&sig=AOD64_1asYkTZA5Uwce2x-9xmNvuTx2cag&ctype=5&nis=6&adurl&ved=2ahUKEwikmPP_1OaCAxUgXaQEHfZCAygQvhd6BQgBEIUB'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text('Your Orders',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text('see all',style: TextStyle(
                color: GlobalVariable.selectedNavBarColor,
              ),),
            ),
            //display orders
            Container(
              height: 170,
              padding: EdgeInsets.only(left: 10,top: 20,right: 0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder:(context, index) {
                  return SingleProduct(image: list[index]);
                },)),

          ],
        )
      ],
    );
  }
}