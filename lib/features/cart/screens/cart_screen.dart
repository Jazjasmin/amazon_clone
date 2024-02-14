import 'package:amazon_admin_panel/common/widgets/custom_button.dart';
import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/features/address/screens/address_screen.dart';
import 'package:amazon_admin_panel/features/cart/widgets/cart_product.dart';
import 'package:amazon_admin_panel/features/cart/widgets/cart_subtotal.dart';
import 'package:amazon_admin_panel/features/home/widgets/address_box.dart';
import 'package:amazon_admin_panel/features/search/screen/search_screen.dart';
import 'package:amazon_admin_panel/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

   void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }

  void navigateToAddress(String query) {
    Navigator.pushNamed(
      context, AddressScreen.routeName,arguments: query);
  }

  @override
  Widget build(BuildContext context) {

    final user = context.watch<UserProvider>().user;

    return Scaffold(
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
        body:  SingleChildScrollView(
          child: Column(
            children: [
              const AddressBox(),
              const CartSubtotal(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(text: 'Proceed to Buy (${user.cart.length}) items', 
                color: Colors.yellow[600],
                onTap: (){}),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 1,
                color: Colors.black12.withOpacity(0.08),
              ),
              const SizedBox(height: 15,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: user.cart.length,
                itemBuilder:(context, index) {
                  return CartProduct(index: index);
                
              },)

            ],
          ),
        ),

    );
  }
}