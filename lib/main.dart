import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/log_in.dart';
import 'package:dovi_me/views/pages/try.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //TODO: getx storage and auto log in i am trying to be best with new step up `this new keyboard

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: const LogIn(),
    );
  }
}
