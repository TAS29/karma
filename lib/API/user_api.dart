import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:karma/main.dart';
import 'package:karma/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';

class UserAPI extends ChangeNotifier {
  LoginModel? loginResponse;
  Future<bool> login({
    String? username,
    String? password,
  }) async {
    try {
      Response res = await Dio().post(
        API.login,
        data: {"username": username, "password": password},
      );
      if (res.statusCode == 200) {
        if (res.data['token'].isNotEmpty) {
          SharedPreferences p = await SharedPreferences.getInstance();
          p.setBool('isLogin', true);
          p.setString(
            'userDetails',
            jsonEncode(
              {
                'name': 'Tanay',
                'location': 'Udaipur',
                'mobile': '+919879879879',
                'interest': 'Football'
              },
            ),
          );
          userData = {
            'name': 'Tanay',
            'location': 'Udaipur',
            'mobile': '+919879879879',
            'interest': 'Football'
          };
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
