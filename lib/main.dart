import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.blue,
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: blackich),
              backgroundColor: Colors.white),
          fontFamily: 'Poppins'),
      home: const SignUp(),
    );
  }
}
