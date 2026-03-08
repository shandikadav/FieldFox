import 'dart:async';

import 'package:field_fox/routes/route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(
        Duration(seconds: 2),
        (() => route.pushReplacementNamed(
              RouteName.signin,
            )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF58235),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/logo_putih.png'),
            Text(
              'FieldFox',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Color(0xFFF58235),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
