import 'package:dovi_me/style/custom_paint.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => const MyHomePage()));
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
                                  text: TextSpan(text: '', children: [
                                TextSpan(
                                    text: 'don\'t have account yet? ',
                                    style: themes.subtitleLableText),
                                TextSpan(
                                    text: 'Create now', style: themes.bodyText2)
                              ])),
                            )
                          ])),
                ),
              ])),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, h);
    // Offset point1 = Offset(10, size.height - 10);
    Offset thePick1 = Offset(w * .15, size.height - (size.height * .65));
    Offset thePick = Offset(size.width * .5, size.height - (size.height * .8));
    Offset thePick2 =
        Offset(size.width * .85, size.height - (size.height * .65));
    // Offset point2 = Offset(size.width - 10, size.height - 10);
    path.quadraticBezierTo(thePick1.dx, thePick1.dy, thePick2.dx, thePick2.dy);
    // path.quadraticBezierTo(thePick.dx, thePick.dy, thePick2.dx, thePick2.dy);
    path.quadraticBezierTo(thePick2.dx, thePick2.dy, size.width, 0);
    path.quadraticBezierTo(thePick2.dx, thePick2.dy, size.width, 0);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
