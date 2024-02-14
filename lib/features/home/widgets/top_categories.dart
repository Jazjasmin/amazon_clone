import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/features/home/screens/category_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigateToCategoryPage(BuildContext context, String category  ) {
    Navigator.pushNamed(context, CategoryDetailsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemCount: GlobalVariable.categoryImages.length,
        itemBuilder: (context,index){
        return GestureDetector(
          onTap: () => navigateToCategoryPage(context, GlobalVariable.categoryImages[index]['title']!),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(GlobalVariable.categoryImages[index]["image"]!,),
                ),
              ),
              Text(GlobalVariable.categoryImages[index]["title"]!,
              style: const TextStyle(fontWeight: FontWeight.w400,
              fontSize: 12),)
            ],
          ),
        );
      }),
    );
  }
}