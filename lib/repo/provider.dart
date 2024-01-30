// ignore_for_file: unnecessary_string_interpolations, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:app_for_agency/pages/homepage/homepage.dart';
import 'package:app_for_agency/repo/sharedprofems/shared.dart';
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
    for (var element in members?.member ?? []) {
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
    if (pageController.hasClients) {
      pageController.animateToPage(
        current,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    }
    notifyListeners();
  }

  void addnewtokarzinka(
      {required int indexs,
      required List oliv,
      required BuildContext context}) {
    print("$karzinka $oliv");
    if ((oliv[indexs][6] ?? 0) >= 1 &&
        oliv[indexs][2] + 1 <= (oliv[indexs][6] ?? 0)) {
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
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Bu baxsulot ${oliv[indexs][6] ?? 0}dan ko'p emas",
        ),
      );
    }
  }

  void addfornew({required int index, required BuildContext context}) {
    print(karzinka[index][2]);
    if ((karzinka[index][6] ?? 0) >= 1 &&
        karzinka[index][2] + 1 <= (karzinka[index][6] ?? 0)) {
      karzinka[index][2] += 1;
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Bu baxsulot ${karzinka[index][6] ?? 0}dan ko'p emas",
        ),
      );
    }
    notifyListeners();
  }

  void minimizefornew({required int index}) {
    karzinka[index][2] -= 1;
    if (karzinka[index][2] == 0) {
      karzinka.removeWhere((element) => karzinka[index][0] == element[0]);
    }
    notifyListeners();
  }

  void minimazekarzinka({required int index, required List oliv}) {
    oliv[index][2] = oliv[index][2] - 1;
    if (oliv[index][2] == 0) {
      karzinka.removeWhere((element) => oliv[index][0] == element[0]);
    }
    print(karzinka);
    notifyListeners();
  }

  getlogins() async {
    isloading = true;
    notifyListeners();
    var a = await http.get(
      Uri.parse('https://easymobile.uz/agency/getlogins'),
      headers: {'Content-Type': 'application/javascript'},
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

    var a = await http.post(
      Uri.parse(
          "https://easymobile.uz/agency/create?login=$login&password=$password"),
      headers: {'Content-Type': 'application/javascript'},
    );
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: a.body,
      ),
    );
    isloading = false;
    notifyListeners();
  }

  String login = "";
  String pass = "";
  postdata({required List oliv, required BuildContext context}) async {
    isloading = true;
    notifyListeners();
    print(oliv);
    login = await UserSimplePreferences.getlogin() ?? "";
    pass = await UserSimplePreferences.getpass() ?? "";
    final data = await http.post(
      Uri.parse(
          "https://easymobile.uz/send_message_agency?login=$login&password=$pass"),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"1": oliv}),
    );
    
    if(data.statusCode == 200){
      showTopSnackBar(
      Overlay.of(context),
       const CustomSnackBar.success(
        message: "Muvoffaqiyatli jo'natildi",
      ),
    );
    }else{
      showTopSnackBar(
      Overlay.of(context),
       const CustomSnackBar.error(
        message: "Muvoffaqiyatli jo'natilmadi",
      ),
    );
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
                  return const HomePage();
                },), (route) => false);
    isloading = false;
    notifyListeners();
  }

  getdata({String login = ""}) async {
    isloading = true;
    notifyListeners();
    var data = await http.post(
      Uri.parse("https://easymobile.uz/agency/getdata?login=$login"),
      headers: {'Content-Type': 'application/javascript'},
    );
    print(data.body);
    datas = Modeldatas.fromJson(jsonDecode(utf8.decode(data.bodyBytes)));
    print(datas?.datas);
    isloading = false;
    notifyListeners();
  }

  //
}
