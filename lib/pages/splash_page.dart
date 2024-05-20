import 'dart:async';

import 'package:app_cuoiki/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Route route = MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
      Navigator.pushAndRemoveUntil(
        context,
        route,
        (Route<dynamic> route) => false,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/background.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(
              'images/logo.png',
              width: 160.0,
            ),
          ), 
        ],
      ),
    );

  }
}