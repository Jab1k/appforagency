import 'package:flutter/material.dart';

class Mainprovider extends ChangeNotifier{
  

List memberlogin = [];
List memberpass = [];
  checker(String login, String pass) {
    for (var element in memberlogin) {
      for (var elements in memberpass) {
        // print('$elements $element se');
        if (element == login && elements == pass) {
          return true;
        }
      }
    }
    return false;
  }

}