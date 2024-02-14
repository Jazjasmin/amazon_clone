import 'package:amazon_admin_panel/common/widgets/loader.dart';
import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/features/home/widgets/address_box.dart';
import 'package:amazon_admin_panel/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_admin_panel/features/search/services/search_services.dart';
import 'package:amazon_admin_panel/features/search/widget/searched_product.dart';
import 'package:amazon_admin_panel/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState(){
    super.initState();
    fetchSearchProducts();
  }

  fetchSearchProducts() async {
    products = await searchServices.fetchSearchProducts(
      context: context, searchQuery: widget.searchQuery);
      setState(() {
        
      });
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }



  @override
  Widget build(BuildContext context) {
    return products == null ? const Loader() : Scaffold(
     appBar: PreferredSize(
       preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: (){},
                        child: const Padding(padding: EdgeInsets.only(left: 6),
                        child: Icon(Icons.search,color: Colors.black, size: 23,)
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    hintText: 'Search Amazon.in',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    )
                  ),
                )
              ),
              ),
            ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25,),
              )
                          ,
          ]),
        ), ),
        body: Column(children: [
          AddressBox(),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, ProductDetailsScreen.routeName,
                    arguments: products![index]);
                },
                child: SearchedProduct(product: products![index]));
            }
          ),)
        ],)
    );
  }
}