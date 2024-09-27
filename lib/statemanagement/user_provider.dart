import 'package:flutter/material.dart';
import 'package:store_app/model/usermodel.dart';

class UserProvider with ChangeNotifier {
  String? username;
  Usermodel? userdata;
  void setUserData(Usermodel user) {
    userdata = user;
    notifyListeners();
  }
}
