import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/style/custom_paint.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/home_page.dart';
import 'package:dovi_me/views/pages/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Themes themes = Themes();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool visiblEye = false;
  String? _username;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    print(utf8.encode(_password!));
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset('images/undraw_profile.svg',
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .8),
                // const SizedBox(height: 20),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * .75,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                        color: lightGreen,
                      ),
                      child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Register',
                                  style: themes.headline0,
                                ),
                              ],
                            ),
                            Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Email',
                                          style: themes.subtitleLableText),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: lighBlue,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: blackich,
                                        )),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: greenich,
                                        )),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is required!!';
                                        } else if (validateEmail()) {
                                          return 'email not valid';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Username',
                                          style: themes.subtitleLableText),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: lighBlue,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: blackich,
                                        )),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: greenich,
                                        )),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is required!!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Password',
                                          style: themes.subtitleLableText),
                                    ),
                                    TextFormField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: visiblEye,
                                      decoration: InputDecoration(
                                        suffixIcon: visiblEye
                                            ? IconButton(
                                                icon: const Icon(
                                                    Icons
                                                        .visibility_off_rounded,
                                                    color: blackich),
                                                onPressed: () => setState(() {
                                                      visiblEye = !visiblEye;
                                                    }))
                                            : IconButton(
                                                icon: const Icon(
                                                    Icons.visibility,
                                                    color: blackich),
                                                onPressed: () => setState(() {
                                                      visiblEye = !visiblEye;
                                                    })),
                                        filled: true,
                                        fillColor: lighBlue,
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                          color: blackich,
                                        )),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                          color: greenich,
                                        )),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is required!!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    )
                                  ],
                                )),
                            const SizedBox(height: 30),
                            Align(
                              child: InkWell(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    decoration: BoxDecoration(
                                        color: blackich,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Text(
                                        'SIGN UP',
                                        style: themes.bodyText2
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    final FirebaseAuth firebaseAuth =
                                        FirebaseAuth.instance;
                                    final CollectionReference users =
                                        FirebaseFirestore.instance
                                            .collection('users');
                                    Map user = {
                                      'id': users.doc(),
                                      'username': _username,
                                      'email': _email,
                                      'pwd': utf8.encode(_password!)
                                    };
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        // getting signed up with email and password and creating a new account//
                                        await firebaseAuth
                                            .createUserWithEmailAndPassword(
                                                email: _email!,
                                                password: _password!);
                                        // adding user to users collection//
                                        Fluttertoast.showToast(
                                            msg: 'Signed up successfully',
                                            backgroundColor: Colors.red);
                                        await users.add(user);
                                      } catch (e) {
                                        Fluttertoast.showToast(
                                            msg: e.toString(),
                                            backgroundColor: Colors.red);
                                      }
                                    }
                                    Get.to(const MyHomePage());
                                  }),
                            ),
                            const SizedBox(height: 10),
                            Align(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                  Expanded(
                                      child: Divider(
                                          height: 40,
                                          endIndent: 10,
                                          color: blackich)),
                                  Text('Or'),
                                  Expanded(
                                      child: Divider(
                                          indent: 10,
                                          height: 40,
                                          color: blackich))
                                ])),
                            CircleAvatar(
                                radius: 30,
                                backgroundColor: lighBlue,
                                child: SvgPicture.asset(
                                    'images/flat-color-icons_google.svg')),
                            const SizedBox(height: 8),
                            Align(
                              child: RichText(
                                  text: TextSpan(
                                      text: 'already have account? ',
                                      style: themes.subtitleLableText,
                                      children: [
                                    TextSpan(
                                        text: 'Log In',
                                        style: themes.bodyText2,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Get.to(const LogIn()))
                                  ])),
                            )
                          ])),
                ),
              ])),
    );
  }
}
