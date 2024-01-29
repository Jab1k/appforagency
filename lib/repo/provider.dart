import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/membermodel.dart';
class Mainprovider extends ChangeNotifier{
Membermodel? members;

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

getlogins() async {
  var a = await http.get(
    Uri.parse('https://easymobile.uz/getmembers'),
  );
  print(a.body);
  members = Membermodel(member: jsonDecode(a.body));
  print(members?.member);
  members?.member.forEach((key, value) {
    memberlogin.add(key);
    memberpass.add(value);
  });
}

}