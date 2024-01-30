// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/membermodel.dart';
class Mainprovider extends ChangeNotifier{
Membermodel? members;
Modeldatas? datas;
List memberlogin = [];
List memberpass = [];
  checker(String login, String pass) {
  notifyListeners();
    for (var element in memberlogin) {
      for (var elements in memberpass) {
        // print('$elements $element se');
        if (element == login && elements == pass) {
          return true;
        }
      }
    }
  notifyListeners();
    return false;
  }

getlogins() async {
  notifyListeners();
  var a = await http.get(
    Uri.parse('https://easymobile.uz/agency/getlogins'),
  );
  print(a.body);
  members = Membermodel(member: jsonDecode(a.body));
  print(members?.member);
  members?.member.forEach((key, value) {
    memberlogin.add(key);
    memberpass.add(value);
  });
  notifyListeners();
}
createnewmember(BuildContext context, String login, String password) async {
  notifyListeners();

  var a = await http.post(Uri.parse("https://easymobile.uz/agency/create?login=$login&password=$password"));
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: a.body,
    ),
);
  notifyListeners();

}

getdata({String login = ""})async{
  notifyListeners();
  var data = await http.post(Uri.parse("https://easymobile.uz/agency/getdata?login=$login"));
  datas = Modeldatas.fromJson(jsonDecode(utf8.decode(data.bodyBytes)));
  notifyListeners();
}

}