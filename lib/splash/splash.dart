// ignore_for_file: use_build_context_synchronously, unused_import, unused_element, non_constant_identifier_names

import 'package:app_for_agency/login_pages/login_page.dart';
import 'package:app_for_agency/repo/provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../homepage/homepage.dart';
import '../sharedprofems/shared.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

bool Islog = false;
int id = 0;
String number = "";

class _SplashPageState extends State<SplashPage> {
  Future<void> _navigateToMainScreen() async {
    Islog = await UserSimplePreferences.getislogin() ?? false;
    if (Islog) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ), (route) => false);
    }
  }

  @override
  void initState() {
    _navigateToMainScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/splash.json",),
        ],
      ),
    );
  }
}
