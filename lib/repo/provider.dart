// ignore_for_file: use_build_context_synchronously, avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/membermodel.dart';
class Mainprovider extends ChangeNotifier{
Membermodel? members;
Modeldatas? datas;
bool isloading = true;
  checker(String login, String pass) {
  isloading = true;
  notifyListeners();
    for (var element in members!.member) {
      if (element[0] == login && element[1] == pass) {
        return true;
      } else {
        return false;
      }
    }
  isloading = false;
  notifyListeners();
    return false;
  }

getlogins() async {
  isloading = true;
  notifyListeners();
  var a = await http.get(
    Uri.parse('https://easymobile.uz/agency/getlogins'),
  );
  print(a.body);
  members = Membermodel(member: jsonDecode(a.body));
  print(members?.member);
  isloading = false;
  notifyListeners();
}
createnewmember(BuildContext context, String login, String password) async {
  isloading = true;
  notifyListeners();

  var a = await http.post(Uri.parse("https://easymobile.uz/agency/create?login=$login&password=$password"));
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: a.body,
    ),
);
  isloading = false;
  notifyListeners();

}

getdata({String login = ""})async{
  isloading = true;
  notifyListeners();
  var data = await http.post(Uri.parse("https://easymobile.uz/agency/getdata?login=$login"));
  datas = Modeldatas.fromJson(jsonDecode(utf8.decode(data.bodyBytes)));
  isloading = false;
  notifyListeners();
}


}