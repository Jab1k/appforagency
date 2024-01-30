// ignore_for_file: use_build_context_synchronously, avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/membermodel.dart';

class Mainprovider extends ChangeNotifier {
  int current = 0;
  String last = "";
  Membermodel? members;
  Modeldatas? datas;
  bool isloading = true;
  List karzinka = [];
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

  indexpages(int index, PageController pageController) {
    current = index;
    notifyListeners();
    if(pageController.hasClients){
      pageController.animateToPage(
      current,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    }
    notifyListeners();

  }

  
  void addnewtokarzinka({required int indexs, required List oliv, required BuildContext context}) {
    print("$karzinka $oliv");
    if((oliv[indexs][6] ?? 0) >=1 && oliv[indexs][2] +1 <= (oliv[indexs][6] ?? 0)){
      print(oliv[indexs][6]);
      oliv[indexs][2] += 1;
    bool itemExists = false;
    for (int index = 0; index < karzinka.length; index++) {
      if (karzinka[index][0] == oliv[indexs][0]) {
        print(karzinka[index][0]);
        print(oliv[indexs][0]);
        karzinka[index][2] = oliv[indexs][2];
        itemExists = true;
        break;
      }
    }
    notifyListeners();

    if (!itemExists) {
      // If the item doesn't exist, add it to the karzinka list
      karzinka.add(oliv[indexs]);
    }
    print(karzinka);
    notifyListeners();
    }else{
      showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: "Bu baxsulot ${oliv[indexs][6] ?? 0}dan ko'p emas",
      ),
    );
    }
  }

  
  void addfornew({required int index}) {
    print(karzinka[index][2]);
    karzinka[index][2] += 1;
    notifyListeners();
  }

  void minimizefornew({required int index}) {
    karzinka[index][2] -= 1;
    notifyListeners();
  }

  void minimazekarzinka({required int index, required List oliv}) {
    oliv[index][2] = oliv[index][2] - 1;
    notifyListeners();
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

    var a = await http.post(Uri.parse(
        "https://easymobile.uz/agency/create?login=$login&password=$password"));
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: a.body,
      ),
    );
    isloading = false;
    notifyListeners();
  }

  getdata({String login = ""}) async {
    isloading = true;
    notifyListeners();
    var data = await http
        .post(Uri.parse("https://easymobile.uz/agency/getdata?login=$login"));
    print(data.body);
    datas = Modeldatas.fromJson(jsonDecode(utf8.decode(data.bodyBytes)));
    print(datas!.datas);
    isloading = false;
    notifyListeners();
  }
}
