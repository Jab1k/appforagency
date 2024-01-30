// ignore_for_file: use_build_context_synchronously, unused_import, unused_element, non_constant_identifier_names, await_only_futures, unused_local_variable

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:app_for_agency/pages/login_pages/login_page.dart';
import 'package:app_for_agency/repo/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../homepage/homepage.dart';
import '../../repo/sharedprofems/shared.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

bool Islog = false;
String login = "";
String pass = "";
int id = 0;
String number = "";

class _SplashPageState extends State<SplashPage> {
   Future<void> _navigateToMainScreen() async {
    context.read<Mainprovider>().getlogins();
    Islog = await UserSimplePreferences.getislogin() ?? false;
    login = await UserSimplePreferences.getlogin() ?? "";
    pass = await UserSimplePreferences.getpass() ?? "";
    if (Islog) {
      
    context.read<Mainprovider>().getdata(login: login);
      await Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ), (route) => false);
      });
    } else {
      await Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ), (route) => false);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToMainScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<Mainprovider>();
    final state = context.watch<Mainprovider>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          event.isloading ? Image.asset("assets/logo.png") : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
