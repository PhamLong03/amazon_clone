// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          userType: '',
          token: '');
      print(user.toJson());

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "*",
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created');
          });
      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control_Allow_Origin": "*",
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString('auth-token', jsonDecode(res.body)['token']);
            await prefs.setString('auth-id', jsonDecode(res.body)['_id']);
            showSnackBar(context, 'Logged in');
          });
      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      print('get user data\n');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth-token');
      String? id = prefs.getString('auth-id');
      print('old: $token\n');
      print('old: $id');

      if (token == null || id == null || token.isEmpty || id.isEmpty) {
        prefs.setString('auth-token', '');
        prefs.setString('auth-id', '');
        print('setted');
      }

      var tokenRes = await http
          .post(Uri.parse('$uri/api/validate'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': token!,
        'auth-id': id!,
      });

      var res = jsonDecode(tokenRes.body);

      if (res == true) {
        print('true: true');
        http.Response userRes = await http
            .get(Uri.parse('$uri/validate'), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
          'auth-id': id,
        });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
