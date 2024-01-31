// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_function_literals_in_foreach_calls, avoid_print, must_be_immutable
import 'package:app_for_agency/pages/splash/splash.dart';
import 'package:app_for_agency/repo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repo/sharedprofems/shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ischek = true;
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final event = context.read<Mainprovider>();
    final state = context.watch<Mainprovider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 580),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Text(
                    'Hisob-Kitobni biz bilan osonlashtiring!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15, right: 10),
                    child: Text(
                      '+998 33 608 86 66',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff2E8B57),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () async {
                    final uri = Uri(
                      scheme: 'tel',
                      path: '33 608 86 66',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      print('es');
                    }
                  },
                ),
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      '+998 90 608 86 66',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff2E8B57),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () async {
                    final uri = Uri(
                      scheme: 'tel',
                      path: '90 608 86 66',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      print('es');
                    }
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 70,left: 50, right: 50),
              child: SizedBox(
                child: Image.asset("assets/logo.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 220),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildUsername(),
                  const SizedBox(height: 15),
                  _buildPassword(),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff2E8B57)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        color: const Color(0xff2E8B57),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    onTap: () async {
                      print('salom ${_passwordController.text} ${_usernameController.text}');
                      if (await event.checker(_usernameController.text,_passwordController.text) ??false) {
                      print('salom ${_passwordController.text} ${_usernameController.text}');

                        await UserSimplePreferences.setisLogin(true);
                        await UserSimplePreferences.setlogin(_usernameController.text);
                        await UserSimplePreferences.setpass(_passwordController.text);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
                          return const SplashPage();
                        },), (route) => false);
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message: "Login Yoki Parol Noto'g'ri!",
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        labelText: 'Login',
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }
}
