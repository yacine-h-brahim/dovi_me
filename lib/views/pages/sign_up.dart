import 'package:dovi_me/style/custom_paint.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Themes themes = Themes();
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool visiblEye = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(children: [
            SvgPicture.asset('images/undraw_profile.svg',
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .8),
            const SizedBox(height: 20),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                      color: lightGreen,
                    ),
                    child: Center(
                      child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              'SignUp',
                              style: themes.headline0,
                            ),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: lighBlue,
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1,
                                          color: greenich,
                                        )),

                                        // label: Text('Email',
                                        //     style: themes.subtitleLableText)
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'this field is required!!';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
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
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                          width: 1,
                                          color: greenich,
                                        )),
                                        // label: Text('Password',
                                        //     style: themes.subtitleLableText)
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
                            const SizedBox(height: 8),
                            InkWell(
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width * .7,
                                  decoration: BoxDecoration(
                                      color: blackich,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      'LOG IN',
                                      style: themes.bodyText2
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => const MyHomePage()));
                                }),
                            const SizedBox(height: 30),
                            Row(children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Expanded(
                                  child: Divider(
                                    height: 40,
                                    endIndent: 10,
                                    color: blackich,
                                  ),
                                ),
                              ),
                              const Text('Or'),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: const Expanded(
                                  child: Divider(
                                    indent: 10,
                                    height: 40,
                                    color: blackich,
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(height: 8),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: lighBlue,
                              child: SvgPicture.asset(
                                'images/flat-color-icons_google.svg',
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                                text: TextSpan(text: '', children: [
                              TextSpan(
                                  text: 'Don\'t have account? ',
                                  style: themes.subtitleLableText),
                              TextSpan(
                                  text: 'Create now', style: themes.bodyText2)
                            ]))
                          ]),
                    ))),
          ])),
    );
  }
}
//  Column(children: [
//         SizedBox(height: 279),
//         Text(
//           'Login',
//           style: themes.headline0,
//         ),
//         TextFormField(
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//               filled: true,
//               fillColor: grey48,
//               border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(12)),
//               label: Text('Client name', style: themes.subtitleLableText)),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'this field is required!!';
//             } else {
//               return null;
//             }
//           },
//         ),
//       ]),