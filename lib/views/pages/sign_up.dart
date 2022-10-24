import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/modules/user.dart';
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
  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateUsername(String username) {
    return RegExp(r'^[a-zA-Z0-9_]').hasMatch(username);
  }

  bool validatePassword(String pwd) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(pwd);
  }

  Themes themes = Themes();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool visiblEye = false;
  String? _username;
  String? _email;
  String? _pwd = 'password';

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
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
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                                          onChanged: (value) => _email = value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'this field is required!!';
                                            } else if (!validateEmail(
                                                _email!)) {
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
                                          onChanged: (value) =>
                                              _username = value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'this field is required!!';
                                            } else if (!validateUsername(
                                                _username!)) {
                                              return 'username format not valid';
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
                                              errorMaxLines: 2,
                                              suffixIcon: visiblEye
                                                  ? IconButton(
                                                      icon: const Icon(
                                                          Icons
                                                              .visibility_off_rounded,
                                                          color: blackich),
                                                      onPressed: () =>
                                                          setState(() {
                                                            visiblEye =
                                                                !visiblEye;
                                                          }))
                                                  : IconButton(
                                                      icon: const Icon(
                                                          Icons.visibility,
                                                          color: blackich),
                                                      onPressed: () =>
                                                          setState(() {
                                                            visiblEye =
                                                                !visiblEye;
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
                                            onChanged: (value) => _pwd = value,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'this field is required!!';
                                              }
                                              // else if (!validatePassword(
                                              //     _pwd!)) {
                                              //   return 'password must containe at leaste 1 Upper/Lower case, 1 Diget, 1 Special Character, length> 8 🧐🧐';
                                              // }
                                              else {
                                                return null;
                                              }
                                            })
                                      ],
                                    )),
                                const SizedBox(height: 30),
                                Align(
                                  child: InkWell(
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        decoration: BoxDecoration(
                                            color: blackich,
                                            borderRadius:
                                                BorderRadius.circular(4)),
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

                                        if (formKey.currentState!.validate()) {
                                          try {
                                            // getting signed up with email and password and creating a new account//
                                            UserCredential userCredenials =
                                                await firebaseAuth
                                                    .createUserWithEmailAndPassword(
                                                        email: _email!,
                                                        password: _pwd!);
                                            if (userCredenials.user != null) {
                                              // >>>>> creating the instance in firestore db <<<<///
                                              final DocumentReference
                                                  documentReference = users.doc(
                                                      userCredenials.user!.uid);
                                              final Map<String, dynamic> user =
                                                  {
                                                'id': userCredenials.user!.uid,
                                                'username': _username,
                                                'email': _email,
                                                'pwd': _pwd,
                                                'photoUrl':
                                                    'https://www.gravatar.com/avatar/69eb72fa6d3f122439c458d6feb37185?s=256&d=identicon&r=PG&f=1'
                                              };
                                              await documentReference.set(user);
                                              // adding user to users collection//

                                              Get.put(UserAccount(
                                                id: user['id'],
                                                email: user['email'],
                                                pwd: user['pwd'],
                                                username: user['username'],
                                                photoUrl: user['photoUrl'],
                                              ));

                                              Fluttertoast.showToast(
                                                  msg: 'Signed up successfully',
                                                  backgroundColor:
                                                      Colors.green);

                                              Get.off(const MyHomePage());
                                            }
                                          } catch (e) {
                                            Fluttertoast.showToast(
                                                msg: e.toString(),
                                                backgroundColor: Colors.red);
                                          }
                                        }
                                      }),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            ..onTap =
                                                () => Get.off(const LogIn()))
                                    ])))
                              ])))
                ])));
  }
}
