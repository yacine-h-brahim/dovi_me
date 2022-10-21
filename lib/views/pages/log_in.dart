import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/home_page.dart';
import 'package:dovi_me/views/pages/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Themes themes = Themes();
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool visiblEye = false;
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
                                          ))),
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
                                  onTap: () {
                                    Get.to(const MyHomePage());
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
                                          ..onTap = () => Get.to(SignUp))
                                  ])),
                            )
                          ])),
                ),
              ])),
    );
  }
}
