// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_function_literals_in_foreach_calls, avoid_print, must_be_immutable
import 'package:app_for_agency/repo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../sharedprofems/shared.dart';

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
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Hisob-Kitobni biz bilan osonlashtiring!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
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
                        color: Color.fromARGB(255, 74, 141, 197),
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
                        color: Color.fromARGB(255, 74, 141, 197),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                
                _buildUsername(),
                const SizedBox(height: 15),
                _buildPassword(),
                const SizedBox(height: 15),
                InkWell(
                  child: Container(
                    height: 77,
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),
                  onTap: () async {
                    print('salom ');
                    if (event.checker(_usernameController.text,
                            _passwordController.text) ??
                        false) {
                      await UserSimplePreferences.setisLogin(true);
                    }else{
                      showTopSnackBar(
    Overlay.of(context),
    const CustomSnackBar.error(
      message:
          "Login Yoki Parol Noto'g'ri!",
          
    ),
);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 10),
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          labelText: 'Username',
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
      child: TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          labelText: 'Password',
        ),
        obscureText: true,
      ),
    );
  }
}
