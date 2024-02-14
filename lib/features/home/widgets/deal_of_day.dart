import 'package:amazon_admin_panel/common/widgets/loader.dart';
import 'package:amazon_admin_panel/features/home/screens/home_screen.dart';
import 'package:amazon_admin_panel/features/home/services/home_service.dart';
import 'package:amazon_admin_panel/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_admin_panel/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
     product = await homeServices.fetchDealOfDay(context: context);
     setState(() {
       
     });
  }

  void navigateToDetailScreen(){
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments:product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null ? const Loader() : product!.name.isEmpty ? 
    const SizedBox() : GestureDetector(
      onTap: () => navigateToDetailScreen(),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            "'https://www.google.com/aclk?sa=l&ai=DChcSEwiog_7_1OaCAxW5j1AGHXp3DxAYABAJGgJkZw&ase=2&gclid=CjwKCAiAvJarBhA1EiwAGgZl0OS39fyAx7RW2GKZfFe5a05MTl-T5KffmKpCASr78gIUyRJB0PnRDRoCCosQAvD_BwE&sig=AOD64_1asYkTZA5Uwce2x-9xmNvuTx2cag&ctype=5&nis=6&adurl&ved=2ahUKEwikmPP_1OaCAxUgXaQEHfZCAygQvhd6BQgBEIUB'",
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            alignment: Alignment.topLeft,
            child: const Text(
              "\$100",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              "Rivaan",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images.map((e) => 
                Image.network(
                  "'https://www.google.com/aclk?sa=l&ai=DChcSEwiog_7_1OaCAxW5j1AGHXp3DxAYABAJGgJkZw&ase=2&gclid=CjwKCAiAvJarBhA1EiwAGgZl0OS39fyAx7RW2GKZfFe5a05MTl-T5KffmKpCASr78gIUyRJB0PnRDRoCCosQAvD_BwE&sig=AOD64_1asYkTZA5Uwce2x-9xmNvuTx2cag&ctype=5&nis=6&adurl&ved=2ahUKEwikmPP_1OaCAxUgXaQEHfZCAygQvhd6BQgBEIUB'",
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ).toList(),
               
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "See all deals",
              style: TextStyle(color: Colors.cyan[800]),
            ),
          ),
        ],
      ),
    );
  }
}
