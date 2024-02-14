import 'dart:convert';
import 'package:amazon_admin_panel/features/home/screens/home_screen.dart';
import 'package:amazon_admin_panel/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amazon_admin_panel/constants/error_handling.dart';
import 'package:amazon_admin_panel/constants/global_variable.dart';
import 'package:amazon_admin_panel/constants/util.dart';
import 'package:amazon_admin_panel/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthService {
  //Sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []);

      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          //body: user.toJson(),
          body: jsonEncode({
            "name": name,
            "email": email,
            "password": password,
          }));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Created! Login with the same credentials!");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/signIn"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }

      if (response == true) {
        //get user data
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
