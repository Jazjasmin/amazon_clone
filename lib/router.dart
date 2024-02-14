import 'package:amazon_admin_panel/common/widgets/bottom_bar.dart';
import 'package:amazon_admin_panel/features/admin/screens/add_product_screen.dart';
import 'package:amazon_admin_panel/features/auth/screens/auth_screen.dart';
import 'package:amazon_admin_panel/features/home/screens/category_details_screen.dart';
import 'package:amazon_admin_panel/features/home/screens/home_screen.dart';
import 'package:amazon_admin_panel/features/order_details/screens/order_details.dart';
import 'package:amazon_admin_panel/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_admin_panel/features/search/screen/search_screen.dart';
import 'package:amazon_admin_panel/models/order.dart';
import 'package:amazon_admin_panel/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/address/screens/address_screen.dart';

Route<dynamic>generateRoute(RouteSettings routeSettings) {
  switch(routeSettings.name) {
    case AuthScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthScreen(),
          );
    case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen(),
          );
    case BottomBar.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BottomBar(),
          );
    case AddProductScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddProductScreen(),
          );
    case CategoryDetailsScreen.routeName:
    var category = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  CategoryDetailsScreen(category: category),
          );
    case SearchScreen.routeName:
    var searchQuery = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  SearchScreen(searchQuery: searchQuery,),
          );
    case ProductDetailsScreen.routeName:
    var product = routeSettings.arguments as Product;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  ProductDetailsScreen(product: product),
          );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  AddressScreen(totalAmount: totalAmount),
          );
     case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Screen Does not Exist!'),
            ),
          ),
          );
  }
}