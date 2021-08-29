import 'package:flutter/material.dart';
import 'package:karma/API/user_api.dart';
import 'package:provider/provider.dart';

class ProviderModel {
  UserAPI ?userAPI;
  ProviderModel initialize(BuildContext context) {
    userAPI = Provider.of<UserAPI>(context);
    return this;
  }
}
