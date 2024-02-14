import 'dart:convert';

import 'package:amazon_admin_panel/constants/error_handling.dart';
import 'package:amazon_admin_panel/constants/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';

class SearchServices {
Future<List<Product>> fetchSearchProducts({
  required BuildContext context,
  required String searchQuery,
}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products/search/s$searchQuery'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(Product.fromJson(jsonEncode(
                jsonDecode(res.body)[i],
              )));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}