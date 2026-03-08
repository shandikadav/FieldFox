import 'package:field_fox/pages/badminton_page.dart';
import 'package:field_fox/pages/bantuan_page.dart';
import 'package:field_fox/pages/basket_page.dart';
import 'package:field_fox/pages/chat_page.dart';
import 'package:field_fox/pages/favorit_page.dart';
import 'package:field_fox/pages/futsal_page.dart';
import 'package:field_fox/pages/gym_page.dart';
import 'package:field_fox/pages/komunitas_page.dart';
import 'package:field_fox/pages/signin_screen.dart';
import 'package:field_fox/pages/main_page.dart';
import 'package:field_fox/pages/menu_lapangan_page.dart';
import 'package:field_fox/pages/notifikasi_page.dart';
import 'package:field_fox/pages/renang_page.dart';
import 'package:field_fox/pages/sepakbola_page.dart';
import 'package:field_fox/pages/splash_screen.dart';
import 'package:field_fox/pages/voli_page.dart';
import 'package:field_fox/routes/route.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      routerConfig: route,
    );
  }
}
