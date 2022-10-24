import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/controllers/validation.dart';
import 'package:dovi_me/modules/user.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/home_page.dart';
import 'package:dovi_me/views/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

//TODO: ADD REMENMBRE ME BUTTON
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Themes themes = Themes();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visiblEye = false;
  String? _email;
  String? _pwd;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset('images/welcome_cats.svg',
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.width * .8),
                const SizedBox(height: 20),
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
                                  'Log In',
                                  style: themes.headline0,
                                ),
                              ],
                            ),
                            Form(
                                key: _formKey,
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
                                      onChanged: (value) => _email = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is required!!';
                                        } else if (!validateEmail(_email!)) {
                                          return 'email not valid 🙂🙂';
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
                                          ))),
                                      onChanged: (value) => _pwd = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is required!!';
                                        }
                                        // else if (!validatePassword(_pwd!)) {
                                        //   return 'password must containe at leaste 1 Upper/Lower case, 1 Diget, 1 Special Character, length> 8 🧐🧐';
                                        // }
                                        else {
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
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      decoration: BoxDecoration(
                                          color: blackich,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                          child: Text(
                                        'LOG IN',
                                        style: themes.bodyText2
                                            .copyWith(color: Colors.white),
                                      ))),
                                  onTap: () async {
                                    //TODO: OUTLINE THIS TO EXTERNAL METHOD
                                    //ADD STREAM TO UNFOCUS THE LOGIN BUTTON
                                    ////GET STORAGE TO SAVE LOGINS(REMEMBRE ME)
                                    if (_formKey.currentState!.validate()) {
                                      final FirebaseAuth firebaseAuth =
                                          FirebaseAuth.instance;
                                      final CollectionReference users =
                                          FirebaseFirestore.instance
                                              .collection('users');

                                      try {
                                        UserCredential userCredenials =
                                            await firebaseAuth
                                                .signInWithEmailAndPassword(
                                                    email: _email!,
                                                    password: _pwd!);
                                        if (userCredenials.user != null) {
                                          // GET FROM FIRESTORE
                                          final DocumentSnapshot user =
                                              await users
                                                  .doc(userCredenials.user!.uid)
                                                  .get();

                                          Get.put(UserAccount(
                                            id: user['id'],
                                            email: user['email'],
                                            pwd: user['pwd'],
                                            username: user['username'],
                                            photoUrl: user['photoUrl'] ??
                                                'https://www.gravatar.com/avatar/69eb72fa6d3f122439c458d6feb37185?s=256&d=identicon&r=PG&f=1',
                                          ));

                                          Fluttertoast.showToast(
                                              msg: 'sign in successfully',
                                              backgroundColor: Colors.green);

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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(
                                      // flex: 1,
                                      child: Divider(
                                        height: 40,
                                        endIndent: 10,
                                        color: blackich,
                                      ),
                                    ),
                                    Text('Or'),
                                    Expanded(
                                      // flex: 1,
                                      child: Divider(
                                        indent: 10,
                                        height: 40,
                                        color: blackich,
                                      ),
                                    )
                                  ]),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: lighBlue,
                              child: SvgPicture.asset(
                                'images/flat-color-icons_google.svg',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              child: RichText(
                                  text: TextSpan(
                                      text: 'don\'t have account yet? ',
                                      style: themes.subtitleLableText,
                                      children: [
                                    TextSpan(
                                        text: 'Create now',
                                        style: themes.bodyText2,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.off(const SignUp());
                                          })
                                  ])),
                            ),
                            const SizedBox(height: 10)
                          ])),
                ),
              ])),
    );
  }
}
